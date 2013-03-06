<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Production config overrides & db credentials
 * 
 * Our database credentials and any environment-specific overrides
 * 
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */

$env_db['hostname'] = '70.32.105.29';
$env_db['username'] = 'cirruswebdb';
$env_db['password'] = 'eFut7FeQv8vCqh';
$env_db['database'] = 'cirrusweb';

$env_config['webmaster_email'] = 'noreply@p4bhealth.org';

// Sample global variable for Production only
// Can be used in templates like "{global:google_analytics}"
$env_global['global:google_analytics'] = 'UA-179204-57';

/* End of file config.prod.php */
/* Location: ./config/config.prod.php */