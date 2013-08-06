<?php
 

$plugin_info = array(
	'pi_name'			=> 'Structure Migration EE 2 Step',
	'pi_version'		=> '1.0',
	'pi_author'			=> 'Thomas Brewer | Visual Chefs LLC',
	'pi_description'	=> 'Second step in EE1 to EE2 upgrade of Structure module',
	'pi_usage'			=> 'Backup everything first ..... please .... No seriously :-( ... Thanks :-)',
);   

class Structure_migration {
	
	protected $EE;
	
	protected $listing_channels 			= array();
	
	protected $old_structure_settings 		= array();  
	        
	protected $structure_channel_data 		= array();
	
	protected $channels 					= array(); 
	
	protected $old_site_pages 				= array();
	
	/**
	 * __construct
	 *
	 * @access public
	 * @param  void	
	 * @return void
	 * 
	 **/
	public function __construct() 
	{
		$this->EE = get_instance();
	}
	 
	/**
	 * setup
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function setup() 
	{       
        $this->old_structure_settings = $this->EE->db->from('migration_structure_settings')->get()->result_array();
	   	   
		$this->old_site_pages = $this->EE->db->from('exp_migration_site_pages')->get()->result_array();	         	
	} 
	
	
	/**
	 * migrate_site_pages
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function migrate_site_pages() 
	{
		foreach ($this->old_site_pages as $old_site) 
		{   
			
			$site_pages = array(
			 	'site_pages' => base64_encode($old_site['site_pages']),
			);                                                                
			
			$this->EE->db->where('site_id', $old_site['site_id'])->update('sites', $site_pages);
		}
	} 
	
	/**
	 * migrate_structure_table
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function migrate_structure_table() 
	{    
		//remove the root node we do not need it... it will only cause us problems...
		$this->EE->db->where('site_id', 0)->delete('structure');
		
		$old_entries = $this->EE->db->from('migration_structure')->get()->result_array();
		
		foreach ($old_entries as $old_entry) 
		{                            		
			$new_entry = $this->_remap_structure_table_data($old_entry);
			 
			//does it have a listing_cid value?
			if (isset($new_entry['listing_cid']) AND !empty($new_entry['listing_cid']))
			{   
				//store it.... we will need it later to split out the structure type into page and listing types
				$this->listing_channels[] = $new_entry['listing_cid'];
			}
                                 
			$this->EE->db->insert('structure', $new_entry);
		}   
	}    
	
	/**
	 * generate_structure_channel_table
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function generate_structure_channel_table() 
	{
		foreach ($this->old_structure_settings as $settings) 
		{
			if (strpos($settings['var'], 'type_weblog_') !== FALSE)
			{   
				$channel_id =  str_replace('type_weblog_', '', $settings['var']);  
				
				$this->_add_channel_data($channel_id, 'site_id', $settings['site_id']);
				
				$this->_add_channel_data($channel_id, 'channel_id', $channel_id);
				
				//figure out type
				$type = 'unmanaged';
				                                                   
				if ($settings['var_value'] === 'asset')
				{
					$type = 'asset';
				}  
				else if ($settings['var_value'] === 'structure')
				{
					if (in_array($channel_id, $this->listing_channels))
					{
						$type = 'listing';
					}                   
					else
					{
						$type = 'page';
					}
				}
				
				$this->_add_channel_data($channel_id, 'type', $type);
			}
			
			if (strpos($settings['var'], 'template_weblog_') !== FALSE)
			{
				$channel_id =  str_replace('template_weblog_', '', $settings['var']);
				$this->_add_channel_data($channel_id, 'template_id', $settings['var_value']);
			}
		}                   
		
		//we have the data we need now...
		foreach ($this->structure_channel_data as $data) 
		{
		   $this->EE->db->insert('structure_channels', $data);
		}              
	}     
	
	
	/**
	 * generate_structure_listing_table
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function generate_structure_listings_table() 
	{
		// $default = array(
		// 	'site_id' => '',
		// 	'entry_id' => '',
		// 	'parent_id' => '',
		// 	'channel_id' => '',
		// 	'template_id' => '',
		// 	'uri' => '',
		// );              
		
		//get all structure entries that have listings
		$structure_entries = $this->EE->db->from('structure as s')
			->join('structure_channels as sc', 'sc.channel_id = s.listing_cid')
			->where('listing_cid !=', 0)
			->get()
			->result_array();
		 
		$site_pages = array();
		
		foreach ($this->old_site_pages as $site) 
		{          
			$site_pages[$site['site_id']] = unserialize($site['site_pages']);
		}        
	  
		foreach ($structure_entries as $listing_entry) 
		{
			$data = array(
				'site_id' 		=> $listing_entry['site_id'],
				'parent_id' 	=> $listing_entry['channel_id'],
				'channel_id' 	=> $listing_entry['listing_cid'],
				'template_id' 	=> $listing_entry['template_id'],  
			);                                                 
			 
			//find all the entries for this listing
			$channel_entries = $this->EE->db->from('channel_titles')
				->where('channel_id', $listing_entry['listing_cid'])
				->get()
				->result_array();
			 
			foreach ($channel_entries as $channel_entry) 
			{   
				//if this entry is in site_pages get it uri and add it to the structure listings table  
				if (isset($site_pages[$listing_entry['site_id']]) 
					AND isset($site_pages[$listing_entry['site_id']][$listing_entry['site_id']]) 
					AND isset($site_pages[$listing_entry['site_id']][$listing_entry['site_id']]['uris'][$channel_entry['entry_id']]) 
				   ) 
				{
					$listing_entry = array_merge($data, array(
						'entry_id'  =>  $channel_entry['entry_id'],
						'uri'  		=>  $site_pages[$listing_entry['site_id']][$listing_entry['site_id']]['uris'][$channel_entry['entry_id']],
					));                                                                                                                  
		              
					$this->EE->db->insert('structure_listings', $listing_entry);
				}
			}                                   
			
		}   
   	}        
	
	/**
	 * _add_channel_data
	 *
	 * @access protected
	 * @param  int $channel_id
	 * @param  string $key
	 * @param  string $value
	 * @return void
	 * 
	 **/
	protected function _add_channel_data($channel_id, $key, $value) 
	{
		if (!isset($this->structure_channel_data[$channel_id]))
		{
			$this->structure_channel_data[$channel_id] = array();
		}
		$this->structure_channel_data[$channel_id][$key] = $value;   
	}
    
	/**
	 * _remap_structure_table_data
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function _remap_structure_table_data($data) 
	{
		$map = array(
			'site_id' => 'site_id',
			'entry_id' => 'entry_id',
			'parent_id' => 'parent_id',
			'weblog_id' => 'channel_id',
			'listing_wid' => 'listing_cid',
			'lft' => 'lft',
			'rgt' => 'rgt',
			'dead' => 'dead',
		);  
		
		return $this->_remap($map, $data);
	}   
	
	/**
	 * _remap
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function _remap($map, $data) 
	{           
		$remapped = array();
		
		foreach ($data as $key => $value) 
		{
			if (isset($map[$key]))
			{
				$remapped[$map[$key]] = $value;
			}
		} 
		
		return $remapped;
	}
	
	/**
	 * teardown
	 *
	 * @access protected
	 * @param  void	
	 * @return void
	 * 
	 **/
	protected function teardown() 
	{
		$sqls = array();
		
		$sqls[]	=	"DROP TABLE exp_migration_site_pages";
					
		$sqls[]	=	"DROP TABLE exp_migration_structure";
					
		$sqls[]	=	"DROP TABLE exp_migration_structure_settings";
				
		foreach ($sqls as $sql) 
		{
			$this->EE->db->query($sql);
		}
	}
	
	
	/**
	 * run
	 *
	 * @access public
	 * @param  void	
	 * @return void
	 * 
	 **/
	public function run() 
	{                                    
		$this->setup();               
		$this->migrate_site_pages();
		$this->migrate_structure_table();
		$this->generate_structure_channel_table(); 
		$this->generate_structure_listings_table();
		$this->teardown();            
	}
}       


?>