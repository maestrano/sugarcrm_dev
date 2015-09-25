<?php

/**
* Maestrano map table functions
*
* @author root
*/

class MnoSoaDB extends MnoSoaBaseDB {

  /**
  * Update identifier map table
  * @param  	string 	local_id                Local entity identifier
  * @param    string  local_entity_name       Local entity name
  * @param	string	mno_id                  Maestrano entity identifier
  * @param	string	mno_entity_name         Maestrano entity name
  *
  * @return 	boolean Record inserted
  */            
  public function addIdMapEntry($local_id, $local_entity_name, $mno_id, $mno_entity_name) {	
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    // Fetch record
    $query = "INSERT INTO mno_id_map (mno_entity_guid, mno_entity_name, app_entity_id, app_entity_name, db_timestamp) VALUES (" . 
      $this->_db->quoted($mno_id) . "," .
      $this->_db->quoted(strtoupper($mno_entity_name)) . "," .
      $this->_db->quoted($local_id) . "," .
      $this->_db->quoted(strtoupper($local_entity_name)) . "," .
      "UTC_TIMESTAMP)";	
    $result = $this->_db->query($query);
    $this->_log->debug("addIdMapEntry query = ".$query);

    $row = $this->_db->fetchByAssoc($result);

    if (!empty($row)) {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return true");
      return true;
    } else {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return false");
      return false;
    }
  }

  /**
  * Get Maestrano GUID when provided with a local identifier
  * @param  	string 	local_id                Local entity identifier
  * @param    string  local_entity_name       Local entity name
  *
  * @return 	boolean Record found	
  */

  public function getMnoIdByLocalIdName($localId, $localEntityName) {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    $mno_entity = null;

    // Fetch record
    $query = "SELECT mno_entity_guid, mno_entity_name, deleted_flag from mno_id_map where app_entity_id=" . 
      $this->_db->quoted($localId).
      " and app_entity_name=" .
      $this->_db->quoted(strtoupper($localEntityName));
    $this->_log->debug("getMnoIdByLocalIdName query = ".$query);
    $result = $this->_db->query($query);

    $row = $this->_db->fetchByAssoc($result);

    // Return id value
    if (!empty($row)) {
      $mno_entity_guid = trim($row["mno_entity_guid"]);
      $mno_entity_name = trim($row["mno_entity_name"]);
      $deleted_flag = trim($row["deleted_flag"]);

      if (!empty($mno_entity_guid) && !empty($mno_entity_name)) {
        $mno_entity = (object) array (
          "_id" => $mno_entity_guid,
          "_entity" => $mno_entity_name,
          "_deleted_flag" => $deleted_flag
          );
      }
    }

    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " returning mno_entity = ".json_encode($mno_entity));
    return $mno_entity;
  }

  public function getLocalIdByMnoIdName($mnoId, $mnoEntityName) {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    $local_entity = null;

    // Fetch record
    $query = "SELECT app_entity_id, app_entity_name, deleted_flag from mno_id_map where mno_entity_guid=" . 
    $this->_db->quoted($mnoId) .
    " and mno_entity_name=" .
    $this->_db->quoted(strtoupper($mnoEntityName));
    $result = $this->_db->query($query);

    $row = $this->_db->fetchByAssoc($result);

    // Return id value
    if (!empty($row)) {
      $app_entity_id = trim($row["app_entity_id"]);
      $app_entity_name = trim($row["app_entity_name"]);
      $deleted_flag = trim($row["deleted_flag"]);

      if (!empty($app_entity_id) && !empty($app_entity_name)) {
        $local_entity = (object) array (
          "_id" => $app_entity_id,
          "_entity" => $app_entity_name,
          "_deleted_flag" => $deleted_flag
          );
      }
    }

    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " returning mno_entity = ".json_encode($local_entity));
    return $local_entity;
  }

  public function deleteIdMapEntry($localId, $localEntityName) {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    // Logically delete record
    $query = "UPDATE mno_id_map SET deleted_flag=1 WHERE app_entity_id=" . 
    $this->_db->quoted($localId) . 
    " and app_entity_name=" . 
    $this->_db->quoted(strtoupper($localEntityName));
    $result = $this->_db->query($query);

    $row = $this->_db->fetchByAssoc($result);

    if (!empty($row)) {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return true");
      return true;
    } else {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return false");
      return false;
    }
  }

  public function hardDeleteIdMapEntry($localId, $localEntityName) {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    // Hard delete record
    $query = "DELETE FROM mno_id_map WHERE app_entity_id='" . $localId . "' and app_entity_name='" . strtoupper($localEntityName) . "'";
    $result = $this->_db->query($query);

    if ($result) {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return true");
      return true;
    } else {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return false");
      return false;
    }
  }

  public function relinkIdMapEntry($new_local_id, $previous_local_id, $local_entity_name) {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    $query = "UPDATE mno_id_map SET app_entity_id=" .
      $this->_db->quoted($new_local_id) . 
      " WHERE app_entity_id=" . 
      $this->_db->quoted($previous_local_id) . 
      " AND app_entity_name=" . 
      $this->_db->quoted(strtoupper($local_entity_name));
    $result = $this->_db->query($query);

    $row = $this->_db->fetchByAssoc($result);

    if (!empty($row)) {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return true");
      return true;
    } else {
      $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return false");
      return false;
    }
  }
}

?>