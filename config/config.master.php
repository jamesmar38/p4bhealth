<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Focus Lab, LLC Master Config
 * 
 * This is the master config file for our ExpressionEngine sites
 * The settings will contain database credentials and numerous "config overrides"
 * used throughout the site. This file is used as first point of configuration
 * but there are environment-specific files as well. The idea is that the environment
 * config files contain config overrides that are specific to a single environment.
 * 
 * Some config settings are used in multiple (but not all) environments. You will
 * see the use of conditionals around the ENV constant in this file. This constant is
 * defined in ./config/config.env.php
 * 
 * All config files are stored in the ./config/ directory and this master file is "required"
 * in system/expressionengine/config/config.php and system/expressionengine/config/database.php
 * 
 * require $_SERVER['DOCUMENT_ROOT'] . '/../config/config.master.php';
 * 
 * This config setup is a combination of inspiration from Matt Weinberg and Leevi Graham
 * @link       http://eeinsider.com/articles/multi-server-setup-for-ee-2/
 * @link       http://ee-garage.com/nsm-config-bootstrap
 * 
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 * @see        https://github.com/focuslabllc/ee-master-config
 */


// Require our environment declatation file if it hasn't
// already been loaded in index.php or admin.php
if ( ! defined('ENV'))
{
	require 'config.env.php'; 
}


// Setup our initial arrays
$env_db = $env_config = $env_global = $master_global = array();


/**
 * Database override magic
 * 
 * If this equates to TRUE then we're in the database.php file
 * We don't want these settings bothered with in our config.php file
 */
if (isset($db['expressionengine']))
{
	/**
	 * Load our environment-specific config file
	 * which contains our database credentials
	 * 
	 * @see config/config.local.php
	 * @see config/config.dev.php
	 * @see config/config.stage.php
	 * @see config/config.prod.php
	 */
	require 'config.' . ENV . '.php';
	
	// Dynamically set the cache path (Shouldn't this be done by default? Who moves the cache path?)
	$env_db['cachedir'] = APPPATH . 'cache/db_cache/';
	
	// Merge our database setting arrays
	$db['expressionengine'] = array_merge($db['expressionengine'], $env_db);
	
	// No need to have this variable accessible for the rest of the app
	unset($env_db);
}
// End if (isset($db['expressionengine'])) {}



/**
 * Config override magic
 * 
 * If this equates to TRUE then we're in the config.php file
 * We don't want these settings bothered with in our database.php file
 */
if (isset($config))
{

	/**
	 * Dynamic path settings
	 * 
	 * Make it easy to run the site in multiple environments and not have to switch up
	 * path settings in the database after each migration
	 * As inspired by Matt Weinberg: http://eeinsider.com/articles/multi-server-setup-for-ee-2/
	 */
	$protocol                          = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ? 'https://' : 'http://';
	$base_url                          = $protocol . $_SERVER['HTTP_HOST'];
	$base_path                         = $_SERVER['DOCUMENT_ROOT'];
	$system_folder                     = APPPATH . '../';
	$images_folder                     = 'images';
	$images_path                       = $base_path . '/' . $images_folder;
	$images_url                        = $base_url . '/' . $images_folder;

	$env_config['index_page']          = '';
	$env_config['site_index']          = '';
	$env_config['base_url']            = $base_url . '/';
	$env_config['site_url']            = $env_config['base_url'];
	$env_config['cp_url']              = $env_config['base_url'] . 'admin.php';
	$env_config['theme_folder_path']   = $base_path   . '/themes/';
	$env_config['theme_folder_url']    = $base_url    . '/themes/';
	$env_config['emoticon_path']       = $images_url  . '/smileys/';
	$env_config['emoticon_url']        = $images_url  . '/smileys/';
	$env_config['captcha_path']        = $images_path . '/captchas/';
	$env_config['captcha_url']         = $images_url  . '/captchas/';
	$env_config['avatar_path']         = $images_path . '/avatars/';
	$env_config['avatar_url']          = $images_url  . '/avatars/';
	$env_config['photo_path']          = $images_path . '/member_photos/';
	$env_config['photo_url']           = $images_url  . '/member_photos/';
	$env_config['sig_img_path']        = $images_path . '/signature_attachments/';
	$env_config['sig_img_url']         = $images_url  . '/signature_attachments/';
	$env_config['prv_msg_upload_path'] = $images_path . '/pm_attachments/';
	// $env_config['third_party_path']    = $base_path . '/../third_party/';



	/**
	 * Custom upload directory paths
	 * 
	 * The array keys must match the ID from exp_upload_prefs
	 */
	$env_config['upload_preferences'] = array(
	     1 => array(
	         'name'        => 'Default Uploads',
	         'server_path' => $images_path . '/uploads/',
	         'url'         => $images_url  . '/uploads/'
	     )
	//     2 => array(
	//         'name'        => 'Second Folder',
	//         'server_path' => $images_path . '/another_one',
	//         'url'         => $images_url  . '/another_one/'
	//     )
	);


	/**
	 * Template settings
	 * 
	 * Working locally we want to reference our template files.
	 * In staging and production we do not use flat files (for ever-so-slightly better performance)
	 * This approach requires that we synchronize templates after each deployment of template changes
	 * 
	 * For the distributed Focus Lab, LLC Master Config file this is commented out
	 * You can enable this "feature" by uncommenting the second 'save_tmpl_files' line
	 */
	$env_config['save_tmpl_files']           = 'y';
	// $env_config['save_tmpl_files']           = (ENV == 'prod') ? 'n' : 'y';
	$env_config['tmpl_file_basepath']        = $base_path . '/../templates';
	$env_config['hidden_template_indicator'] = '_'; 



	/**
	 * Debugging settings
	 * 
	 * These settings are helpful to have in one place
	 * for debugging purposes
	 */
	$env_config['is_system_on']         = 'y';
	$env_config['allow_extensions']     = 'y';
	$env_config['email_debug']          = (ENV_DEBUG) ? 'y' : 'n' ;
	// If we're not in production show the profile on the front-end but not in the CP
	$env_config['show_profiler']        = ( ! ENV_DEBUG OR (isset($_GET['D']) && $_GET['D'] == 'cp')) ? 'n' : 'y' ;
	// Show template debugging if we're not in production
	$env_config['template_debugging']   = (ENV_DEBUG) ? 'y' : 'n' ;
	/**
	 * Set debug to '2' if we're in dev mode, otherwise just '1'
	 * 
	 * 0: no PHP/SQL errors shown
	 * 1: Errors shown to Super Admins
	 * 2: Errors shown to everyone
	 */
	$env_config['debug']                = (ENV_DEBUG) ? '2' : '1' ;



	/**
	 * Tracking & Performance settings
	 * 
	 * These settings may impact what happens on certain page loads
	 * and turning them off could help with performance in general
	 */
	$env_config['disable_all_tracking']        = 'y'; // If set to 'y' some of the below settings are disregarded
	$env_config['enable_sql_caching']          = 'n';
	$env_config['disable_tag_caching']         = 'n';
	$env_config['enable_online_user_tracking'] = 'n';
	$env_config['dynamic_tracking_disabling']  = '500';
	$env_config['enable_hit_tracking']         = 'n';
	$env_config['enable_entry_view_tracking']  = 'n';
	$env_config['log_referrers']               = 'n';
	$env_config['gzip_output']                 = 'y'; // Set to 'n' if your host is EngineHosting



	/**
	 * 3rd Party Add-on config items as needed
	 */
	



	/**
	 * Member-based settings
	 */
	$env_config['profile_trigger']          = rand(0,time()); // randomize the member profile trigger word because we'll never need it



	/**
	 * Other system settings
	 */
	$env_config['new_version_check']        = 'n'; // no slowing my CP homepage down with this
	$env_config['daylight_savings']         = ((bool) date('I')) ? 'y' : 'n'; // Autodetect DST
	$env_config['use_category_name']        = 'y';
	$env_config['reserved_category_word']   = 'category';
	$env_config['word_separator']           = 'dash'; // dash|underscore




	/**
	 * Load our environment-specific config file
	 * May contain override values from similar above settings
	 * 
	 * @see config/config.local.php
	 * @see config/config.dev.php
	 * @see config/config.stage.php
	 * @see config/config.prod.php
	 */
	require $_SERVER['DOCUMENT_ROOT'] . '/../config/config.' . ENV . '.php';




	/**
	 * Setup our template-level global variables
	 * 
	 * As inspired by NSM Bootstrap Config
	 * @see http://ee-garage.com/nsm-config-bootstrap
	 */
	global $assign_to_config;
	if( ! isset($assign_to_config['global_vars']))
	{
		$assign_to_config['global_vars'] = array();
	}
	
	// Start our array with environment variables. This gives us {global:env} and {global:env_full} tags for our templates.
	$master_global = array(
		'global:env'      => ENV,
		'global:env_full' => ENV_FULL
	);



	/**
	 * Merge arrays to form final datasets
	 * 
	 * We've created our base config and global key->value stores
	 * We've also included the environment-specific arrays now
	 * Here we'll merge the arrays to create our final array dataset which
	 * respects "most recent data" first if any keys are duplicated
	 * 
	 * This is how our environment settings are "king" over any defaults
	 */
	$assign_to_config['global_vars'] = array_merge($assign_to_config['global_vars'], $master_global, $env_global); // global var arrays
	$config = array_merge($config, $env_config); // config setting arrays
	
}
// End if (isset($config)) {}
 
/*
|--------------------------------------------------------------------------
| CE Image Basic Config Items
|--------------------------------------------------------------------------
|
| The following items are for use with CE Image. They are all optional,
| as the defaults in the actual plugin will be used if not specified below.
*/
/*
| The *relative path* (to your web root) of the directory to cache images
| in. This path will override the $cache_dir variable in the plugin file,
| and can optionally be overridden via the cache_dir= plugin parameter.
*/
$config['ce_image_cache_dir'] = '/images/made/';
/*
| The *relative path* (to your web root) of the folder to download remote
| images. This path will override the $remote_dir variable in the plugin
| file, and can optionally be overridden via the remote_dir= plugin
| parameter.
*/
$config['ce_image_remote_dir'] = '/images/remote/';
/*
| The ce_image_memory_limit sets the amount of memory (in megabytes) PHP can
| use for the script (64 is generally sufficient). If the PHP memory_limit
| is set to a greater value, then this setting will not override it.
*/
$config['ce_image_memory_limit'] = 128;
/*
| If the plugin cannot determine the last change date of a remote image,
| wait this long (in minutes) before re-downloading the image:
*/
// $config['ce_image_remote_cache_time'] = 1440;
/*
| The default quality to save a jpg/jpeg file. The quality can range from
| 0 (lowest) to 100 (highest) and should be a whole number.
*/
// $config['ce_image_quality'] = 100;
/*
| By default, CE Image runs images that are downloaded from remote sites
| through an XSS filter. The filter sometimes gives false negatives though.
| If you know and trust the source of your images, you can disable the
| filter by default. You can always override this per tag via the
| disable_xss_check= parameter.
*/
// $config['ce_image_disable_xss_check'] = 'yes';
// END CE Image basic config items

/*
|--------------------------------
| CE Image Advanced Config Items
|--------------------------------
|
| The following settings are only for advanced setups! You should very
| rarely need to change anything below.
*/
/*
| The ce_image_current_domain item can generally be left blank, and the
| plugin will figure it out.
*/
// $config['ce_image_current_domain'] = '';

/*
| The ce_image_unique option can be set to 'filename', 'directory_name',
| or 'none'. See the docs for more details.
*/
$config['ce_image_unique'] = 'filename';

/*
| The ce_img_src_regex takes an associative pair of values
| that you would like to preg_replace (a PHP function) the src path with.
| This occurs before the plugin tries to find the image on the server.
| Ex: array( '^/images/(?!made)' => '/some/server/path/images/');
*/
// $config['ce_image_src_regex'] = array();

/*
| The ce_image_made_regex takes an associative pair of values that you
| would like to preg_replace (a PHP function) the made variable with.
| This occurs right before the made variable is returned to the plugin.
| Ex: array( '^/images/' => 'http://www.example.com/images/');
*/
// $config['ce_image_made_regex'] = array();

/*
| Can be '' (default), or the name of a folder that you would like to be
| automatically created in the same image directory as the source
| image (if the source image is above web root). The manipulated image
| will then be cached inside this directory. If the image is below web
| root, the folder will be created in the cache_dir instead. If you are
| pulling images from below web root, it is best to leave this as ''
*/
$config['ce_image_auto_cache'] = 'sized';

/*
| By default, CE Image uses the EE installation's root folder as the base
| path for CE Image. All relative paths and references will build off of
| this path's value. This setting allows you to override the default, and
| can also be overridden in the global_array in your index.php file.
*/
$env_config['ce_image_document_root'] = $base_path;

/*
| The mode (permission level) to try and set the created image
| to. Must be octal. See http://php.net/manual/en/function.chmod.php for
| more info. Defaults to: 0644
*/
// $config['ce_image_image_permissions'] = 0644;

/*
| The mode (permission level) to try and set the created directories to.
| Must be octal. See http://php.net/manual/en/function.chmod.php for
| more info. Defaults to: 0775
*/
// $config['ce_image_dir_permissions'] = 0775;

/*
| By default, CE Image will replace spaces with %20 in image URLs. You
| can disable this behavior to leave the spaces unchanged by setting
| this to 'no'.
*/
// $config['ce_image_encode_urls'] = 'no';

/*
| Amazon S3 settings and optional headers. For use with the option AWS
| extension. See the installation instructions for more details on how
| to install the extension.
*/
// $config['ce_image_aws_key'] = '';
// $config['ce_image_aws_secret_key'] = '';
// $config['ce_image_bucket'] = '';
// $config['ce_image_aws_request_headers'] = array();
// $config['ce_image_aws_request_headers']['Cache-Control'] = 'max-age=' . (30 * 24 * 60 * 60);
// $config['ce_image_aws_request_headers']['Expires'] = gmdate("D, d M Y H:i:s T", strtotime('+1 month') );
// $config['ce_image_aws_storage_class'] = 'STANDARD';
/*
| To use cloudfront with your AWS setup, simply add your cloudfront
| subdomain (in addition to the above AWS info) to the following config
| item. If the cloudfront URL is d38tz0dcx54k85.cloudfront.net, then
| the subdomain would be 'd38tz0dcx54k85'.
*/
// $config['ce_image_aws_cloudfront_url'] = '';
/*
| To prevent the AWS S3 or CloudFront domains from being automatically
| appended, you can set the following setting to "n". The default is
| "y". This setting is useful if you have configured custom domains
| for use with AWS, and you don't want to append the default AWS domain.
*/
// $config['ce_image_aws_auto_url'] = 'y';
// END CE Image advanced config items
  

/*
|-----------------------
| CE Cache Config Items
|-----------------------
|
| The following items are for use with CE Cache. They are all optional.
*/
/*
| The driver(s) to use. You can specify on or more of the following: 'file',
| 'db', 'apc', 'redis', 'memcache', 'memcached', or 'dummy'. APC,  Redis,
| Memcache, and/or Memcached must be installed and configured on your
| server before they can be used. The default driver setting (if not
| specified), is 'file'. If you want to specify multiple drivers, simply
| separate them with a pipe (|) character, and if a driver method call
| fails, it will fallback to the next driver down the line and try again.
*/
$config['ce_cache_drivers'] = 'apc|memcached|memcache|file|db';
/*
| The default number of seconds to cache items. Defaults to 3600 (1 hour).
| If you set this to '0', your cache items will not expire on their own,
| but will remain cached until they are deleted (or cease to exist,
| depending on the driver).
*/
$config['ce_cache_seconds'] = 604800;
/*
| If you would like the whitespace before and after the content you pass
| in to your 'save' and 'it' tags to be automatically removed before being
| cached, set this to 'yes'. The default is 'no'.
*/
// $config['ce_cache_trim'] = 'yes';
/*
| This will be the default id to use for It and Save tags if they don't
| have an id and do not have the global="yes" parameter. If this setting
| is not included, then it will default to 'item'.
*/
$env_config['ce_cache_id'] = 'page';
/*
| You can optionally create a secret key if you are worried about someone
| guessing your EE action_id to break your cache or view your cached item
| names through jsonp requests.
*/
// $config['ce_cache_secret'] = 'your_key_here';
/*
| To temporarily turn off CE Cache, you can use this option. This can be
| useful when developing a site.
*/
// $config['ce_cache_off'] = 'yes';
/*
| Sometimes bots will go on a rampage and ping a whole bunch of URLs that
| don't exist. If all pages don't have proper 404 handling, this can create
| *a lot* of unnecessary caches. For this reason, new caches will not be
| created when a page is accessed by a bot, but any previously created
| caches for the page will still be returned. To cache pages regardless
| of whether or not they are accessed by a bot, set this to 'no'. The
| default is 'yes'.
*/
// $config['ce_cache_block_bots'] = 'no';
/*
| Limit fragment (non-static, using the It or Save tags) caching to logged
| out users? The default is 'no'. This can be overridden by the
| logged_in_only= and logged_out_only= tag parameters.
*/
// $config['ce_cache_fragment_logged_out_only'] = 'no';
/*
| Limit fragment caching to logged in users? The default is 'no'. This can be
| overridden by the logged_in_only= and logged_out_only= tag parameters.
*/
// $config['ce_cache_fragment_logged_in_only'] = 'yes';
/*
| This must be set to 'yes' in order for items to be cached via the static
| driver. The default is 'no'.
*/
// $config['ce_cache_static_enabled'] = 'yes';
/*
| If you are using the static driver, and need to override the path to
| its cache directory, this setting is for you.
*/
// $config['ce_cache_static_path'] = $base_path . '/static';
/*
| Limit static (using the Stat:ic tag) caching to logged out users? The
| default is 'no'. This can be overridden by the logged_in_only= and
| logged_out_only= tag parameters. You will also need to look at the
| Static Driver Installation instructions in the control panel (under
| the "Logged Out Only" heading) for instructions on setting up your
| .htaccess to get this setting to work.
*/
// $config['ce_cache_static_logged_out_only'] = 'yes';
/*
| Limit static caching to logged in users? The default is 'no'. This can be
| overridden by the logged_in_only= and logged_out_only= tag parameters.
*/
// $config['ce_cache_static_logged_in_only'] = 'no';
/*
| If you are using the memcache driver and would like to add multiple
| servers, use this setting to specify them. If this setting is not
| specified, then it will default to:
| $config['ce_cache_memcache_servers'] = array(
|       array( '127.0.0.1' )
| );
| see http://www.php.net/manual/en/memcache.addserver.php
*/
// $config['ce_cache_memcache_servers'] = array(
//         array( '127.0.0.1', 11211, TRUE, 15 ),
//         array( 'memcache_host', 11211, TRUE, 70 ),
//         array( 'memcache_host2', 11211, TRUE, 15  )
// );
/*
| If you are using the memcached driver and would like to add multiple
| servers, use this setting to specify them. If this setting is not
| specified, then it will default to:
| $config['ce_cache_memcached_servers'] = array(
|       array( '127.0.0.1', 11211 )
| );
| see http://www.php.net/manual/en/memcached.addserver.php
*/
// $config['ce_cache_memcached_servers'] = array(
//         array( '127.0.0.1', 11211, 20 ),
//         array( 'memcached_host', 11211, 20 ),
//         array( 'memcached_host2', 11211, 40 )
// );
/*
| You can specify one or more servers for the redis driver using this
| configuration option. If this setting is not specified, then it will
| default to:
| $config['ce_cache_redis_servers'] = array(
|       array( '127.0.0.1' )
| );
*/
// $config['ce_cache_redis_servers'] = array(
//         array( '127.0.0.1:6379' ),
//         array( '10.0.0.1:6379' ),
//         array( '10.0.0.2:6379' )
// );
/*
| If your redis server is password protected, you can specify the
| password in this config setting. Authentication will be attempted
| before connecting and executing commands.
*/
// $config['ce_cache_redis_auth'] = 'foo';
/*
| By default, CE Cache performs all cache breaking and refreshing
| asynchronously. However, if you are blocking your site with .htaccess
| authentication or cannot support the default asynchronous
| functionality for some other reason, adding this config item will
| allow the site to work synchronously instead. Please note that
| cache refreshing will not work in synchronous mode. The default is 'yes'.
*/
// $config['ce_cache_async'] = 'no';
/*
| CE Cache first attempts to use cURL and then to fallback to
| fsockopen when making asynchronous requests. On rare occasions,
| however, people have had problems with cURL not being able to make
| the requests successfully. By setting this parameter to 'no', you
| effectively skip cURL, and only allow fsockopen to be used for
| the asynchronous requests.  The default is 'yes'.
*/
// $config['ce_cache_curl'] = 'no';
/*
| Whether or not to enable flat static caching. View the Static Driver
| Installation tab in the CE Cache module control panel for more details.
*/
// $config['ce_cache_static_flat'] = 'yes';
/*
| The url_prefix= is prepended to the cache item URL, even if the url is
| overridden via url_override=. This setting can be useful for sub-directory
| EE installations, and multi-language MSM sites, because EE does not include
| the folder path to the index.php directory in it's internal URL.
*/
// $config['ce_cache_url_prefix'] = '';
/*
| By default, CE Cache will not cache pages that were requested via POST.
| If you would like change this functionality on an install-wide basis,
| you can add the following config item:
*/
// $config['ce_cache_ignore_post_requests'] = 'no';
/*
| CE Cache will not cache 404 pages by default. If you would like CE Cache
| to cache 404 pages, set the following to 'no'. The default is 'yes'.
| * It is recommended that you leave this at its default value.
*/
// $config['ce_cache_exclude_404s'] = 'yes';

// END CE Cache config items


/* End of file config.master.php */
/* Location: ./config/config.master.php */
