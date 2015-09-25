<?php

/**
 * Mno DB Map Interface
 */
class MnoSoaBaseLogger {
    protected $_app_prefix = "";

    public function __construct() { 
        $maestrano = MaestranoService::getInstance();
        $this->_app_prefix = $maestrano->getSettings()->app_id;
    }
    
    public function debug($msg) {
        error_log($this->_app_prefix . " [debug] " . $msg);
    }
    
    public function warn($msg) {
        error_log($this->_app_prefix . " [warn] " . $msg);
    }
    
    public function error($msg) {
        error_log($this->_app_prefix . " [error] " . $msg);
    }

    public function fatal($msg) {
        error_log($this->_app_prefix . " [fatal] " . $msg);
    }
    
    public function info($msg){
        error_log($this->_app_prefix . " [info] " . $msg);
    }

    public function deprecated($msg) {
        error_log($this->_app_prefix . " [deprecated] " . $msg);
    }
}

?>