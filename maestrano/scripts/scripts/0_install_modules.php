<?php

require_once('include/SugarLogger/LoggerManager.php');
require_once('sugar_version.php');
require_once('include/utils.php');
require_once('install/install_utils.php');
require_once('install/install_defaults.php');
require_once('include/TimeDate.php');
require_once('include/Localization/Localization.php');
require_once('include/SugarTheme/SugarTheme.php');
require_once('include/utils/LogicHook.php');
require_once('data/SugarBean.php');
require_once('include/entryPoint.php');
require_once('ModuleInstall/PackageManager/PackageManager.php');
require_once('config.php');

$modules_to_install = array('oqc-openqc-2.2RC3.zip', 'MaestranoDataSharing2015_09_25_091248.zip');

$pm = new PackageManager();
foreach($modules_to_install as $module_to_install) {
  if(is_file($module_to_install)) {
    $pm->performSetup($module_to_install, 'module', false);
    $file_to_install = sugar_cached('upload/upgrades/module/').basename($module_to_install);
    $pm->performInstall($file_to_install, true);
  }
}