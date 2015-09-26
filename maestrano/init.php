<?php

if (!defined('MAESTRANO_PATH')) { define("MAESTRANO_PATH", realpath(dirname(__FILE__))); }
if (!defined('ROOT_PATH')) { define("ROOT_PATH", realpath(dirname(__FILE__) . '/../')); }
chdir(ROOT_PATH);

// SugarCRM libraries
define('MAESTRANO_ROOT', MAESTRANO_PATH);
define('APP_DIR', realpath(MAESTRANO_ROOT . '/../'));
chdir(APP_DIR);
include ('include/MVC/preDispatch.php');
$startTime = microtime(true);
require_once('include/entryPoint.php');
$GLOBALS['log'] = LoggerManager::getLogger('SugarCRM');
require_once('include/MVC/SugarApplication.php');
$app = new SugarApplication();

$opts = array();
$adb = DBManagerFactory::getInstance();
$opts['db_connection'] = DBManagerFactory::getInstance();
$opts['app_unique_key'] = $sugar_config['unique_key'];

// Include Maestrano required libraries
require_once ROOT_PATH . '/vendor/maestrano/maestrano-php/lib/Maestrano.php';
Maestrano::configure(ROOT_PATH . '/maestrano.json');
