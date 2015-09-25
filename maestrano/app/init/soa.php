<?php
//-----------------------------------------------
// Define root folder and load base
//-----------------------------------------------
if (!defined('MAESTRANO_ROOT')) {
  define("MAESTRANO_ROOT", realpath(dirname(__FILE__) . '/../../'));
}
require_once MAESTRANO_ROOT . '/app/init/base.php';

//-----------------------------------------------
// Require your app specific files here
//-----------------------------------------------
define("APP_DIR", realpath(MAESTRANO_ROOT . '/../'));
chdir(APP_DIR);
include_once APP_DIR . '/include/MVC/preDispatch.php';
$startTime = microtime(true);
require_once APP_DIR . '/include/entryPoint.php';
require_once APP_DIR . '/include/MVC/SugarApplication.php';
$app = new SugarApplication();
require_once APP_DIR . '/modules/Accounts/Account.php';
require_once APP_DIR . '/modules/Contacts/Contact.php';

//-----------------------------------------------
// Perform your custom preparation code
//-----------------------------------------------
// If you define the $opts variable then it will
// automatically be passed to the MnoSsoUser object
// for construction
$opts = array();
$opts['db_connection'] = DBManagerFactory::getInstance();
$GLOBALS['log'] = LoggerManager::getLogger('SugarCRM');
?>