<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Local config overrides & db credentials
 * 
 * Our database credentials and any environment-specific overrides
 * This file should be specific to each developer and not tracked in Git
 * 
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */


// Local db
$env_db['hostname'] = 'localhost';
$env_db['username'] = 'root';
$env_db['password'] = 'root';
$env_db['database'] = 'pbh_ee';

/**
 * Remote db - typically a shared development database
 * 
 * Putting this below the local settings allows us to easily uncomment the
 * lines to connect to a secondary connection, overriding the first settings
 */
$env_db['hostname'] = '64.207.152.11';
$env_db['username'] = 'db-p4bhealth';
$env_db['password'] = 'KJRwUhg6wE8tLj';
$env_db['database'] = 'p4bhealth_ee';

/*
| To temporarily turn off CE Cache, you can use this option. This can be
| useful when developing a site.
*/
$config['ce_cache_off'] = 'yes';



// Local testing email address
$env_config['webmaster_email'] = 'me@domain.com';


/* End of file config.local.php */
/* Location: ./config/config.local.php */