<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

# Amazon S3 file uploader field type for ExpressionEngine CMS
# created by Ty Wangsness <ty@emarketsouth.com>
# copyright (C) 2010 eMarketSouth LLC
# please don't distribute without permission

if (! defined('SIMPLE_S3_UPLOADER_VER'))
{
	require PATH_THIRD . 'simple_s3_uploader/config.php';
	define('SIMPLE_S3_UPLOADER_VER', $config['version']);
}


function _handle_s3_errors($severity, $message, $filepath, $line) {
	Throw new Exception($message);
}

class Simple_s3_uploader_ft extends EE_Fieldtype {

	var $info = array(
		'name'             => 'Simple S3 Uploader',
		'version'          => SIMPLE_S3_UPLOADER_VER
	);
	
	var $defined_settings = array(
		'simple_s3_uploader_s3_key' 				=> '',
		'simple_s3_uploader_s3_secret' 				=> '',
		'simple_s3_uploader_s3_bucket' 				=> '',
		'simple_s3_uploader_s3_bucket_region'		=> '',
		'simple_s3_uploader_acl_public_read'		=> 'yes',
		'simple_s3_uploader_cache_control'			=> 10,
		'simple_s3_uploader_max_filesize' 			=> 0,
		'simple_s3_uploader_filename'				=> '%t-%f.%e',
		'simple_s3_uploader_image_width' 			=> 1024,
		'simple_s3_uploader_image_height' 			=> 768,
		'simple_s3_uploader_image_quality' 			=> 95,
		'simple_s3_uploader_image_resize_method' 	=> 'fit',
		'simple_s3_uploader_image_upscale' 			=> 'no',
		'simple_s3_uploader_thumbname'				=> '%t-%f-thumb.%e',
		'simple_s3_uploader_thumb_width' 			=> 100,
		'simple_s3_uploader_thumb_height' 			=> 100,
		'simple_s3_uploader_thumb_quality' 			=> 90,
		'simple_s3_uploader_thumb_resize_method' 	=> 'fill',
		'simple_s3_uploader_thumb_upscale' 			=> 'yes'
	);
	
	var $s3 = false;
	
	var $js_includes = array();
	
	function Simple_s3_uploader_ft()
	{
		parent::EE_Fieldtype();
		
		if(!isset($this->EE->session->cache['simple_s3_uploader'])) {
			$this->EE->session->cache['simple_s3_uploader'] = array();
		}	
		$this->cache =& $this->EE->session->cache['simple_s3_uploader'];
	}
	
	function install()
	{
		return $this->defined_settings;
	}
	
	function display_global_settings()
	{
		$settings = array_merge($this->defined_settings, $this->settings, $_POST);
		unset($settings['submit']);
		
		$this->EE->lang->loadfile('simple_s3_uploader');
		$this->EE->load->library('table');
		
		$this->EE->table->set_template(array(
			'table_open'    => '<table class="mainTable padTable" border="0" cellspacing="0" cellpadding="0">',
			'row_start'     => '<tr class="even">',
			'row_alt_start' => '<tr class="odd">'
		));
		
		$this->EE->table->set_heading(array('data' => lang('preference'), 'style' => 'width: 50%'), lang('setting'));

		$this->EE->table->add_row(array('data' => 'For full documentation of these settings, visit <a href="http://www.emarketsouth.com/add-ons/simple-s3-uploader/settings/" target="_blank">http://www.emarketsouth.com/add-ons/simple-s3-uploader/settings/</a>', 'colspan' => '2'));

		foreach($settings as $key => $val) {
			if($key == "simple_s3_uploader_image_resize_method" || $key == "simple_s3_uploader_thumb_resize_method") {
				$element = form_dropdown($key, array("fit" => "fit in box", "fill" => "fill box", "stretch" => "stretch to fit"), $val);
			} else if($key == "simple_s3_uploader_image_upscale" || 
					  $key == "simple_s3_uploader_thumb_upscale" ||
					  $key == "simple_s3_uploader_acl_public_read") {
				$element = form_dropdown($key, array("yes" => "yes", "no" => "no"), $val);
			} else if($key == "simple_s3_uploader_s3_bucket_region") {
				$element = form_dropdown($key, array("" => "Default (US Standard)", "us-west-1" => "US West (Northern California)", "ap-southeast-1" => "Asia Pacific (Singapore)", "EU" => "EU (Ireland)"), $val);
			} else if($key == "simple_s3_uploader_s3_secret") {
				$element = form_password($key, $val, 'size="40"');
			} else {
				$element = form_input($key, $val, 'size="40"');
			}
			
			$this->EE->table->add_row(
				lang($key),
				$element
			);
		}
		
		$js = '
			$(document).ready(function() {
				$("<br /><a class=\'toggle_replacements\' href=\'#\'>show/hide replacement variables</a>").insertAfter(".s3_uploader_replacements");
				$(".s3_uploader_replacements").hide();
				$(".toggle_replacements").click(function() {
					$(this).siblings(".s3_uploader_replacements").toggle("fast");
					return false;
				});
			});
		';

		$this->EE->cp->add_to_foot('<script type="text/javascript">'.$js.'</script>');

		return $this->EE->table->generate();
	}
	
	function save_global_settings()
	{
		$settings = array_merge($this->settings, $_POST);
		unset($settings['submit']);
		return $settings;
	}
	
	function display_settings($data)
	{
		$settings = array_intersect_key(array_merge($this->defined_settings, $this->settings, $data), $this->defined_settings);
		
		$this->EE->lang->loadfile('simple_s3_uploader');
		$this->EE->load->library('table');
		
		$this->EE->table->set_template(array(
			'table_open'    => '<table class="mainTable padTable" border="0" cellspacing="0" cellpadding="0">',
			'row_start'     => '<tr class="even">',
			'row_alt_start' => '<tr class="odd">'
		));
		
		$this->EE->table->set_heading(array('data' => lang('preference'), 'style' => 'width: 50%'), lang('setting'));

		foreach($settings as $key => $val) {
			if($key == "simple_s3_uploader_image_resize_method" || $key == "simple_s3_uploader_thumb_resize_method") {
				$element = form_dropdown($key, array("fit" => "fit in box", "fill" => "fill box", "stretch" => "stretch to fit"), $val);
			} else if($key == "simple_s3_uploader_image_upscale" || 
					  $key == "simple_s3_uploader_thumb_upscale" ||
					  $key == "simple_s3_uploader_acl_public_read") {
				$element = form_dropdown($key, array("yes" => "yes", "no" => "no"), $val);
			} else if($key == "simple_s3_uploader_s3_bucket_region") {
				$element = form_dropdown($key, array("" => "Default (US Standard)", "us-west-1" => "US West (Northern California)", "ap-southeast-1" => "Asia Pacific (Singapore)", "EU" => "EU (Ireland)"), $val);
			} else if($key == "simple_s3_uploader_s3_secret") {
				$element = form_password($key, $val, 'size="40"');
			} else {
				$element = form_input($key, $val, 'size="40"');
			}
			
			$this->EE->table->add_row(
				lang($key),
				$element
			);
		}

		$js = '
			$(document).ready(function() {
				$("<br /><a class=\'toggle_replacements\' href=\'#\'>show/hide replacement variables</a>").insertAfter(".s3_uploader_replacements");
				$(".s3_uploader_replacements").hide();
				$(".toggle_replacements").click(function() {
					$(this).siblings(".s3_uploader_replacements").toggle("fast");
					return false;
				});
			});
		';

		$this->EE->cp->add_to_foot('<script type="text/javascript">'.$js.'</script>');

		return $this->EE->table->generate();
	}
	
	function display_cell_settings($data) {
		$ret = array();
		
		$settings = array_intersect_key(array_merge($this->settings, $data), $this->defined_settings);
		
		$this->EE->lang->loadfile('simple_s3_uploader');
		
		foreach($settings as $key => $val) {
			if($key == "simple_s3_uploader_image_resize_method" || $key == "simple_s3_uploader_thumb_resize_method") {
				$element = form_dropdown($key, array("fit" => "fit in box", "fill" => "fill box", "stretch" => "stretch to fit"), $val);
			} else if($key == "simple_s3_uploader_image_upscale" || 
					  $key == "simple_s3_uploader_thumb_upscale" ||
					  $key == "simple_s3_uploader_acl_public_read") {
				$element = form_dropdown($key, array("yes" => "yes", "no" => "no"), $val);
			} else if($key == "simple_s3_uploader_s3_bucket_region") {
				$element = form_dropdown($key, array("" => "Default (US Standard)", "us-west-1" => "US West (Northern California)", "ap-southeast-1" => "Asia Pacific (Singapore)", "EU" => "EU (Ireland)"), $val);
			} else if($key == "simple_s3_uploader_s3_secret") {
				$element = form_password($key, $val, 'size="40"');
			} else {
				$element = form_input($key, $val, 'size="40"');
			}
			
			$ret[] = array(
				lang($key),
				$element
			);
		}
		
		return $ret;
	}
	
	function save_settings($data)
	{
		if(!class_exists('S3', false)) {
			$this->EE->load->library('S3');
		}
		
		$errors = array();
		
		if($data['simple_s3_uploader_s3_key'] == "")
		{
			$errors[] = "You must provide your S3 Key";
		}
		
		if($data['simple_s3_uploader_s3_secret'] == "")
		{
			$errors[] = "You must provide your S3 Secret";
		}
		
		if($data['simple_s3_uploader_s3_bucket'] == "") {
			$errors[] = "You must choose a valid S3 bucket name";
		}
		
		if(!$this->s3) { $this->s3 = new S3($data['simple_s3_uploader_s3_key'], $data['simple_s3_uploader_s3_secret']); }
		
		set_error_handler('_handle_s3_errors');
		
		try {
			$buckets = $this->s3->listBuckets(false);
			
			$bucket_exists = false;

			foreach($buckets as $bucket) {
				if($bucket == $data['simple_s3_uploader_s3_bucket']) {
					$bucket_exists = true;
				}
			}

			if(!$bucket_exists) {
				if($this->s3->putBucket($data['simple_s3_uploader_s3_bucket'], 
				   S3::ACL_PRIVATE,
				   $data['simple_s3_uploader_s3_bucket_region'] ? $data['simple_s3_uploader_s3_bucket_region'] : false)) {
				} else {
					
				}
			}
		} catch(Exception $e) {
			$errors[] = $e->getMessage();
		}
		
		restore_error_handler();
		
		if (count($errors) > 0)
		{
			$str = '';

			foreach ($errors as $msg)
			{
				$str .= $msg.BR;
			}

			show_error($str);
		} else {
			return $data;
		}
	}
	
	function save_cell_settings($data)
	{
		$this->EE->load->add_package_path(PATH_THIRD . 'simple_s3_uploader/');
		return $this->save_settings($data);
	}
	
	function post_save_settings($data)
	{
		
	}
	
	function display_field($data, $name = "")
	{
		if(!$name) {
			$name = $this->field_name;
		}
		if(!is_array($data))
		{
			if($data != "") {
				$data = unserialize(base64_decode($data));
			}
			if(!is_array($data))
			{
				$data = array();
			}
		}
		if(!isset($data['filename'])) { $data['filename'] = ""; }
		
		$r  = "<div class=\"simple_s3_uploader\">";
		if(isset($data['url']) && $data['url'] != "")
		{
			$file_url  = $data['url'];
			$thumb_url = isset($data['thumb_url']) ? $data['thumb_url'] : "";
			
			if($this->settings['simple_s3_uploader_acl_public_read'] != "yes") {
				if(!class_exists('S3', false)) {
			$this->EE->load->library('S3');
		}
				
				if(!$this->s3) { $this->s3 = new S3($this->settings['simple_s3_uploader_s3_key'], $this->settings['simple_s3_uploader_s3_secret']); }
				$file_url = S3::getAuthenticatedUrl($this->settings['simple_s3_uploader_s3_bucket'], $this->replace_s3_filename($data), 60*60);
				
				if($thumb_url != "") {
					$thumb_url = S3::getAuthenticatedUrl($this->settings['simple_s3_uploader_s3_bucket'], $this->replace_thumb_s3_filename($data), 60*60);
				}
			}
			
			if($thumb_url != "")
			{
				$r .= "<p><a href=\"$file_url\" target=\"_blank\"><img src=\"$thumb_url\" width=\"{$data['thumb_width']}\" height=\"{$data['thumb_height']}\" style=\"border: none;\" /></a></p>";
			} else {
				$r .= "<p><a href=\"$file_url\" target=\"_blank\">{$data['filename']}</a> (".$this->_format_bytes($data['filesize']).")</p>";
			}
			$r .= "<p><a href=\"#\" class=\"remove-file\">remove this file</a></p>";
			$r .= "<strong>Replace existing file:</strong><br />";
		}
		$r .= "<input type='file' name='$name' class='simple_s3_upload' />\n";
		foreach($data as $k => $v)
		{
			$r .= "<input type='hidden' name='{$name}[$k]' value='$v' />\n";
		}
		if(!isset($this->cache['included_js'])) {
			$this->EE->cp->add_to_foot("<script type=\"text/javascript\" src=\"".$this->EE->config->item('theme_folder_url') . "third_party/simple_s3_uploader/js/display_field.js\"></script>");
			$this->cache['included_js'] = true;
		}
		$r .= "</div>";
		return $r;
	}
	
	function display_cell($data)
	{
		$this->EE->load->add_package_path(PATH_THIRD . 'simple_s3_uploader/');
		return $this->display_field($data, $this->cell_name);
	}
	
	function validate($data)
	{
		if(isset($_FILES[$this->field_name]) && is_array($_FILES[$this->field_name]))
		{
			$file = $_FILES[$this->field_name];
			if($file['error'] == 1) {
				return "Upload failed: file exceeds maximum allowed size in your PHP configuration file";
			} else if($file['error'] == 2) {
				return "Upload failed: file exceeds maximum allowed size in your HTML form";
			} else if($file['error'] == 3) {
				return "Upload failed: file was only partially uploaded";
			} else if($file['error'] == 4 && $this->settings['field_required'] == 'y' && $data['url'] == "") {
				return "You must upload a file";
			} else if($file['error'] == 6) {
				return "Upload failed: no temp upload folder could be found";
			} else if($file['error'] == 7) {
				return "Upload failed: could not write to disk";
			}
			
			if($this->settings['simple_s3_uploader_max_filesize'] > 0 && $file['size'] > $this->settings['simple_s3_uploader_max_filesize']) {
				$filetype = exif_imagetype($file['tmp_name']);
				// if resizing not enabled OR file not resizable...
				if((!$this->settings['simple_s3_uploader_image_width'] && 
					!$this->settings['simple_s3_uploader_image_height']) ||
				   ($filetype != IMAGETYPE_GIF &&
					$filetype != IMAGETYPE_JPEG &&
					$filetype != IMAGETYPE_PNG)) {
					return "Upload failed: file cannot be larger than " . $this->_format_bytes($this->settings['simple_s3_uploader_max_filesize']);
				}
			}
		}
	}
	
	function validate_cell($data)
	{
		if(isset($_FILES[$this->settings['field_name']]['error'][$this->settings['row_name']][$this->settings['col_name']]))
		{
			$file = array(
				'name' 		=> $_FILES[$this->settings['field_name']]['name'][$this->settings['row_name']][$this->settings['col_name']],
				'type' 		=> $_FILES[$this->settings['field_name']]['type'][$this->settings['row_name']][$this->settings['col_name']],
				'tmp_name' 	=> $_FILES[$this->settings['field_name']]['tmp_name'][$this->settings['row_name']][$this->settings['col_name']],
				'error' 	=> $_FILES[$this->settings['field_name']]['error'][$this->settings['row_name']][$this->settings['col_name']],
				'size' 		=> $_FILES[$this->settings['field_name']]['size'][$this->settings['row_name']][$this->settings['col_name']],
			);
			if($file['error'] == 1) {
				return "Upload failed: file exceeds maximum allowed size in your PHP configuration file";
			} else if($file['error'] == 2) {
				return "Upload failed: file exceeds maximum allowed size in your HTML form";
			} else if($file['error'] == 3) {
				return "Upload failed: file was only partially uploaded";
			} else if($file['error'] == 4 && $this->settings['field_required'] == 'y' && $data['url'] == "") {
				return "You must upload a file";
			} else if($file['error'] == 6) {
				return "Upload failed: no temp upload folder could be found";
			} else if($file['error'] == 7) {
				return "Upload failed: could not write to disk";
			}
			
			if($this->settings['simple_s3_uploader_max_filesize'] > 0 && $file['size'] > $this->settings['simple_s3_uploader_max_filesize']) {
				$filetype = exif_imagetype($file['tmp_name']);
				// if resizing not enabled OR file not resizable...
				if(($this->settings['simple_s3_uploader_image_width'] != 0 && 
					$this->settings['simple_s3_uploader_image_height'] != 0) ||
				   ($filetype != IMAGETYPE_GIF &&
					$filetype != IMAGETYPE_JPEG &&
					$filetype != IMAGETYPE_PNG)) {
					return "Upload failed: file cannot be larger than " . $this->_format_bytes($this->settings['simple_s3_uploader_max_filesize']);
				}
			}
			
			return true;
		}
	}
	
	function save($data)
	{
		if(!is_array($data))
		{
			$data = unserialize(base64_decode($data));
		}
		
		if(!isset($_FILES[$this->field_name]) || $_FILES[$this->field_name]['error'] == 4 || !is_uploaded_file($_FILES[$this->field_name]['tmp_name'])) {
			if(isset($data['url']) && $data['url'] != "") {
				return base64_encode(serialize($data));
			} else {
				return "";
			}
		}
		
		$file_info = $_FILES[$this->field_name];
		
		return base64_encode(serialize($this->_upload_to_s3($file_info, $this->settings)));
	}
	
	function save_cell($data)
	{
		$this->EE->load->add_package_path(PATH_THIRD . 'simple_s3_uploader/');
		
		if(!is_array($data))
		{
			$data = unserialize(base64_decode($data));
		}
		
		$this->validate_cell($data);
		
		if(!is_uploaded_file($_FILES[$this->settings['field_name']]['tmp_name'][$this->settings['row_name']][$this->settings['col_name']]) || 
			$_FILES[$this->settings['field_name']]['error'][$this->settings['row_name']][$this->settings['col_name']] == 4) {
			if(isset($data['url']) && $data['url'] != "") {
				return base64_encode(serialize($data));
			} else {
				return "";
			}
		}
		
		$file_info = array(
			'name' 		=> $_FILES[$this->settings['field_name']]['name'][$this->settings['row_name']][$this->settings['col_name']],
			'type' 		=> $_FILES[$this->settings['field_name']]['type'][$this->settings['row_name']][$this->settings['col_name']],
			'tmp_name' 	=> $_FILES[$this->settings['field_name']]['tmp_name'][$this->settings['row_name']][$this->settings['col_name']],
			'error' 	=> $_FILES[$this->settings['field_name']]['error'][$this->settings['row_name']][$this->settings['col_name']],
			'size' 		=> $_FILES[$this->settings['field_name']]['size'][$this->settings['row_name']][$this->settings['col_name']],
		);
		
		return base64_encode(serialize($this->_upload_to_s3($file_info, $this->settings)));
	}
	
	function pre_process($data)
	{
		$this->EE->load->add_package_path(PATH_THIRD . 'simple_s3_uploader/');
		
		if(!is_array($data)) {
			$data = unserialize(base64_decode($data));
		}
		
		return $data;
	}
	
	function replace_tag($data, $params, $tagdata)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['url']) ? $data['url'] : '';
		return $ret;
	}
	
	function replace_name($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['filename']) ? $data['filename'] : '';
		return $ret;
	}
	
	function replace_authenticated_url($data, $params) {
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		if($this->settings['simple_s3_uploader_s3_bucket'] && $s3_filename = $this->replace_s3_filename($data)) {
			if(!class_exists('S3', false)) {
			$this->EE->load->library('S3');
		}
			
			if(!$this->s3) { $this->s3 = new S3($this->settings['simple_s3_uploader_s3_key'], $this->settings['simple_s3_uploader_s3_secret']); }
			
			$minutes = isset($params['minutes']) ? $params['minutes'] : 60;
			$secure  = isset($params['secure']) && $params['secure'] == "yes" ? true : false;
			$hosted  = false;
			
			return S3::getAuthenticatedUrl($this->settings['simple_s3_uploader_s3_bucket'], $s3_filename, $minutes*60, $hosted, $secure);
		} else {
			return "";
		}
	}
	
	function replace_s3_filename($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		if(isset($data['s3_filename'])) {
			$ret = $data['s3_filename'];
		} else if(isset($data['url'])) {
			$ret = strrchr($data['url'], "/");
			if($ret) {
				$ret = trim($ret, "/");
			}
		} else {
			$ret = "";
		}
		return $ret;
	}
	
	function replace_mime($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['mime']) ? $data['mime'] : 'unknown';
		return $ret;
	}
	
	function replace_mime_class($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		if(isset($data['mime'])) {
			$mime_info = explode("/", $data['mime']);
			$ret = $mime_info[0];
		} else {
			$ret = "unknown";
		}
		return $ret;
	}
	
	function replace_image_width($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['image_width']) ? $data['image_width'] : "0";
		return $ret;
	}
	
	function replace_image_height($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['image_height']) ? $data['image_height'] : "0";
		return $ret;
	}
	
	function replace_bytes($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['filesize']) ? $data['filesize'] : '0';
		return $ret;
	}
	
	function replace_size($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['filesize']) ? $this->_format_bytes($data['filesize']) : '0 B';
		return $ret;
	}
	
	function replace_thumb_authenticated_url($data, $params) {
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		if($this->settings['simple_s3_uploader_s3_bucket'] && $s3_filename = $this->replace_thumb_s3_filename($data)) {
			if(!class_exists('S3', false)) {
			$this->EE->load->library('S3');
		}
			
			if(!$this->s3) { $this->s3 = new S3($this->settings['simple_s3_uploader_s3_key'], $this->settings['simple_s3_uploader_s3_secret']); }
			
			$minutes = isset($params['minutes']) ? $params['minutes'] : 60;
			$secure  = isset($params['secure']) && $params['secure'] == "yes" ? true : false;
			$hosted  = false;
			
			return S3::getAuthenticatedUrl($this->settings['simple_s3_uploader_s3_bucket'], $s3_filename, $minutes*60, $hosted, $secure);
		} else {
			return "";
		}
	}
	
	function replace_thumb_s3_filename($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		if(isset($data['s3_thumbname'])) {
			$ret = $data['s3_thumbname'];
		} else if(isset($data['thumb_url'])) {
			$ret = strrchr($data['thumb_url'], "/");
			if($ret) {
				$ret = trim($ret, "/");
			}
		} else {
			$ret = "";
		}
		return $ret;
	}
	
	function replace_thumb_url($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['thumb_url']) ? $data['thumb_url'] : '';
		return $ret;
	}
	
	function replace_thumb_width($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['thumb_width']) ? $data['thumb_width'] : '0';
		return $ret;
	}
	
	function replace_thumb_height($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['thumb_height']) ? $data['thumb_height'] : '0';
		return $ret;
	}
	
	function replace_thumb_bytes($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['thumb_filesize']) ? $data['thumb_filesize'] : '0';
		return $ret;
	}
	
	function replace_thumb_size($data)
	{
		if(!is_array($data)) {
			$data = $this->pre_process($data);
		}
		$ret = isset($data['thumb_filesize']) ? $this->_format_bytes($data['thumb_filesize']) : '0 B';
		return $ret;
	}
	

	function _upload_to_s3($file_info, $field_settings) {
		if(!class_exists('S3', false)) {
			$this->EE->load->library('S3');
		}
		
		$ret 		 = array();
		$aws_key     = $field_settings['simple_s3_uploader_s3_key'];
		$aws_secret  = $field_settings['simple_s3_uploader_s3_secret'];
		$aws_bucket  = $field_settings['simple_s3_uploader_s3_bucket'];
		$source_file = $file_info['tmp_name'];
		$file_type   = $file_info['type'];
		$pathinfo	 = pathinfo($file_info['name']);
		$filename	 = $this->pathinfo_filename($file_info['name']);
		$object_fmt  = "%t-%f.%e";
		$thumb_fmt   = "%t-%f-thumb.%e";
		
		if(isset($field_settings['simple_s3_uploader_filename']) && $field_settings['simple_s3_uploader_filename'] != "") {
			$object_fmt = $field_settings['simple_s3_uploader_filename'];
		}
		
		if(isset($field_settings['simple_s3_uploader_thumbname']) && $field_settings['simple_s3_uploader_thumbname'] != "") {
			$thumb_fmt = $field_settings['simple_s3_uploader_thumbname'];
		}
		
		$this->EE->load->library('api');
		$this->EE->api->instantiate('channel_structure');
		$info = $this->EE->api_channel_structure->get_channel_info($_POST['channel_id']);
		
		$replacements = array(
			"%t" => time(),
			"%Y" => date("Y", time()),
			"%M" => date("m", time()),
			"%D" => date("d", time()),
			"%f" => $filename,
			"%e" => $pathinfo['extension'],
			"%m" => $this->EE->session->userdata('member_id'),
			"%u" => $this->EE->session->userdata('username'),
			"%s" => $this->EE->session->userdata('screen_name'),
			"%g" => $this->EE->session->userdata('group_title'),
			"%w" => $info->row('channel_name'),
			"%c" => $info->row('channel_name')
		);
		
		$aws_object = $object_fmt;
		$aws_thumb  = $thumb_fmt;
		
		foreach($replacements as $k => $v) {
			$aws_object = str_replace($k, $v, $aws_object);
			$aws_thumb  = str_replace($k, $v, $aws_thumb);
		}
		
		$aws_object  = preg_replace("/[^\/_a-z0-9.]+/i", "-", $aws_object);
		$aws_thumb	 = preg_replace("/[^\/_a-z0-9.]+/i", "-", $aws_thumb);
		
		$ret['filesize'] = filesize($source_file);
		
		$pathinfo = pathinfo($source_file);
		$filename = $this->pathinfo_filename($source_file);
		$resize_file = $pathinfo['dirname'] . "/" . time() . $pathinfo['basename'];
		$thumb_file = $pathinfo['dirname'] . "/" . time() . $pathinfo['basename'] . "-thumb";
		
		$image = $this->_resize_image(
			$source_file, $resize_file, 
			$field_settings['simple_s3_uploader_image_width'], 
			$field_settings['simple_s3_uploader_image_height'], 
			$field_settings['simple_s3_uploader_image_quality'], 
			$field_settings['simple_s3_uploader_image_resize_method'], 
			$field_settings['simple_s3_uploader_image_upscale']
		);
		
		if($image !== false) {
			$ret['image_width'] = $image['width'];
			$ret['image_height'] = $image['height'];
			$ret['filesize'] = filesize($resize_file);
		}
		
		$thumb = $this->_resize_image(
			$source_file, $thumb_file,
			$field_settings['simple_s3_uploader_thumb_width'],
			$field_settings['simple_s3_uploader_thumb_height'],
			$field_settings['simple_s3_uploader_thumb_quality'],
			$field_settings['simple_s3_uploader_thumb_resize_method'],
			$field_settings['simple_s3_uploader_thumb_upscale']
		);
		
		// only checks filesize if we didn't resize the image...
		// not fair to say we'll resize and then fail due to the file still being too big
		if($field_settings['simple_s3_uploader_max_filesize'] > 0 && $image === false) {
			if(filesize($source_file) > $field_settings['simple_s3_uploader_max_filesize']) {
				return "";
			}
		}
		
		if(!$this->s3) { $this->s3 = new S3($aws_key, $aws_secret); }
		
		$acl = $field_settings['simple_s3_uploader_acl_public_read'] == "yes" ? S3::ACL_PUBLIC_READ : S3::ACL_PRIVATE;
		
		$cache_days = $field_settings['simple_s3_uploader_cache_control'] ? $field_settings['simple_s3_uploader_cache_control'] : 0;
		
		$request_headers = array(
			"Content-Type" => $file_type,
			"Cache-Control" => "max-age=" . $cache_days * 24 * 60 * 60
		);
		
		$input = false;
		if($image !== false) {
			$input = $this->s3->inputResource(fopen($resize_file, "rb"), filesize($resize_file));
		} else {
			$input = $this->s3->inputResource(fopen($source_file, "rb"), filesize($source_file));
		}
		if($this->s3->putObject($input, $aws_bucket, $aws_object, $acl, array(), $request_headers)) {
			$ret['s3_filename'] = $aws_object;
			$ret['filename'] 	= $file_info['name'];
			$ret['mime'] 	 	= $file_info['type'];
			$ret['url']		 	= "http://{$aws_bucket}.s3.amazonaws.com/{$aws_object}";
		} else {
			return "";
		}
		
		if($thumb !== false) {
			$input = $this->s3->inputResource(fopen($thumb_file, "rb"), filesize($thumb_file));
			
			if($this->s3->putObject($input, $aws_bucket, $aws_thumb, $acl, array(), $request_headers)) {
				$ret['s3_thumbname'] = $aws_thumb;
				$ret['thumb_url'] = "http://{$aws_bucket}.s3.amazonaws.com/{$aws_thumb}";
				$ret['thumb_width'] = $thumb['width'];
				$ret['thumb_height'] = $thumb['height'];
				$ret['thumb_filesize'] = filesize($thumb_file);
			}
		}
		
		if(file_exists($resize_file)) {
			unlink($resize_file);
		}
		if(file_exists($thumb_file)) {
			unlink($thumb_file);
		}
		
		return $ret;
	}
	
	function _resize_image($source_file, $dest_file, $width, $height, $quality, $method = "fit", $upscale = "no")
	{
		$ret = array();
		$image = false;
		switch(exif_imagetype($source_file)) {
			case IMAGETYPE_GIF:
				$image = imagecreatefromgif($source_file);
				break;
			case IMAGETYPE_JPEG:
				$image = imagecreatefromjpeg($source_file);
				break;
			case IMAGETYPE_PNG:
				$image = imagecreatefrompng($source_file);
				break;
			case IMAGETYPE_BMP:
				// don't think PHP can create an image from a BMP
				// will need to find a third-party function for this if anyone cares about BMPs anymore
				break;
		}
		
		// file not a supported image type
		if($image === false) {
			return false;
		}
		
		$imagesize = getimagesize($source_file);

		if($imagesize === false) {
			return false;
		}

		$max_width    = PHP_INT_MAX;
		$max_height   = PHP_INT_MAX;
		$image_width  = $imagesize[0];
		$image_height = $imagesize[1];
		
		// invalid dimensions specified, don't bother attempting to resize
		// note: possible that only width or height is specified, don't need both
		if($width <= 0 && $height <= 0) {
			copy($source_file, $dest_file);
			$ret['width']  = round($image_width);
			$ret['height'] = round($image_height);
			return $ret;
		}
		
		if($width > 0) {
			$max_width = $width;
		}
		if($height > 0) {
			$max_height = $height;
		}
		
		$dim = $this->_get_resize_dimensions($image_width, $image_height, $max_width, $max_height, $method, $upscale);
		
		if($dim['copy']) {
			copy($source_file, $dest_file);
			$ret['width']  = round($image_width);
			$ret['height'] = round($image_height);
		} else {
			$resized_image = imagecreatetruecolor($dim['dw'], $dim['dh']);
			$alpha_image = false;
			
			switch($imagesize[2]) {
				case IMAGETYPE_GIF:
					$this->_set_transparency($resized_image, $image);
					break;
				case IMAGETYPE_PNG:
					imagealphablending($resized_image, false);
					imagesavealpha($resized_image, true);
					
					$alpha_image = imagecreatetruecolor($image_width, $image_height);
					imagealphablending($alpha_image, false);
					imagesavealpha($alpha_image, true);
					
					for($x = 0; $x < $image_width; $x++) {
						for($y = 0; $y < $image_height; $y++) {
							$alpha = (imagecolorat($image, $x, $y) >> 24) & 0xFF;
							$color = imagecolorallocatealpha($alpha_image, 0, 0, 0, $alpha);
							imagesetpixel($alpha_image, $x, $y, $color);
						}
					}
					
					break;
			}
			
			imagegammacorrect($image, 2.2, 1.0);
			imagecopyresampled($resized_image, $image, 0, 0, $dim['sx'], $dim['sy'], $dim['dw'], $dim['dh'], $dim['sw'], $dim['sh']);
			imagegammacorrect($resized_image, 1.0, 2.2);
			
			imagedestroy($image);
			
			switch($imagesize[2]) {
				case IMAGETYPE_GIF:
					imagegif($resized_image, $dest_file);
					break;
				case IMAGETYPE_JPEG:
					imagejpeg($resized_image, $dest_file, $quality);
					break;
				case IMAGETYPE_PNG:
					$alpha_resized_image = imagecreatetruecolor($dim['dw'], $dim['dh']);
					imagealphablending($alpha_resized_image, false);
					imagesavealpha($alpha_resized_image, true);
					imagecopyresampled($alpha_resized_image, $alpha_image, 0, 0, $dim['sx'], $dim['sy'], $dim['dw'], $dim['dh'], $dim['sw'], $dim['sh']);
					
					for($x = 0; $x < $dim['dw']; $x++) {
						for($y = 0; $y < $dim['dh']; $y++) {
							$alpha = (imagecolorat($alpha_resized_image, $x, $y) >> 24) & 0xFF;
							$rgb = imagecolorat($resized_image, $x, $y);
							$r = ($rgb >> 16) & 0xFF;
							$g = ($rgb >> 8) & 0xFF;
							$b = $rgb & 0xFF;
							$color = imagecolorallocatealpha($resized_image, $r, $g, $b, $alpha);
							imagesetpixel($resized_image, $x, $y, $color);
						}
					}
					
					imagedestroy($alpha_image);
					imagedestroy($alpha_resized_image);
					
					imagepng($resized_image, $dest_file);
					break;
			}
			
			imagedestroy($resized_image);
			
			$ret['width']  = $dim['dw'];
			$ret['height'] = $dim['dh'];
		}

		return $ret;
	}
	
	function _get_resize_dimensions($iw, $ih, $mw, $mh, $method = "fit", $upscale = "no") {
		$r = array();
		$r['copy'] = false;
		
		if($method == "fill" && $mw < PHP_INT_MAX && $mh < PHP_INT_MAX) {
			if($upscale == "yes" || ($iw > $mw && $ih > $mh)) {
				$ratio_width  = $iw / $mw;
				$ratio_height = $ih / $mh;

				$scale_by = $ratio_width <= $ratio_height ? $ratio_width : $ratio_height;

				$w = $iw  / $scale_by;
				$h = $ih / $scale_by;
				
				$r['sx'] = floor(($w - $mw) / 2 * $scale_by);
				$r['sy'] = floor(($h - $mh) / 2 * $scale_by);
				
				$r['dw'] = $mw;
				$r['dh'] = $mh;
				
				$r['sw'] = floor($mw * $scale_by);
				$r['sh'] = floor($mh * $scale_by);
				
				return $r;
			} else {
				$r['copy'] = true;
				return $r;
			}
		} else if($method == "stretch" && $mw < PHP_INT_MAX && $mh < PHP_INT_MAX) {
			if($upscale == "yes" || $iw > $mw || $ih > mh) {
				$r['sx'] = 0;
				$r['sy'] = 0;

				$r['dw'] = $mw;
				$r['dh'] = $mh;

				$r['sw'] = $iw;
				$r['sh'] = $ih;

				return $r;	
			} else {
				$r['copy'] = true;
				return $r;
			}
		} else {
			if($upscale == "yes" || $iw > $mw || $ih > $mh) {
				$ratio_width  = $iw / $mw;
				$ratio_height = $ih / $mh;
				
				$scale_by = $ratio_width >= $ratio_height ? $ratio_width : $ratio_height;
				
				$r['sx'] = 0;
				$r['sy'] = 0;
				
				$r['dw'] = floor($iw / $scale_by);
				$r['dh'] = floor($ih / $scale_by);
				
				$r['sw'] = $iw;
				$r['sh'] = $ih;
				
				return $r;
			} else {
				$r['copy'] = true;
				return $r;
			}
		}
	}
	
	function _set_transparency($new_image, $image_source) 
	{ 
		$transparencyIndex = imagecolortransparent($image_source);
		$transparencyColor = array('red' => 255, 'green' => 255, 'blue' => 255); 

		if($transparencyIndex >= 0) { 
			$transparencyColor = imagecolorsforindex($image_source, $transparencyIndex);
		}

		$transparencyIndex = imagecolorallocate($new_image, $transparencyColor['red'], $transparencyColor['green'], $transparencyColor['blue']); 
		imagefill($new_image, 0, 0, $transparencyIndex); 
		imagecolortransparent($new_image, $transparencyIndex);
	}
	
	function _format_bytes($bytes, $precision = 2) 
	{
	    $units = array('B', 'KB', 'MB', 'GB', 'TB'); 

	    $bytes = max($bytes, 0); 
	    $pow = floor(($bytes ? log($bytes) : 0) / log(1024)); 
	    $pow = min($pow, count($units) - 1); 

	    $bytes /= pow(1024, $pow); 

	    return round($bytes, $precision) . ' ' . $units[$pow]; 
	}
	
	function pathinfo_filename($file) {
		if (defined('PATHINFO_FILENAME')) {
			return pathinfo($file, PATHINFO_FILENAME);
		} else if (strstr($file, '.')) {
			return substr($file, 0, strrpos($file,'.'));
		} else {
			return $file;
		}
	}
}
?>