-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sugarcrm
-- ------------------------------------------------------
-- Server version 5.6.19-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cstm`
--

DROP TABLE IF EXISTS `accounts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `officenumber_c` varchar(25) DEFAULT NULL,
  `isexternal_c` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cstm`
--

LOCK TABLES `accounts_cstm` WRITE;
/*!40000 ALTER TABLE `accounts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('10545964-a9d7-3ea5-f571-5604abba29ca','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Campaigns','module',90,0),('10b77983-f8e5-eafd-8d5d-5604abc50d84','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Campaigns','module',90,0),('11453574-0280-8af2-cb1b-5604ab332e31','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Campaigns','module',90,0),('119fa2db-568b-6cd9-8a57-5604ab032a64','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Campaigns','module',90,0),('122b9fd1-f6be-7541-b1b5-5604ab0affc4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Campaigns','module',90,0),('126b8431-2380-61fb-b923-5604ac66bc81','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_Offering','module',89,0),('127dbc07-3b5f-2b9b-8101-5604ab69792b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Campaigns','module',90,0),('132064fe-d7c9-e8c5-f9a3-5604ac52d810','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_Offering','module',90,0),('13916585-7260-424b-9089-5604acd35f22','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_Offering','module',90,0),('142e098b-7cf3-8320-771b-5604abf4810a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','EmailTemplates','module',89,0),('1435c3ea-72f3-2150-277c-5604accd9ff4','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_Offering','module',90,0),('148753d1-4282-21a1-b041-5604ab766e1b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','EmailTemplates','module',90,0),('14b65a5e-c26a-ed88-32ae-5604ac97b96f','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_Offering','module',90,0),('151234ce-92e8-9cbc-ea91-5604abd541e6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','EmailTemplates','module',90,0),('155839fe-f51b-a2a0-1ec5-5604ac5298e9','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_Offering','module',90,0),('15645ba5-3cdb-971e-bfa0-5604ab519edb','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','EmailTemplates','module',90,0),('15e4f667-1fbd-b2e1-d4f1-5604ab42221b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','EmailTemplates','module',90,0),('15fbf8ef-4871-dc8a-6591-5604ac51f5fc','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_Offering','module',90,0),('163592e4-adfb-9dea-d84c-5604abc9f065','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','EmailTemplates','module',90,0),('16733336-6194-18fa-2b5f-5604acc79c79','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_Offering','module',90,0),('1680d102-2247-3329-820a-5604abf08dbb','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','EmailTemplates','module',90,0),('16f82811-da42-8e89-43c1-5604abe1deae','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','EmailTemplates','module',90,0),('1d25a113-7511-5bd0-463f-5604ab38cd05','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Notes','module',89,0),('1db2820e-21c7-52dc-1262-5604ab5c201a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Notes','module',90,0),('1e027356-57c0-d5d2-0b61-5604abfb0bba','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Notes','module',90,0),('1e5aeb55-d96b-fa09-522a-5604abe0a23a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Notes','module',90,0),('1edd3a02-2720-f263-cd3e-5604ab4d1dd9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Notes','module',90,0),('1f2f427d-705e-756c-78c4-5604abd9d24d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Notes','module',90,0),('1fb1b8db-9a38-0632-1f3b-5604ab06b78e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Notes','module',90,0),('20079dc7-e88e-cbec-222a-5604abebdff1','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Notes','module',90,0),('2471ad8a-7060-3648-1a34-5604abaa5d64','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','ProspectLists','module',89,0),('25d55abe-4162-1a80-a25f-5604ab0fc0fe','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','ProspectLists','module',90,0),('272c0757-29c1-a4ce-123a-5604ab10a9d8','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','ProspectLists','module',90,0),('273e78e4-6780-09dc-2aa7-5604ab1c60e5','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Calls','module',89,0),('279e507f-ea0c-1dae-faf7-5604ac32465f','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_Addition','module',89,0),('27ca72eb-5aab-941e-4c5c-5604abb14137','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Calls','module',90,0),('281ed076-a9d3-ff84-0f75-5604ab1be31e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Calls','module',90,0),('2893549a-68f5-b517-8297-5604abe9011e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','ProspectLists','module',90,0),('290b42d9-940a-b764-8571-5604ac0e8b04','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_Addition','module',90,0),('298392c1-eadf-efa2-9a19-5604ab5adc5a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Calls','module',90,0),('29ef3759-9288-4d6f-177a-5604ab406e26','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','ProspectLists','module',90,0),('2a654d5c-cf02-4922-6cee-5604ace35d14','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_Addition','module',90,0),('2ae53857-c47e-afdc-7733-5604aba98d3e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Calls','module',90,0),('2b47f498-6fc3-6bec-d79d-5604ab002511','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','ProspectLists','module',90,0),('2be4d551-ede0-5af9-5d57-5604acf32db7','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_Addition','module',90,0),('2c384471-60e9-99e5-df1c-5604ab82675e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Calls','module',90,0),('2cac8411-0d08-44ef-4824-5604ab271de9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','ProspectLists','module',90,0),('2d923334-8c0b-3fff-bf22-5604ac9ea986','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_Addition','module',90,0),('2d934646-f09f-31bc-9cd7-5604ab12846f','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Calls','module',90,0),('2e0eae26-7fba-0d5d-2b12-5604ab31232b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','ProspectLists','module',90,0),('2eed100f-afe9-f572-7595-5604abf8a2f4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Calls','module',90,0),('2f3cda4d-3d82-2404-2960-5604ac941fb6','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_Addition','module',90,0),('30f3492c-f2aa-0622-a0c2-5604ac582acd','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_Addition','module',90,0),('31a5bb86-319b-dcba-2e2a-5604abff0eac','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','EAPM','module',89,0),('323cd097-b133-68e1-ef80-5604abb057a4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','EAPM','module',90,0),('32a2fdb6-3ec9-0ad8-8381-5604aba7db95','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','EAPM','module',90,0),('32a87529-9347-81cf-c4d6-5604ac571561','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_Addition','module',90,0),('3342bfa0-4ca0-3ea4-5e03-5604ab20980a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','EAPM','module',90,0),('33a74261-1dab-46a8-8aed-5604abf08c18','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','EAPM','module',90,0),('33f6e316-df16-1b30-4de1-5604ac5fdc41','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_Task','module',89,0),('343ff17b-b53b-2271-da01-5604ab944dd4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','EAPM','module',90,0),('354e4407-de48-df4c-d1a0-5604ab0fe4db','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','EAPM','module',90,0),('35784bd1-4598-7384-d4fb-5604aca914c4','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_Task','module',90,0),('35b4fac4-dd7f-c988-7af6-5604ab5364d9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','EAPM','module',90,0),('36e03291-37a0-eabd-3afb-5604ac7a80c1','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_Task','module',90,0),('384b42c9-d920-e58a-6880-5604ac7fbcae','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_Task','module',90,0),('39ca67d5-8c6c-385c-52c5-5604ac08f9c3','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_Task','module',90,0),('3a21889e-1733-e172-3859-5604ab9e5af7','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Prospects','module',89,0),('3a88dab8-0448-cb74-970a-5604ab8cc8d8','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Prospects','module',90,0),('3b173ca0-8de9-5073-46b1-5604abd48d0c','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Prospects','module',90,0),('3b4116b0-a003-5fd2-6c12-5604acd83460','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_Task','module',90,0),('3b7eea31-d00d-ec11-a77f-5604ab5bf34a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Prospects','module',90,0),('3c103b17-de3e-d0fe-0080-5604aba16244','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Prospects','module',90,0),('3c75c0fe-b2ee-1f04-2623-5604ab3d32cf','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Prospects','module',90,0),('3cbbbf07-afb0-d254-6a2a-5604acea2bd9','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_Task','module',90,0),('3d08d9ad-6ad7-13de-5483-5604ab2874f3','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Prospects','module',90,0),('3d6e2d1f-2fcb-5ad7-0b99-5604abce1b77','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Prospects','module',90,0),('3e260299-7fb7-82ec-0c87-5604ab197034','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Leads','module',89,0),('3e412f3b-fa76-e833-027f-5604ac03c2a5','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_Task','module',90,0),('3f9cedd3-4c7d-ec42-876c-5604ab2d4c68','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Leads','module',90,0),('4116ec2a-8046-7dcf-89e6-5604ab32824b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Leads','module',90,0),('436fbc90-5278-2f05-58e8-5604abe53de8','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Leads','module',90,0),('4443136d-ff00-8206-77dc-5604ab4bfcb3','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Emails','module',89,0),('453c3e44-1ca3-824f-2a90-5604ab8a794d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Emails','module',90,0),('45bfdec7-b969-84ff-bcec-5604abf5084c','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Emails','module',90,0),('45f9265c-8af3-af96-74fd-5604aba29014','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Leads','module',90,0),('46136a17-ba30-df2b-9550-5604abee566f','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Emails','module',90,0),('466fc8df-a1d1-f730-db2f-5604abc57fa6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Emails','module',90,0),('46f0d57d-e55b-90fa-0b0c-5604ab58c7f8','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Emails','module',90,0),('47410847-61f2-6f99-3136-5604ab4ea17e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Emails','module',90,0),('4773e861-c8f1-2579-ce89-5604ab62163a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Leads','module',90,0),('47c08c5e-9788-b056-61d2-5604ab065004','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Emails','module',90,0),('48e55f24-4d0d-e293-7a08-5604ab90c1cf','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Leads','module',90,0),('4a6091db-613b-af00-005e-5604ab3a96e5','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Leads','module',90,0),('500dfabf-4d5b-7a52-3ef1-5604ab139725','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','EmailMarketing','module',89,0),('518c0b90-4854-1ab4-9f1e-5604ab019cea','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','EmailMarketing','module',90,0),('530dae70-8545-fd5e-8cee-5604ab7b0d1d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','EmailMarketing','module',90,0),('536b6097-1c34-4456-646b-5604ab19b1f9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Meetings','module',89,0),('548e3425-deec-c5d5-22f8-5604ab78e907','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','EmailMarketing','module',90,0),('54ee2160-8666-aa07-732d-5604ab0f55a6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Meetings','module',90,0),('55662f96-29ee-3024-4480-5604ac9b3f71','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_Category','module',89,0),('56171f7b-2ada-8ece-ff0f-5604abbe5292','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','EmailMarketing','module',90,0),('567087d2-b22f-e1de-ff11-5604abc416cc','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Meetings','module',90,0),('56d8830d-c03c-56d8-78b3-5604ac963fe1','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_Category','module',90,0),('57994d0c-fe03-7e92-aa7e-5604abdf2bfa','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','EmailMarketing','module',90,0),('57ef0df0-7301-564b-eea7-5604ab5cc030','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Meetings','module',90,0),('58459ffb-4696-3123-7920-5604ac006722','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_Category','module',90,0),('59264b6c-ccd9-8e12-0200-5604ab3b5a89','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','EmailMarketing','module',90,0),('5977d443-1564-d2eb-761e-5604abca1fc4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Meetings','module',90,0),('59a53f8a-95b7-d9c1-449f-5604ac2b5047','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_Category','module',90,0),('5aa568a7-a3b0-5141-2df8-5604ab416641','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','EmailMarketing','module',90,0),('5aefaea3-a9e0-a40a-6c26-5604abb094f6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Meetings','module',90,0),('5b0701e2-81c8-e6d2-4baa-5604aca37356','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_Category','module',90,0),('5c67b3a9-dfc1-1d02-3a20-5604ace7534d','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_Category','module',90,0),('5c6ae611-9fff-4dd6-703c-5604abf2a6d6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Meetings','module',90,0),('5dc912c7-2de7-eb03-8c9d-5604ac55b16b','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_Category','module',90,0),('5de437fb-8c19-fc2a-2a46-5604ab996f70','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Meetings','module',90,0),('5f3782af-62da-107c-dc7c-5604ac7751b4','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_Category','module',90,0),('64b88297-170a-8e0d-9a9f-5604ab640c64','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Cases','module',89,0),('654db2d1-1522-42d2-fa2f-5604ab44687a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Cases','module',90,0),('65adeff6-3516-fb78-74fd-5604ab53dc78','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Cases','module',90,0),('670b9cf4-66d6-c17d-82d5-5604ab78e564','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Cases','module',90,0),('686a5c0c-803f-5351-582a-5604abc0b5a9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Cases','module',90,0),('69ca0c3c-dc2c-d846-3c03-5604ab64a90d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Cases','module',90,0),('6b32689f-14aa-853c-76ae-5604ab90ac6b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Cases','module',90,0),('6c97d9cf-65bd-a978-dd41-5604ab605135','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Cases','module',90,0),('72855ad8-9d0c-6ba2-d676-5604abaa88e5','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Tasks','module',89,0),('732705aa-79ae-813b-d1dc-5604aba9275f','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Tasks','module',90,0),('73be447d-6399-9a76-bb9e-5604ab0a3108','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Tasks','module',90,0),('7436b5d0-8e38-08b3-1400-5604abcce2f0','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Tasks','module',90,0),('74ff956d-41b7-e060-884a-5604abf05f66','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Tasks','module',90,0),('75bd3110-222f-e4bf-0c1c-5604ac3c58c6','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_ProductCatalog','module',89,0),('75d8f96e-5c5a-07d4-254a-5604abf741fb','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Tasks','module',90,0),('762e29ff-9e6c-81b6-8ec1-5604ac4d311c','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_ProductCatalog','module',90,0),('767059c3-1f3f-2fb1-7191-5604abd95cce','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Tasks','module',90,0),('76c6b7dc-c596-12de-3319-5604ac3e6a24','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_ProductCatalog','module',90,0),('772466a4-8f3a-95dd-a8e2-5604accf17a8','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_ProductCatalog','module',90,0),('7740621e-dae6-1969-7b75-5604abb743f6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Tasks','module',90,0),('77bb1bfe-248c-c835-5a00-5604aca35c9d','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_ProductCatalog','module',90,0),('7825f417-b044-cfa1-3771-5604aca8b372','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_ProductCatalog','module',90,0),('78b28bde-3cd1-0eda-a8a2-5604ac330692','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_ProductCatalog','module',90,0),('7911d05c-1d7d-a219-9f82-5604acf7850a','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_ProductCatalog','module',90,0),('89e5dec0-c5c2-48a1-3986-5604abf201ed','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Bugs','module',89,0),('8a9302b9-0898-25aa-cdca-5604abc8bdea','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Bugs','module',90,0),('8b31b930-333a-6ac4-8c2b-5604ab6584d9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Bugs','module',90,0),('8b9b349f-ba93-1f97-88bd-5604abfb1ab4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Bugs','module',90,0),('8c31b951-084e-7a59-1181-5604abedd13d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Bugs','module',90,0),('8c9979ca-ea3b-860a-2f51-5604ab91cd2a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Bugs','module',90,0),('8d2c8ab0-e0d2-4a5a-c4d0-5604ab65fdb6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Bugs','module',90,0),('8d94fa74-282a-5418-f5b3-5604ab090f37','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Bugs','module',90,0),('8ec2a49d-8c8c-cf37-6a16-5604acdb47fa','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_ExternalContract','module',89,0),('90350c4a-769c-6c78-d382-5604ac7e3335','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_ExternalContract','module',90,0),('91a747f0-3daa-aba5-0c38-5604acdf77d0','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_ExternalContract','module',90,0),('9311bf7c-ed47-1de8-40cc-5604ac0b41c1','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_ExternalContract','module',90,0),('9478431e-a9b9-0194-551a-5604ac661f25','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_ExternalContract','module',90,0),('95e21467-5968-d30f-8b10-5604ac9af3f2','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_ExternalContract','module',90,0),('96f772a8-9a99-3cd1-d358-5604ac366169','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_ExternalContract','module',90,0),('97a5244a-4dfd-2534-beec-5604ac1c2b60','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_ExternalContract','module',90,0),('99497514-2d6e-08e5-7113-5604ab9cf4ee','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Contacts','module',89,0),('9af07613-f07c-d6a4-dda5-5604ab27027b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Contacts','module',90,0),('9c6a3373-70cb-449e-b5f9-5604ab9e2ec2','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Contacts','module',90,0),('9de0b048-6270-0923-fd49-5604abb92898','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Contacts','module',90,0),('9f5ed7e2-a957-26d2-e54a-5604abada842','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Contacts','module',90,0),('9f99484c-c000-e3ac-4632-5604ace907b8','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_Product','module',89,0),('a0c71e22-c3b2-f39d-bb94-5604abf65b8e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Contacts','module',90,0),('a0f2ee61-0828-b317-686d-5604acccb0de','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_Product','module',90,0),('a167f6a7-d320-f9b8-c857-5604ac155f7f','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_ExternalContractPositions','module',89,0),('a1c03a5b-abae-8714-129d-5604ac2a971c','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_Product','module',90,0),('a22b5089-d93a-c038-8724-5604abfd378b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Contacts','module',90,0),('a23f8100-bee2-19ab-3ae2-5604ac796b53','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_ExternalContractPositions','module',90,0),('a329f5c8-9de4-2e74-3ba0-5604acf277b3','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_Product','module',90,0),('a331b688-501b-ddc8-e0b8-5604aca0de88','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_ExternalContractPositions','module',90,0),('a38fb7a0-e853-9b91-c9b9-5604ab580c9d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Contacts','module',90,0),('a43263b1-c2a1-d2bf-459b-5604ac7355e2','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_ExternalContractPositions','module',90,0),('a49471b6-f66d-bb0e-aae2-5604ac125608','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_Product','module',90,0),('a5ee5bd2-f6f4-9c06-c82d-5604ac258a0b','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_ExternalContractPositions','module',90,0),('a607dfcb-0d0a-b3c5-f250-5604ac147d39','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_Product','module',90,0),('a76cbe87-4001-b319-e454-5604acedb73a','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_Product','module',90,0),('a79ce563-3561-27a7-b528-5604acef722a','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_ExternalContractPositions','module',90,0),('a8ce6630-05f1-f0ba-c465-5604ac5deaed','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_Product','module',90,0),('a957912a-ade0-b2aa-6816-5604acd69ae3','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_ExternalContractPositions','module',90,0),('ab11ccdb-ef6c-034a-5f36-5604ac2d8dac','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_ExternalContractPositions','module',90,0),('af8681cb-7239-69d5-d6d3-5604ab577054','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Users','module',89,0),('b029b15e-9bf0-e190-2d24-5604ab4e10be','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Users','module',90,0),('b0c93b20-2f2c-04fa-82a3-5604abed6c9d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Users','module',90,0),('b1673193-4de0-a96f-3e73-5604ab8489da','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Users','module',90,0),('b1e7ff50-0cb0-272f-ca6f-5604abdc093b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Users','module',90,0),('b2852eac-de6b-fe27-eb1a-5604ab055e4d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Users','module',90,0),('b32368a0-eb42-eed5-e737-5604ab5dbcb0','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Users','module',90,0),('b392904f-2ae0-0818-b792-5604abbfbf9e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Users','module',90,0),('b9c33f45-351b-e3ed-594f-5604ab90e305','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Accounts','module',89,0),('bad0065b-07d2-3b38-7609-5604ab4599e9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Accounts','module',90,0),('bb9d47e8-96f3-110e-35e3-5604acda881e','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_Contract','module',89,0),('bc2fee65-4d19-d11b-b309-5604ac6a98a3','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_Contract','module',90,0),('bc6c68b2-dc3f-02c3-5462-5604ab236565','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Accounts','module',90,0),('bc861cf9-2cd7-d8a8-bb10-5604ac5c8998','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_Contract','module',90,0),('bd0c44e3-3718-bf1d-7cea-5604acb56fca','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_Contract','module',90,0),('bd64aab4-8b47-795f-24ce-5604acf81595','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_Contract','module',90,0),('bde63d28-b673-b2b3-2c78-5604ab66f2d5','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Accounts','module',90,0),('bdfc20ba-bc2a-9ab2-4a37-5604ac975d3b','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_Contract','module',90,0),('be570267-a74a-582a-1135-5604acc41148','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_Contract','module',90,0),('bf47ed75-be21-6eb1-02dc-5604ac9ce2b9','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_Contract','module',90,0),('bf5c28db-0c6d-9323-3842-5604ab842543','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Accounts','module',90,0),('c0de0334-dac7-8ef3-9d8b-5604ab4595c1','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Accounts','module',90,0),('c0e937de-92c9-a38f-a500-5604ac81cf97','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_ExternalContractCosts','module',89,0),('c169bcda-3657-1399-5eb0-5604ac48e04a','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_ExternalContractCosts','module',90,0),('c2072a36-7240-a493-549b-5604ac5e45c0','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_ExternalContractCosts','module',90,0),('c2560091-7a6f-17e8-74b5-5604ab1a19c1','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Accounts','module',90,0),('c2739c43-05f4-dd66-01a7-5604acefe7c6','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_ExternalContractCosts','module',90,0),('c31b0bca-c985-66ac-d604-5604ac3109cd','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_ExternalContractCosts','module',90,0),('c3c77ce4-f440-0f46-e9cb-5604ac757b82','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_ExternalContractCosts','module',90,0),('c3c78513-04e7-6cc8-43c4-5604abef7537','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Accounts','module',90,0),('c4f94a81-de11-2186-739c-5604acb43ac3','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_ExternalContractCosts','module',90,0),('c56ec3b8-3956-dd2c-bbf2-5604ac09d214','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_ExternalContractCosts','module',90,0),('ca835b4b-b6a2-7d3f-ac63-5604ab84a601','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Project','module',89,0),('cbedc336-be4a-2ddd-f05e-5604abe2e6a6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Project','module',90,0),('cca5d419-8c8b-677e-7a19-5604ab00170c','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Documents','module',89,0),('cd531c76-8209-793d-1a44-5604abedf91d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Project','module',90,0),('ce6c3c2f-36bb-32ab-78b4-5604ab95c1dc','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Documents','module',90,0),('ceb5a94b-26a0-ef88-c5c4-5604abe74b67','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Project','module',90,0),('d0199edd-b4d5-ca16-778e-5604aba26536','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Project','module',90,0),('d020d407-e831-7721-eb06-5604ab779e2e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Documents','module',90,0),('d17e1071-a6c3-0b14-ddde-5604ab46018d','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Project','module',90,0),('d1c355b1-7469-0af3-1569-5604ac769938','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_Service','module',89,0),('d1d70752-ef5f-7675-5c42-5604ab153ce4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Documents','module',90,0),('d29526f0-2036-5942-2b85-5604acc80340','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_ExternalContractDetailedCosts','module',89,0),('d2ea5818-d429-cf20-182b-5604abfcfcb4','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Project','module',90,0),('d32fc3e8-2e99-cfc2-ec45-5604acee5d12','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_Service','module',90,0),('d394807a-dcab-2e9b-d093-5604abb90001','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Documents','module',90,0),('d4396585-db7a-7912-25fc-5604acec2504','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_ExternalContractDetailedCosts','module',90,0),('d45e60f1-6146-88cf-02c8-5604abd651c6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Project','module',90,0),('d4955733-4f27-2585-9706-5604ac453d43','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_Service','module',90,0),('d563f9a5-553c-7d06-13e1-5604ab5f0545','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Documents','module',90,0),('d568b9a0-1f50-6609-3878-5604ac51cde6','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_Service','module',90,0),('d5c54c66-7b1e-cea9-6551-5604ac08e185','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_ExternalContractDetailedCosts','module',90,0),('d6d4d84a-02ca-a2d9-5e6a-5604ac95a747','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_Service','module',90,0),('d720dcfa-7a1d-a54b-be4b-5604ab699e05','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Documents','module',90,0),('d73aa548-14e7-c7b7-da8a-5604acbfc4ed','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_ExternalContractDetailedCosts','module',90,0),('d8463c26-32e0-6c12-ee55-5604ac609907','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_Service','module',90,0),('d8b466b6-21d1-84ab-e829-5604ac03a181','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_ExternalContractDetailedCosts','module',90,0),('d8d469f6-d901-088d-cc4d-5604abe8b72e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Documents','module',90,0),('d9ac4817-b643-c53a-da3e-5604ac6d2243','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_Service','module',90,0),('da44f112-93e4-db15-4271-5604aca9201d','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_ExternalContractDetailedCosts','module',90,0),('db17d039-e996-a7ad-10e2-5604ac632afe','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_Service','module',90,0),('dbdfc716-765f-97b1-8635-5604ac64d934','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_ExternalContractDetailedCosts','module',90,0),('dd63c820-e5b2-1615-2225-5604ac3fd51d','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_ExternalContractDetailedCosts','module',90,0),('e120693b-44e4-eb5b-0fa0-5604ac47926f','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_EditedTextBlock','module',89,0),('e18e61e6-46af-8b26-e26b-5604acd98d0a','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_EditedTextBlock','module',90,0),('e22205f1-7bd8-085a-ffc9-5604ac0374ff','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_EditedTextBlock','module',90,0),('e271a17f-92ad-06d2-f3dd-5604abfe9ee3','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','ProjectTask','module',89,0),('e287c095-0842-6c9b-ab8a-5604acbe8bd5','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_EditedTextBlock','module',90,0),('e3007f56-bdea-385f-645b-5604ab95d594','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','ProjectTask','module',90,0),('e31e8e55-d3ff-c789-9867-5604ac46b3f9','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_EditedTextBlock','module',90,0),('e3685fb5-de2f-1710-56d8-5604ab9dc6ca','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','ProjectTask','module',90,0),('e388a7c4-4cdc-18f7-119e-5604aca17210','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_EditedTextBlock','module',90,0),('e3f3c8c5-57ba-6886-e555-5604ab7ceb12','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','ProjectTask','module',90,0),('e4256d18-eeb3-1b12-4a85-5604ac41e428','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_EditedTextBlock','module',90,0),('e44d0dac-6b5a-0bfd-f0fa-5604ab4a4b80','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','ProjectTask','module',90,0),('e48def67-60b1-5a77-88d6-5604acd43bf8','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_EditedTextBlock','module',90,0),('e49004de-a23b-1882-a315-5604abf26b0a','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Opportunities','module',89,0),('e4a2d346-5995-150e-1ad7-5604abca01c6','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','ProjectTask','module',90,0),('e51287bd-259a-1bfb-5385-5604ab95cba5','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Opportunities','module',90,0),('e52352b7-d819-d7a4-594b-5604abe6bafd','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','ProjectTask','module',90,0),('e56b1b3a-28dd-1c6f-1a96-5604ab64cc9f','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','list','Opportunities','module',90,0),('e57dac9f-2942-54b9-7028-5604ab58fa8b','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','ProjectTask','module',90,0),('e5fac414-2b0c-d319-4d4d-5604ab3fce1e','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','edit','Opportunities','module',90,0),('e64bace6-924b-da37-c97d-5604ab474f8f','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','delete','Opportunities','module',90,0),('e6c2655b-a1b0-f061-cca9-5604ab1d7b38','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','import','Opportunities','module',90,0),('e7109599-6ec0-898d-78d5-5604ab45a308','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','export','Opportunities','module',90,0),('e75e3448-b9c4-e40e-231e-5604ab91a014','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','massupdate','Opportunities','module',90,0),('e96043b0-2205-af9c-e28d-5604acd6f26c','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','access','oqc_TextBlock','module',89,0),('ea080b98-9586-efbf-c691-5604ace2400a','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','view','oqc_TextBlock','module',90,0),('ea7e82c5-cb8e-d86d-067c-5604ac8ed380','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','list','oqc_TextBlock','module',90,0),('ebf51330-cc6d-f60f-5633-5604accdcf6f','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','edit','oqc_TextBlock','module',90,0),('ed683470-52ef-87df-96f5-5604ac715883','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','delete','oqc_TextBlock','module',90,0),('eed10f85-3873-5746-ba46-5604ac25601b','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','import','oqc_TextBlock','module',90,0),('f03b522b-f39d-6285-b0a8-5604aca9f587','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','export','oqc_TextBlock','module',90,0),('f1a89925-7a89-8619-cc60-5604ac7df7a6','2015-09-25 02:05:59','2015-09-25 02:05:59','1','1','massupdate','oqc_TextBlock','module',90,0),('f1cb0bc9-476b-08f6-f846-5604ab5fdb92','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','access','Campaigns','module',89,0),('fbd00ef9-6f8a-11a7-dd40-5604ab1748a9','2015-09-25 02:04:13','2015-09-25 02:04:13','1','','view','Campaigns','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SugarCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.22'),('MySettings','tab','YToyNDp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6NToiQ2FzZXMiO3M6NToiQ2FzZXMiO3M6OToiUHJvc3BlY3RzIjtzOjk6IlByb3NwZWN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoxMToib3FjX1Byb2R1Y3QiO3M6MTE6Im9xY19Qcm9kdWN0IjtzOjEyOiJvcWNfQ29udHJhY3QiO3M6MTI6Im9xY19Db250cmFjdCI7czoxMzoib3FjX1RleHRCbG9jayI7czoxMzoib3FjX1RleHRCbG9jayI7czoxMjoib3FjX09mZmVyaW5nIjtzOjEyOiJvcWNfT2ZmZXJpbmciO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7czoxODoib3FjX1Byb2R1Y3RDYXRhbG9nIjtzOjIwOiJvcWNfRXh0ZXJuYWxDb250cmFjdCI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO3M6ODoib3FjX1Rhc2siO3M6ODoib3FjX1Rhc2siO3M6OToiTU5PX1RheGVzIjtzOjk6Ik1OT19UYXhlcyI7fQ=='),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Cases','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Opportunities','1'),('sugarfeed','module_Leads','1'),('Update','CheckUpdates','automatic'),('system','name','SugarCRM'),('license','msg_admin',''),('license','msg_all',''),('license','last_validation','success'),('license','latest_versions','YToxOntpOjA7YToyOntzOjc6InZlcnNpb24iO3M6NjoiNi41LjIwIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxNjM6IlRoZSBsYXRlc3QgdmVyc2lvbiBvZiBTdWdhckNSTSBpcyA2LjUuMjAuICBQbGVhc2UgdmlzaXQgPGEgaHJlZj0iaHR0cDovL3N1cHBvcnQuc3VnYXJjcm0uY29tIiB0YXJnZXQ9Il9uZXciPnN1cHBvcnQuc3VnYXJjcm0uY29tPC9hPiB0byBhY3F1aXJlIHRoZSBsYXRlc3QgdmVyc2lvbi4iO319'),('Update','last_check_date','1443146688'),('system','adminwizard','1'),('notify','allow_default_outbound','0');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cstm`
--

DROP TABLE IF EXISTS `contacts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `isexternal_c` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cstm`
--

LOCK TABLES `contacts_cstm` WRITE;
/*!40000 ALTER TABLE `contacts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cstm`
--

DROP TABLE IF EXISTS `documents_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cstm` (
  `id_c` char(36) NOT NULL,
  `document_purpose_c` varchar(100) DEFAULT ' ',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cstm`
--

LOCK TABLES `documents_cstm` WRITE;
/*!40000 ALTER TABLE `documents_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
INSERT INTO `email_addr_bean_rel` VALUES ('34c0531d-5c72-806e-8abd-5604abc3786d','34d07c45-5869-3fba-f952-5604ab9ade48','1','Users',1,0,'2015-09-25 02:05:32','2015-09-25 02:05:32',0),('4c8cef59-a898-a719-7194-5604ac560dd0','4c989ba8-d4d6-5f96-1a07-5604acc5d49a','4b4e55a5-4581-05a5-4f14-5604acc3ed56','Users',1,0,'2015-09-25 02:08:11','2015-09-25 02:08:11',0);
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES ('34d07c45-5869-3fba-f952-5604ab9ade48','it@maestrano.com','IT@MAESTRANO.COM',0,0,'2015-09-25 02:05:32','2015-09-25 02:05:32',0),('4c989ba8-d4d6-5f96-1a07-5604acc5d49a','bruno.chauvet@maestrano.com','BRUNO.CHAUVET@MAESTRANO.COM',0,0,'2015-09-25 02:08:11','2015-09-25 02:08:11',0);
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('691376b4-8bd4-84aa-5a27-5604abde47a8','2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL),('6af2ed87-213d-94d0-2c8b-5604ab387afe','2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
INSERT INTO `fields_meta_data` VALUES ('Accountsisexternal_c','isexternal_c','LBL_OQC_EXTERNAL','','','Accounts','bool',255,0,'0','2015-09-25 02:05:59',0,0,0,0,1,'true','','','',''),('Accountsofficenumber_c','officenumber_c','LBL_OQC_OFFICE_NUMBER','','','Accounts','varchar',25,0,NULL,'2015-09-25 02:05:59',0,0,0,0,1,'true','','','',''),('Contactsisexternal_c','isexternal_c','LBL_OQC_EXTERNAL','','','Contacts','bool',255,0,'0','2015-09-25 02:05:59',0,0,0,0,1,'true','','','',''),('Documentsdocument_purpose_c','document_purpose_c','LBL_DOCUMENT_PURPOSE','','','Documents','enum',100,0,' ','2015-09-25 02:05:59',0,0,0,0,1,'true','document_purpose_list','','','');
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_additio_oqc_product`
--

DROP TABLE IF EXISTS `oqc_additio_oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_additio_oqc_product` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `oqc_product_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_additio_oqc_product_ida1` (`oqc_addition_ida`),
  KEY `oqc_additio_oqc_product_idb2` (`oqc_product_idb`),
  KEY `oqc_additio_oqc_product_idc3` (`oqc_addition_ida`,`oqc_product_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_additio_oqc_product`
--

LOCK TABLES `oqc_additio_oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_additio_oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_additio_oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_additio_oqc_service`
--

DROP TABLE IF EXISTS `oqc_additio_oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_additio_oqc_service` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `oqc_service_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_additio_oqc_service_ida1` (`oqc_addition_ida`),
  KEY `oqc_additio_oqc_service_idb2` (`oqc_service_idb`),
  KEY `oqc_additio_oqc_service_idc3` (`oqc_addition_ida`,`oqc_service_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_additio_oqc_service`
--

LOCK TABLES `oqc_additio_oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_additio_oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_additio_oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition`
--

DROP TABLE IF EXISTS `oqc_addition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_addition_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `attachments` varchar(255) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'Ad',
  `company_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `contactperson_id` char(36) DEFAULT NULL,
  `clienttechnicalcontact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `svnumber` varchar(255) DEFAULT NULL,
  `textblocksequence` text,
  `attachmentsequence` text,
  `idoffreetextblock` char(36) DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nextrevisions` text,
  `quote_leadtime` varchar(255) DEFAULT '1 month',
  `shipment_terms` varchar(100) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT '30 days net',
  `quote_validity` varchar(255) DEFAULT '60 days',
  `total_cost` double DEFAULT NULL,
  `grand_total_vat` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `install_cost` double DEFAULT NULL,
  `shipment_cost` double DEFAULT NULL,
  `warranty` varchar(255) DEFAULT '30 days',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_template` varchar(36) DEFAULT 'Addition',
  `contractid` varchar(36) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_additionnumk` (`oqc_addition_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition`
--

LOCK TABLES `oqc_addition` WRITE;
/*!40000 ALTER TABLE `oqc_addition` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_accounts`
--

DROP TABLE IF EXISTS `oqc_addition_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_addition_accounts_ida1` (`oqc_addition_ida`),
  KEY `oqc_addition_accounts_idb2` (`accounts_idb`),
  KEY `oqc_addition_accounts_idc3` (`oqc_addition_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_accounts`
--

LOCK TABLES `oqc_addition_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_addition_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_audit`
--

DROP TABLE IF EXISTS `oqc_addition_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_addition_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_audit`
--

LOCK TABLES `oqc_addition_audit` WRITE;
/*!40000 ALTER TABLE `oqc_addition_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_contacts`
--

DROP TABLE IF EXISTS `oqc_addition_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_addition_contacts_ida1` (`oqc_addition_ida`),
  KEY `oqc_addition_contacts_idb2` (`contacts_idb`),
  KEY `oqc_addition_contacts_idc3` (`oqc_addition_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_contacts`
--

LOCK TABLES `oqc_addition_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_addition_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_documents`
--

DROP TABLE IF EXISTS `oqc_addition_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_addition_documents_ida1` (`oqc_addition_ida`),
  KEY `oqc_addition_documents_idb2` (`documents_idb`),
  KEY `oqc_addition_documents_idc3` (`oqc_addition_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_documents`
--

LOCK TABLES `oqc_addition_documents` WRITE;
/*!40000 ALTER TABLE `oqc_addition_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_category`
--

DROP TABLE IF EXISTS `oqc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_category` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `subcategories` text,
  `number` varchar(36) DEFAULT NULL,
  `catalog_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_category`
--

LOCK TABLES `oqc_category` WRITE;
/*!40000 ALTER TABLE `oqc_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contrac_oqc_product`
--

DROP TABLE IF EXISTS `oqc_contrac_oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contrac_oqc_product` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `oqc_product_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contrac_oqc_product_ida1` (`oqc_contract_ida`),
  KEY `oqc_contrac_oqc_product_idb2` (`oqc_product_idb`),
  KEY `oqc_contrac_oqc_product_idc3` (`oqc_contract_ida`,`oqc_product_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contrac_oqc_product`
--

LOCK TABLES `oqc_contrac_oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_contrac_oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contrac_oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contrac_oqc_service`
--

DROP TABLE IF EXISTS `oqc_contrac_oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contrac_oqc_service` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `oqc_service_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contrac_oqc_service_ida1` (`oqc_contract_ida`),
  KEY `oqc_contrac_oqc_service_idb2` (`oqc_service_idb`),
  KEY `oqc_contrac_oqc_service_idc3` (`oqc_contract_ida`,`oqc_service_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contrac_oqc_service`
--

LOCK TABLES `oqc_contrac_oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_contrac_oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contrac_oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract`
--

DROP TABLE IF EXISTS `oqc_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_contract_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `attachments` varchar(255) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'Cnt',
  `company_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `contactperson_id` char(36) DEFAULT NULL,
  `clienttechnicalcontact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `svnumber` varchar(255) DEFAULT NULL,
  `textblocksequence` text,
  `attachmentsequence` text,
  `idoffreetextblock` char(36) DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nextrevisions` text,
  `quote_leadtime` varchar(255) DEFAULT '1 month',
  `shipment_terms` varchar(100) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT '30 days net',
  `quote_validity` varchar(255) DEFAULT '60 days',
  `total_cost` double DEFAULT NULL,
  `grand_total_vat` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `install_cost` double DEFAULT NULL,
  `shipment_cost` double DEFAULT NULL,
  `warranty` varchar(255) DEFAULT '30 days',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_template` varchar(36) DEFAULT 'Contract',
  `idsofadditions` text,
  `offeringid` varchar(36) DEFAULT NULL,
  `signedcontractdocument_id` char(36) DEFAULT NULL,
  `issigned` tinyint(1) DEFAULT NULL,
  `signedon` date DEFAULT NULL,
  `periodofnotice` varchar(100) DEFAULT '6months',
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_contractnumk` (`oqc_contract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract`
--

LOCK TABLES `oqc_contract` WRITE;
/*!40000 ALTER TABLE `oqc_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_accounts`
--

DROP TABLE IF EXISTS `oqc_contract_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_accounts_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_accounts_idb2` (`accounts_idb`),
  KEY `oqc_contract_accounts_idc3` (`oqc_contract_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_accounts`
--

LOCK TABLES `oqc_contract_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_contract_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_audit`
--

DROP TABLE IF EXISTS `oqc_contract_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_contract_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_audit`
--

LOCK TABLES `oqc_contract_audit` WRITE;
/*!40000 ALTER TABLE `oqc_contract_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_contacts`
--

DROP TABLE IF EXISTS `oqc_contract_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_contacts_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_contacts_idb2` (`contacts_idb`),
  KEY `oqc_contract_contacts_idc3` (`oqc_contract_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_contacts`
--

LOCK TABLES `oqc_contract_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_contract_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_documents`
--

DROP TABLE IF EXISTS `oqc_contract_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_documents_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_documents_idb2` (`documents_idb`),
  KEY `oqc_contract_documents_idc3` (`oqc_contract_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_documents`
--

LOCK TABLES `oqc_contract_documents` WRITE;
/*!40000 ALTER TABLE `oqc_contract_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_oqc_addition`
--

DROP TABLE IF EXISTS `oqc_contract_oqc_addition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_oqc_addition` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `oqc_addition_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_oqc_addition_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_oqc_addition_idb2` (`oqc_addition_idb`),
  KEY `oqc_contract_oqc_addition_idc3` (`oqc_contract_ida`,`oqc_addition_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_oqc_addition`
--

LOCK TABLES `oqc_contract_oqc_addition` WRITE;
/*!40000 ALTER TABLE `oqc_contract_oqc_addition` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_oqc_addition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_project`
--

DROP TABLE IF EXISTS `oqc_contract_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_project` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_project_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_project_idb2` (`project_idb`),
  KEY `oqc_contract_project_idc3` (`oqc_contract_ida`,`project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_project`
--

LOCK TABLES `oqc_contract_project` WRITE;
/*!40000 ALTER TABLE `oqc_contract_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_default`
--

DROP TABLE IF EXISTS `oqc_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_default` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `param` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_default`
--

LOCK TABLES `oqc_default` WRITE;
/*!40000 ALTER TABLE `oqc_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_editedtextblock`
--

DROP TABLE IF EXISTS `oqc_editedtextblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_editedtextblock` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `textblock_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_editedtextblock`
--

LOCK TABLES `oqc_editedtextblock` WRITE;
/*!40000 ALTER TABLE `oqc_editedtextblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_editedtextblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaact_accounts`
--

DROP TABLE IF EXISTS `oqc_externaact_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaact_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaact_accounts_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaact_accounts_idb2` (`accounts_idb`),
  KEY `oqc_externaact_accounts_idc3` (`oqc_externalcontract_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaact_accounts`
--

LOCK TABLES `oqc_externaact_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_externaact_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaact_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaact_contacts`
--

DROP TABLE IF EXISTS `oqc_externaact_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaact_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaact_contacts_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaact_contacts_idb2` (`contacts_idb`),
  KEY `oqc_externaact_contacts_idc3` (`oqc_externalcontract_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaact_contacts`
--

LOCK TABLES `oqc_externaact_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_externaact_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaact_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externact_documents`
--

DROP TABLE IF EXISTS `oqc_externact_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externact_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externact_documents_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externact_documents_idb2` (`documents_idb`),
  KEY `oqc_externact_documents_idc3` (`oqc_externalcontract_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externact_documents`
--

LOCK TABLES `oqc_externact_documents` WRITE;
/*!40000 ALTER TABLE `oqc_externact_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externact_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontract`
--

DROP TABLE IF EXISTS `oqc_externalcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontract` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_externalcontract_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `contractnumber` varchar(255) DEFAULT NULL,
  `recordtoken` varchar(255) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `minimumduration` date DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `externalcontracttype` varchar(100) DEFAULT 'EVB-IT System',
  `externalcontractmatter` text,
  `contractnumberclient` varchar(255) DEFAULT NULL,
  `dmsnumber` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'WEB',
  `payforefford` tinyint(1) DEFAULT NULL,
  `paytravelcosts` tinyint(1) DEFAULT NULL,
  `payextracosts` tinyint(1) DEFAULT NULL,
  `payforexpense` tinyint(1) DEFAULT NULL,
  `payforexpensedescription` text,
  `copydocumentationallowed` tinyint(1) DEFAULT NULL,
  `numberofdocumentationcopies` int(11) DEFAULT NULL,
  `cancellationdate` date DEFAULT NULL,
  `warranteedeadline` int(11) DEFAULT NULL,
  `deliveryaddress` varchar(255) DEFAULT NULL,
  `completionaddress` varchar(255) DEFAULT NULL,
  `attachmentsequence` text,
  `kst` int(12) DEFAULT NULL,
  `svnumbers` text,
  `productnumber` varchar(255) DEFAULT NULL,
  `costs` text,
  `positions` text,
  `monthsguaranteed` int(3) DEFAULT NULL,
  `cancellationperiod` text,
  `endperiod` varchar(100) DEFAULT '3months',
  `finalcosts` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `minpayment` double DEFAULT NULL,
  `maxpayment` double DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `nextrevisions` text,
  `version` int(11) DEFAULT NULL,
  `warn_in_months` varchar(3) DEFAULT '2',
  `already_notified` tinyint(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_externalcontractnumk` (`oqc_externalcontract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontract`
--

LOCK TABLES `oqc_externalcontract` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontract_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontract_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontract_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontract_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontract_audit`
--

LOCK TABLES `oqc_externalcontract_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontract_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontract_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractcosts`
--

DROP TABLE IF EXISTS `oqc_externalcontractcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractcosts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `paymentinterval` varchar(100) DEFAULT 'once',
  `year` int(11) DEFAULT NULL,
  `detailedcost_ids` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractcosts`
--

LOCK TABLES `oqc_externalcontractcosts` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractcosts_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontractcosts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractcosts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontractcosts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractcosts_audit`
--

LOCK TABLES `oqc_externalcontractcosts_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractcosts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractcosts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractdetailedcosts`
--

DROP TABLE IF EXISTS `oqc_externalcontractdetailedcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractdetailedcosts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `cost_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractdetailedcosts`
--

LOCK TABLES `oqc_externalcontractdetailedcosts` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractdetailedcosts_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontractdetailedcosts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractdetailedcosts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontractdetailedcosts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractdetailedcosts_audit`
--

LOCK TABLES `oqc_externalcontractdetailedcosts_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractpositions`
--

DROP TABLE IF EXISTS `oqc_externalcontractpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractpositions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'hardware',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractpositions`
--

LOCK TABLES `oqc_externalcontractpositions` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractpositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractpositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractpositions_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontractpositions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractpositions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontractpositions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractpositions_audit`
--

LOCK TABLES `oqc_externalcontractpositions_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractpositions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractpositions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaoqc_contract`
--

DROP TABLE IF EXISTS `oqc_externaoqc_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaoqc_contract` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `oqc_contract_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaoqc_contract_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaoqc_contract_idb2` (`oqc_contract_idb`),
  KEY `oqc_externaoqc_contract_idc3` (`oqc_externalcontract_ida`,`oqc_contract_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaoqc_contract`
--

LOCK TABLES `oqc_externaoqc_contract` WRITE;
/*!40000 ALTER TABLE `oqc_externaoqc_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaoqc_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaract_project`
--

DROP TABLE IF EXISTS `oqc_externaract_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaract_project` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaract_project_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaract_project_idb2` (`project_idb`),
  KEY `oqc_externaract_project_idc3` (`oqc_externalcontract_ida`,`project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaract_project`
--

LOCK TABLES `oqc_externaract_project` WRITE;
/*!40000 ALTER TABLE `oqc_externaract_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaract_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offerin_oqc_product`
--

DROP TABLE IF EXISTS `oqc_offerin_oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offerin_oqc_product` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `oqc_product_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offerin_oqc_product_ida1` (`oqc_offering_ida`),
  KEY `oqc_offerin_oqc_product_idb2` (`oqc_product_idb`),
  KEY `oqc_offerin_oqc_product_idc3` (`oqc_offering_ida`,`oqc_product_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offerin_oqc_product`
--

LOCK TABLES `oqc_offerin_oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_offerin_oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offerin_oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offerin_oqc_service`
--

DROP TABLE IF EXISTS `oqc_offerin_oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offerin_oqc_service` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `oqc_service_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offerin_oqc_service_ida1` (`oqc_offering_ida`),
  KEY `oqc_offerin_oqc_service_idb2` (`oqc_service_idb`),
  KEY `oqc_offerin_oqc_service_idc3` (`oqc_offering_ida`,`oqc_service_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offerin_oqc_service`
--

LOCK TABLES `oqc_offerin_oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_offerin_oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offerin_oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering`
--

DROP TABLE IF EXISTS `oqc_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_offering_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `attachments` varchar(255) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'Qt',
  `company_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `contactperson_id` char(36) DEFAULT NULL,
  `clienttechnicalcontact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `svnumber` varchar(255) DEFAULT NULL,
  `textblocksequence` text,
  `attachmentsequence` text,
  `idoffreetextblock` char(36) DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nextrevisions` text,
  `quote_leadtime` varchar(255) DEFAULT '1 month',
  `shipment_terms` varchar(100) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT '30 days net',
  `quote_validity` varchar(255) DEFAULT '60 days',
  `total_cost` double DEFAULT NULL,
  `grand_total_vat` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `install_cost` double DEFAULT NULL,
  `shipment_cost` double DEFAULT NULL,
  `warranty` varchar(255) DEFAULT '30 days',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_template` varchar(36) DEFAULT 'Offering',
  `deadline` date DEFAULT NULL,
  `contractid` varchar(36) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_offeringnumk` (`oqc_offering_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering`
--

LOCK TABLES `oqc_offering` WRITE;
/*!40000 ALTER TABLE `oqc_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_accounts`
--

DROP TABLE IF EXISTS `oqc_offering_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_accounts_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_accounts_idb2` (`accounts_idb`),
  KEY `oqc_offering_accounts_idc3` (`oqc_offering_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_accounts`
--

LOCK TABLES `oqc_offering_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_offering_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_audit`
--

DROP TABLE IF EXISTS `oqc_offering_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_offering_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_audit`
--

LOCK TABLES `oqc_offering_audit` WRITE;
/*!40000 ALTER TABLE `oqc_offering_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_contacts`
--

DROP TABLE IF EXISTS `oqc_offering_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_contacts_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_contacts_idb2` (`contacts_idb`),
  KEY `oqc_offering_contacts_idc3` (`oqc_offering_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_contacts`
--

LOCK TABLES `oqc_offering_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_offering_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_documents`
--

DROP TABLE IF EXISTS `oqc_offering_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_documents_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_documents_idb2` (`documents_idb`),
  KEY `oqc_offering_documents_idc3` (`oqc_offering_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_documents`
--

LOCK TABLES `oqc_offering_documents` WRITE;
/*!40000 ALTER TABLE `oqc_offering_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_opportunities`
--

DROP TABLE IF EXISTS `oqc_offering_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `opportunities_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_opportunities_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_opportunities_idb2` (`opportunities_idb`),
  KEY `oqc_offering_opportunities_idc3` (`oqc_offering_ida`,`opportunities_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_opportunities`
--

LOCK TABLES `oqc_offering_opportunities` WRITE;
/*!40000 ALTER TABLE `oqc_offering_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_oqc_contract`
--

DROP TABLE IF EXISTS `oqc_offering_oqc_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_oqc_contract` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `oqc_contract_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_oqc_contract_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_oqc_contract_idb2` (`oqc_contract_idb`),
  KEY `oqc_offering_oqc_contract_idc3` (`oqc_offering_ida`,`oqc_contract_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_oqc_contract`
--

LOCK TABLES `oqc_offering_oqc_contract` WRITE;
/*!40000 ALTER TABLE `oqc_offering_oqc_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_oqc_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_project`
--

DROP TABLE IF EXISTS `oqc_offering_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_project` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_project_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_project_idb2` (`project_idb`),
  KEY `oqc_offering_project_idc3` (`oqc_offering_ida`,`project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_project`
--

LOCK TABLES `oqc_offering_project` WRITE;
/*!40000 ALTER TABLE `oqc_offering_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_product`
--

DROP TABLE IF EXISTS `oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_product` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_product_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `price` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `supplier_id` char(36) DEFAULT NULL,
  `price_recurring` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `oqc_vat` varchar(10) DEFAULT NULL,
  `relatedcategory_id` char(36) DEFAULT NULL,
  `personincharge_id` char(36) DEFAULT NULL,
  `assigned_employee_id` char(36) DEFAULT NULL,
  `unit` varchar(100) DEFAULT 'pieces',
  `catalog_id` char(36) DEFAULT NULL,
  `price_text` varchar(255) DEFAULT NULL,
  `price_recurring_text` varchar(255) DEFAULT NULL,
  `monthsguaranteed` int(3) DEFAULT NULL,
  `cancellationperiod` int(3) DEFAULT NULL,
  `packaged_product_ids` text,
  `changes_from_previous` text,
  `previousrevision` varchar(36) DEFAULT NULL,
  `nextrevisions` text,
  `version` int(11) DEFAULT NULL,
  `attachmentsequence` text,
  `publish_state` varchar(100) DEFAULT 'pending',
  `unique_identifier` int(11) DEFAULT NULL,
  `image_filename` text,
  `image_unique_filename` text,
  `image_mime_type` varchar(10) DEFAULT NULL,
  `catalog_position` int(11) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  `svnumber` varchar(255) DEFAULT NULL,
  `is_option` tinyint(1) DEFAULT '0',
  `optionssequence` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_productnumk` (`oqc_product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_product`
--

LOCK TABLES `oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_product_audit`
--

DROP TABLE IF EXISTS `oqc_product_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_product_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_product_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_product_audit`
--

LOCK TABLES `oqc_product_audit` WRITE;
/*!40000 ALTER TABLE `oqc_product_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_product_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_product_documents`
--

DROP TABLE IF EXISTS `oqc_product_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_product_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_product_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_product_documents_ida1` (`oqc_product_ida`),
  KEY `oqc_product_documents_idb2` (`documents_idb`),
  KEY `oqc_product_documents_idc3` (`oqc_product_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_product_documents`
--

LOCK TABLES `oqc_product_documents` WRITE;
/*!40000 ALTER TABLE `oqc_product_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_product_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_productcatalog`
--

DROP TABLE IF EXISTS `oqc_productcatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_productcatalog` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_productcatalog_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `active` tinyint(1) DEFAULT '1',
  `validfrom` date DEFAULT NULL,
  `validto` date DEFAULT NULL,
  `frontpage_id` char(36) DEFAULT NULL,
  `attachment_id` char(36) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `category_ids` text,
  `oqc_template` varchar(36) DEFAULT 'Contract',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_catalog_discount` float(5,2) DEFAULT '0.00',
  `pdf_document_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_productcatalognumk` (`oqc_productcatalog_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_productcatalog`
--

LOCK TABLES `oqc_productcatalog` WRITE;
/*!40000 ALTER TABLE `oqc_productcatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_productcatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_productcatalog_audit`
--

DROP TABLE IF EXISTS `oqc_productcatalog_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_productcatalog_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_productcatalog_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_productcatalog_audit`
--

LOCK TABLES `oqc_productcatalog_audit` WRITE;
/*!40000 ALTER TABLE `oqc_productcatalog_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_productcatalog_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_productcatalog_documents`
--

DROP TABLE IF EXISTS `oqc_productcatalog_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_productcatalog_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_productcatalog_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_productcatalog_documents_ida1` (`oqc_productcatalog_ida`),
  KEY `oqc_productcatalog_documents_idb2` (`documents_idb`),
  KEY `oqc_productcatalog_documents_idc3` (`oqc_productcatalog_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_productcatalog_documents`
--

LOCK TABLES `oqc_productcatalog_documents` WRITE;
/*!40000 ALTER TABLE `oqc_productcatalog_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_productcatalog_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_service`
--

DROP TABLE IF EXISTS `oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_service` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `quantity` double DEFAULT '1',
  `price` double DEFAULT '0',
  `discount_value` double DEFAULT '0',
  `vat` tinyint(1) DEFAULT NULL,
  `oqc_vat` varchar(255) DEFAULT NULL,
  `zeitbezug` varchar(100) DEFAULT 'once',
  `discount_select` varchar(100) DEFAULT 'rel',
  `unit` varchar(100) DEFAULT 'pieces',
  `service_currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_service`
--

LOCK TABLES `oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_task`
--

DROP TABLE IF EXISTS `oqc_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_task` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_task_number` int(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(50) DEFAULT 'Tsk',
  `svnumber` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `notify` tinyint(1) DEFAULT '1',
  `remind` tinyint(1) DEFAULT '1',
  `reminder_interval` int(11) DEFAULT '-1',
  `date_reminder` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT 'Medium',
  `progress` varchar(255) DEFAULT NULL,
  `approval_ratio` varchar(255) DEFAULT NULL,
  `userslist` varchar(255) DEFAULT NULL,
  `isdone` tinyint(1) DEFAULT NULL,
  `conjugate` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_tasknumk` (`oqc_task_number`),
  KEY `idx_oqc_tsk_name` (`name`),
  KEY `idx_oqc_tsk_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_oqc_tsk_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_task`
--

LOCK TABLES `oqc_task` WRITE;
/*!40000 ALTER TABLE `oqc_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_task_audit`
--

DROP TABLE IF EXISTS `oqc_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_task_audit`
--

LOCK TABLES `oqc_task_audit` WRITE;
/*!40000 ALTER TABLE `oqc_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_task_users`
--

DROP TABLE IF EXISTS `oqc_task_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_task_users` (
  `id` varchar(36) NOT NULL,
  `oqc_task_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `progress` varchar(25) DEFAULT NULL,
  `accept_status` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `resolution` varchar(25) DEFAULT NULL,
  `comment` text,
  `attachmentsequence` text,
  `position` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_usr_oqc_task1` (`oqc_task_id`),
  KEY `idx_usr_users2` (`user_id`),
  KEY `idx_oqc_task_users` (`oqc_task_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_task_users`
--

LOCK TABLES `oqc_task_users` WRITE;
/*!40000 ALTER TABLE `oqc_task_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_task_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_textblock`
--

DROP TABLE IF EXISTS `oqc_textblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_textblock` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_textblock_number` int(11) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_textblocknumk` (`oqc_textblock_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_textblock`
--

LOCK TABLES `oqc_textblock` WRITE;
/*!40000 ALTER TABLE `oqc_textblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_textblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_textblock_audit`
--

DROP TABLE IF EXISTS `oqc_textblock_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_textblock_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_textblock_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_textblock_audit`
--

LOCK TABLES `oqc_textblock_audit` WRITE;
/*!40000 ALTER TABLE `oqc_textblock_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_textblock_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('c7b83c9f-987e-68dc-e244-5604abe11e0f','system','system','1','SMTP','other','',25,'','',1,0);
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(128) DEFAULT NULL,
  `join_key_lhs` varchar(128) DEFAULT NULL,
  `join_key_rhs` varchar(128) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('110463e6-e604-0df6-8740-5604ad05e28e','oqctask_fellowtasks','oqc_Task','oqc_task','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('128be895-2829-f325-8598-5604ad3707fb','oqc_task_notes','oqc_Task','oqc_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('17c50321-7421-ad16-6d30-5604adcd2238','oqc_productcatalog_created_by','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1c9cb64f-71fa-c1e5-7eb1-5604adc3fe2c','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('1e02037b-bae9-a4a2-e8f6-5604ad5e1db1','oqc_productcatalog_assigned_user','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1f0008cb-b85e-eb11-bb0d-5604ad98d4f3','oqc_task_oqc_addition','oqc_Addition','oqc_addition','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1f2fb849-7714-5212-47d7-5604ad373b3c','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('20b099e6-ad7b-7a1b-ee50-5604add2f9cf','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('223f48dd-6b3d-b75a-4792-5604ad04130c','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('23d01e57-687f-34ed-2ddb-5604ad693b02','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('25693db9-bbc2-f1d5-95c3-5604ad1dbf40','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('26ed92ff-8cfb-c10c-df21-5604ad2fc367','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('26fe0fd1-a2cb-a9fd-78f7-5604ad9f4283','oqc_task_oqc_productcatalog','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('286bf430-8cfd-5f31-2e21-5604ad7080bc','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('2a029386-98a7-48c6-702e-5604ad552e07','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('2b724428-e099-e45e-032d-5604ad4bc388','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('2cd3357d-2c5c-4a2a-2020-5604ad071458','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('2e25ac54-c887-e66f-80c8-5604ad9356fc','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('2fb42bdb-ba72-8fdc-2b74-5604adeac791','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('311a146f-da2e-b4a7-0fb2-5604ad05360f','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('31420c9a-eb9a-fc1e-e27a-5604ad17d99c','oqc_externalcontract_modified_user','Users','users','id','oqc_ExternalContract','oqc_externalcontract','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('328dfe7f-173f-4119-fa1b-5604adcb6bcb','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('34120305-7779-3c11-04d0-5604ad2044e8','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('357ef93a-06e5-51bc-c77c-5604ad894508','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('36f0dad8-42d8-7fe2-40cf-5604adb21f8d','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('38586a30-e3bb-a775-b165-5604adb11f8e','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('39ad774c-7410-815e-04a1-5604ad39cf7c','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('3a610302-7dcf-bfe1-d970-5604addb00cc','oqc_externalcontract_created_by','Users','users','id','oqc_ExternalContract','oqc_externalcontract','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3b3655c5-a20f-ec85-59ad-5604adfffd24','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('3bba2577-4a55-3e64-e354-5604ad26d82d','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('3c4ad083-e30d-794f-6a97-5604ad8210f6','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('3ca33329-70a4-7967-2cf1-5604ad60cc3f','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('3d26784c-3433-c15b-ddae-5604ad7f6b72','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('3d7e954c-81ae-433d-fd8d-5604ad1bb469','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('3e0c71e2-5864-b593-98da-5604ada065f8','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('3e731c9c-3a83-4308-d26d-5604adbe91b8','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('3f04848f-de02-d25c-443c-5604ad9ce8c5','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('3f66bf04-38e5-b247-fc00-5604ad178718','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('3ff9b8b6-41cc-e8c6-6794-5604ad83391a','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('40630a4c-8e36-da9f-7fdc-5604ad2ce77a','oqc_externalcontract_assigned_user','Users','users','id','oqc_ExternalContract','oqc_externalcontract','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('406ab0af-f06f-89a1-9517-5604adbc0d78','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('4102dafd-0478-27d1-1682-5604ad9e96e7','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('416bd01c-1f1e-97dc-3782-5604ade250eb','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('420b54ac-08af-caeb-f1cb-5604ad59b659','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('42820aa6-1cb9-38b7-f825-5604ad7d2c1e','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('43262d87-5709-f686-4a72-5604ad858da6','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('4394765d-6ce8-2959-2075-5604ad1f1272','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('443115a7-4688-3f84-4dd9-5604adeeae27','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('44c4f7e5-f858-8c98-5a05-5604ad40e407','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('45248e85-9d52-f230-870c-5604ad802999','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('45860070-78a9-733f-058c-5604ad48e4f2','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('461bea5b-cea2-8510-fc1b-5604adca3bd3','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('467ef382-8c1b-518f-0892-5604ade4fdd2','oqc_offering_contacts','oqc_Offering','oqc_offering','id','Contacts','contacts','id','oqc_offering_contacts','oqc_offering_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('46906152-9d5d-bc4a-4167-5604ada455be','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4717e63a-52ff-617c-1674-5604ad0de2f0','oqc_offering_oqc_product','oqc_Offering','oqc_offering','id','oqc_Product','oqc_product','id','oqc_offerin_oqc_product','oqc_offering_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('4774c45b-d85e-a10a-487b-5604ad0cd81d','oqc_task_users','oqc_Task','oqc_task','id','Users','users','id','oqc_task_users','oqc_task_id','user_id','many-to-many',NULL,NULL,0,0),('47ff7669-d64d-cb55-435f-5604adc9f580','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('48097cc7-f3d0-a445-6134-5604ad04eae5','oqc_offering_project','oqc_Offering','oqc_offering','id','Project','project','id','oqc_offering_project','oqc_offering_ida','project_idb','many-to-many',NULL,NULL,0,0),('48683171-d715-fd75-c6c7-5604ade90ee6','oqc_contract_oqc_addition','oqc_Contract','oqc_contract','id','oqc_Addition','oqc_addition','id','oqc_contract_oqc_addition','oqc_contract_ida','oqc_addition_idb','many-to-many',NULL,NULL,0,0),('48b71d3d-65b3-36bd-c973-5604ad87c55b','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('49029c7d-b9b2-aefc-a808-5604ad62794e','oqc_externalcontract_accounts','oqc_ExternalContract','oqc_externalcontract','id','Accounts','accounts','id','oqc_externaact_accounts','oqc_externalcontract_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('492d0bf4-327e-19bb-23bc-5604ad3c98c3','account_search','Accounts','accounts','id','oqc_ExternalContract','oqc_externalcontract','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4966fb32-d893-3ea2-e669-5604ad34957b','oqc_offering_oqc_service','oqc_Offering','oqc_offering','id','oqc_Service','oqc_service','id','oqc_offerin_oqc_service','oqc_offering_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('496a72ac-78a7-3456-27b8-5604ada765b2','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('49f4fc72-62da-85c5-8c83-5604ad2ad1bd','oqc_offering_accounts','oqc_Offering','oqc_offering','id','Accounts','accounts','id','oqc_offering_accounts','oqc_offering_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('4a22c558-76a5-99cf-2ebe-5604ade8f610','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('4a4fb339-8633-7ef7-bdfc-5604adce18a4','oqc_contract_accounts','oqc_Contract','oqc_contract','id','Accounts','accounts','id','oqc_contract_accounts','oqc_contract_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('4abd5e15-a7df-21f2-f7ca-5604adfdee3e','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4ae17d8d-152c-592f-ecfb-5604adac3e8f','oqc_externalcontract_oqc_contract','oqc_ExternalContract','oqc_externalcontract','id','oqc_Contract','oqc_contract','id','oqc_externaoqc_contract','oqc_externalcontract_ida','oqc_contract_idb','many-to-many',NULL,NULL,0,0),('4b31954c-c0cd-01ca-1e5d-5604adb7c7f1','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('4b484fc4-dade-47a3-77c6-5604ade696dc','oqc_addition_accounts','oqc_Addition','oqc_addition','id','Accounts','accounts','id','oqc_addition_accounts','oqc_addition_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('4bd36716-2b09-e15d-46e4-5604ad5276b6','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('4bd83572-65b6-cbb3-0266-5604ade38ab3','oqc_addition_contacts','oqc_Addition','oqc_addition','id','Contacts','contacts','id','oqc_addition_contacts','oqc_addition_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('4c3a022b-354d-4b6e-353f-5604ad643ae6','oqc_productcatalog_documents','oqc_ProductCatalog','oqc_productcatalog','id','Documents','documents','id','oqc_productcatalog_documents','oqc_productcatalog_ida','documents_idb','many-to-many',NULL,NULL,0,0),('4c4b5467-7907-db67-5943-5604ad42b81c','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('4cc9c1ab-61cb-05ba-38e2-5604adfa7fa2','oqc_externalcontract_project','oqc_ExternalContract','oqc_externalcontract','id','Project','project','id','oqc_externaract_project','oqc_externalcontract_ida','project_idb','many-to-many',NULL,NULL,0,0),('4cfc0fc6-703f-cabc-956c-5604adf2bf39','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('4d2a534a-d908-9d4a-1d41-5604ad11704d','oqc_externalcontract_documents','oqc_ExternalContract','oqc_externalcontract','id','Documents','documents','id','oqc_externact_documents','oqc_externalcontract_ida','documents_idb','many-to-many',NULL,NULL,0,0),('4d851120-db03-4182-68e2-5604adfd3c32','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('4dbb5fd8-d097-f979-f5e8-5604ad0bfcf4','oqc_externalcontract_contacts','oqc_ExternalContract','oqc_externalcontract','id','Contacts','contacts','id','oqc_externaact_contacts','oqc_externalcontract_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('4de4357a-8ed2-1211-be27-5604ad2d50f6','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('4e1b036a-b625-9c74-262a-5604ad3567e7','oqc_addition_oqc_service','oqc_Addition','oqc_addition','id','oqc_Service','oqc_service','id','oqc_additio_oqc_service','oqc_addition_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('4e7bbd76-acc0-df3d-0e1a-5604ad16b6e4','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4eb8ba05-0f1d-3146-9696-5604adce7836','oqc_product_documents','oqc_Product','oqc_product','id','Documents','documents','id','oqc_product_documents','oqc_product_ida','documents_idb','many-to-many',NULL,NULL,0,0),('4f1b8582-fef0-62b8-e7f1-5604adb374f1','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4f244363-59c0-84e5-d57a-5604ad1315b6','oqc_contract_project','oqc_Contract','oqc_contract','id','Project','project','id','oqc_contract_project','oqc_contract_ida','project_idb','many-to-many',NULL,NULL,0,0),('4f490eb8-07c4-7e1e-6ebe-5604ad94d7c6','oqc_task_oqc_externalcontract','oqc_ExternalContract','oqc_externalcontract','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4fc161ac-9b34-9132-c5f1-5604ad003c38','oqc_addition_documents','oqc_Addition','oqc_addition','id','Documents','documents','id','oqc_addition_documents','oqc_addition_ida','documents_idb','many-to-many',NULL,NULL,0,0),('4fcb2993-563b-f414-b79d-5604ad0fecb1','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5048a4f5-8ac1-73ce-9c9b-5604adefdcc4','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('508a4475-890d-aa3a-3c63-5604ad47c07b','oqc_addition_oqc_product','oqc_Addition','oqc_addition','id','oqc_Product','oqc_product','id','oqc_additio_oqc_product','oqc_addition_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('50ff2daa-07e9-2eba-f51a-5604adb88c10','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('51a7efbd-4ac0-0816-9bfd-5604adf2fa2a','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('51fb8fd8-51e2-0814-952b-5604ad3beff9','oqc_contract_documents','oqc_Contract','oqc_contract','id','Documents','documents','id','oqc_contract_documents','oqc_contract_ida','documents_idb','many-to-many',NULL,NULL,0,0),('5214a3ce-d17f-5f0f-7bd4-5604ad3ac4f5','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('52b64c90-4d31-44f6-25ee-5604ad665702','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('537feb42-f910-7140-5631-5604adf437df','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('538a92a4-33fe-ac91-2259-5604ad98ffd6','oqc_contract_oqc_service','oqc_Contract','oqc_contract','id','oqc_Service','oqc_service','id','oqc_contrac_oqc_service','oqc_contract_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('542dd020-4e45-a954-fcdd-5604adfaf545','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('54dec2e8-351a-3ae5-d420-5604adfb1356','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('54ff49ec-8352-f6da-2b7e-5604ad4363c0','oqc_offering_documents','oqc_Offering','oqc_offering','id','Documents','documents','id','oqc_offering_documents','oqc_offering_ida','documents_idb','many-to-many',NULL,NULL,0,0),('5588feef-072e-954b-5c4d-5604adfd89c5','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('55f9bca0-09da-34bf-19fa-5604adbb4f9c','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('56666ff4-839b-b74b-4988-5604adb5679e','oqc_contract_oqc_product','oqc_Contract','oqc_contract','id','oqc_Product','oqc_product','id','oqc_contrac_oqc_product','oqc_contract_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('569b1f96-43a5-37b1-ba67-5604add9055e','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('570fd507-7da5-aa55-a4e9-5604ad2fdc7f','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('57bc4417-c05e-21d5-dcd5-5604ade669ab','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('57eb50a2-77c1-28b7-bdef-5604add6a530','oqc_contract_contacts','oqc_Contract','oqc_contract','id','Contacts','contacts','id','oqc_contract_contacts','oqc_contract_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('58726ea5-b34e-6757-164f-5604ada3812f','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('58dca768-b0cc-783a-711e-5604ad7b05cd','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('595e4548-a20c-4c9f-cbfe-5604ad1b5d84','oqc_offering_opportunities','oqc_Offering','oqc_offering','id','Opportunities','opportunities','id','oqc_offering_opportunities','oqc_offering_ida','opportunities_idb','many-to-many',NULL,NULL,0,0),('59b38688-4068-7326-4396-5604ad1de507','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5a6057ef-f7b9-e0aa-7a03-5604ad5b614b','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('5a9f0bda-c5f5-0ff6-35cc-5604ad861b12','oqc_externalcontractpositions_modified_user','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5adc4f16-1b18-0193-c3c7-5604addd4483','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('5ae83e41-1319-f78d-4e27-5604ad9de3a5','oqc_offering_oqc_contract','oqc_Offering','oqc_offering','id','oqc_Contract','oqc_contract','id','oqc_offering_oqc_contract','oqc_offering_ida','oqc_contract_idb','many-to-many',NULL,NULL,0,0),('5ba2eb5a-4abe-a551-5887-5604addbc893','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5c56ee43-d2f0-72ab-3160-5604addfbd3e','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5cd7bea0-46d8-66c9-350d-5604ad6d6c05','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5d8204e5-0605-2984-11dc-5604adfc04c6','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5e641090-4fea-aabb-0b44-5604ad524cb8','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('603724bc-671c-1ea3-efc0-5604addd87da','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('60c60a0a-55a0-9365-de3c-5604adec631e','oqc_externalcontractpositions_created_by','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('61a75db4-84fa-bd5c-30ef-5604ad215270','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('63051577-a77a-f4b7-c2f1-5604add62975','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('6461a229-22e9-bd72-88b7-5604ad525253','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('65b1f196-4825-3ec8-73c7-5604ad776b03','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('671726d5-10ec-4353-8843-5604adf2f967','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('68779a4a-966b-75d2-d0c5-5604adc89c83','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('69c80ec0-3f2a-d4b2-e0ee-5604ad8ce265','oqc_externalcontractpositions_assigned_user','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('69d4305a-dde9-2b29-9312-5604ad18ab7a','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6b302966-5ff6-1ff7-933c-5604ad74a3a7','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6c9b6019-f043-6329-fae3-5604ad89ab36','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('6de73fe1-9d27-6fe1-8f33-5604ad11b0c3','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('6f5499e2-1cc0-e14f-abcc-5604adace423','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('70bac1ac-4d42-784f-9bfc-5604ad501826','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('71d602d3-08e2-9904-0016-5604ad7c32cb','oqc_externalcontractcosts_modified_user','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7220dada-931d-626a-660e-5604adb7cb09','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('737f874f-b6cc-6806-c05e-5604ad0313a0','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74e282cf-49b7-0c4e-7f8b-5604ad4d99e7','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7649ec0f-1e2e-209d-691d-5604ad48a2fb','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('77ecb271-d98e-3896-9739-5604adb76c81','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7964f28e-7e10-1f2f-3c27-5604adc166a0','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7a7a0200-d618-93bc-4a9e-5604ad3e2fc6','oqc_externalcontractcosts_created_by','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7acd1860-4583-3703-8e1e-5604ad07a5a5','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7c1e69a8-3a5b-e2aa-ec90-5604ad31366d','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7d914c6d-7693-1a4c-cf9d-5604ad33832d','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ef9690f-dfc0-6dea-1491-5604ad1a885d','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('80654c5c-cfcd-8576-5763-5604adf411fe','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81d41227-577c-c7dc-63ec-5604ad196bf1','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8329d83f-c672-9fff-7b8e-5604adcf3d81','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('844e0679-5cde-1212-1609-5604ad59234b','oqc_externalcontractcosts_assigned_user','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8484074b-efb2-230b-0514-5604ada8df1c','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('85d994a1-1858-a0d2-1f84-5604adc61fb7','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('872665a0-d286-1bfe-fe04-5604adb1f379','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('886d277a-7f1b-e4bd-9a00-5604ade90d15','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89fdc5eb-d133-dd35-40a3-5604ad43d339','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ce5f13a-eab2-dd5a-0582-5604ad515acb','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8d8442c2-1264-f211-426f-5604ade58770','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8dfefb94-ef22-f724-79e7-5604ad9582eb','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e480039-0c18-59f5-8a78-5604adcb534f','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('8e8ff787-caa0-6daf-0ed5-5604ad17e802','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('8ea90a53-1477-f7ad-642a-5604ad1a4f09','oqc_externalcontractdetailedcosts_modified_user','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f07521e-b8f0-1a89-a2c6-5604ad4a8b6d','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('8f531ee4-41fd-7fc8-46c7-5604ad3ee470','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('8f9cad24-54a6-88b9-a548-5604ad9d6c04','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('90123fb5-67bc-c3c9-82f2-5604ad544018','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('905ad286-63f1-5947-d972-5604ada2251c','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('90a35ddb-fd81-c583-6f6c-5604adc22e17','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('912f17a2-bd8f-2d01-53ca-5604adc0ddd9','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('91974329-6be5-0e16-0b6a-5604ad25fc9c','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('925ba6ec-4a51-f7ab-368f-5604ad1592cc','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('92f009f1-0f8c-ed9a-5d19-5604ad22a005','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('934ab0e1-3e02-2361-6155-5604ade244d6','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('93de5e57-f181-b5ab-fc9b-5604ad412e19','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','schedulersjobs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('94cdb7b5-a1e4-8457-b7f9-5604ad82b92a','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('95616bdf-4a8f-c51d-8b2d-5604ada7ff5e','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('95ec0885-695f-47b0-3315-5604ad2d75de','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9645658e-b623-3c48-2cb9-5604ad362b85','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('96d5eea1-8321-e27e-4936-5604ad6e9eb6','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('97309d9c-3098-7e37-0882-5604adc1bb6c','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('97867b1c-f57f-643f-6559-5604add49e53','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('980b791c-6203-a48c-b133-5604adfef86e','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('98673299-5687-936d-5bd3-5604ad3d85b5','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('98f79cd9-f5cf-8d3d-3144-5604adbf2751','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('9963ae4f-802f-fab4-c10a-5604ad5f7a5b','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('99ee000d-4a83-1bc1-1479-5604adcfe7ea','oqc_externalcontractdetailedcosts_created_by','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('99fca9c8-5e4d-432e-c032-5604ad625de8','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('9aa0faa7-4e3e-39cf-4577-5604ad41ec90','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9b25e33f-6894-2312-4788-5604ade580a0','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9bb1893d-09e7-7094-804c-5604add4546f','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c234467-7804-5862-800a-5604ad420876','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('9c9e2e5a-c5cc-1c36-8e35-5604ad79f995','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('9cf572a9-1819-3018-2353-5604ada9060c','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9d4f2619-16ad-334b-9104-5604ad72f0f8','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9dd27fd4-979e-486d-a8b9-5604ad619184','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('9e31171a-9fdf-6917-7ba5-5604adc9e560','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('9eb2f82c-ed2a-1914-dc14-5604ad198d79','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('9f0c907e-3149-5664-66b1-5604adc14f66','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('9fa81d0b-f4bc-0aa8-a96c-5604ad38fd9f','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('a0308257-63cc-7b30-a648-5604ad879c39','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a0e0009d-8eaf-fdf6-be3a-5604addc9836','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('a1a734f9-9131-3333-75ea-5604adef4745','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a2518d85-b326-1c09-90da-5604ad60968b','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a2faed1f-dd64-b84b-5885-5604ad18909f','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a3a21b75-f92c-779b-db68-5604ad6feae3','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('a40e71aa-7f79-b026-02ff-5604ad889636','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('a4a91136-4631-258b-7daa-5604ad8661e4','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('a51251ce-b615-ab96-7388-5604ade39b62','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('a5b01ebe-bbd5-59e4-5678-5604adc47393','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('a625775e-a6f2-153c-4ff0-5604ad6d3074','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6c9367a-b51a-b8b8-695b-5604adbabdbf','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a72ef26a-03ec-27f8-2f42-5604ad2b6a95','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a7ec934e-9921-3161-3984-5604ad5f067a','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a8ae4bf1-d682-901d-428f-5604ad3d9738','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a90ecb06-b5c0-d01c-93c8-5604ad5e7641','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a9ad0c21-75f6-56c3-c54f-5604ad2c781e','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aa66b305-560c-0a0d-1f86-5604adad5aca','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aafc098c-6c7d-2bc6-7182-5604ad8ac2af','oqc_externalcontractdetailedcosts_assigned_user','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab002242-8b3f-1c2a-1efd-5604ad744146','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab96d6ca-491c-8f9c-8551-5604ad29bbd0','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('abff98e1-6b0a-76db-495f-5604adbac326','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('acd94d0f-9198-9855-5a47-5604ad94340f','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ad7355e4-3b91-0835-7c8b-5604ad1a821d','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ade3469b-e898-0f20-8eed-5604ad7d1b35','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ae7f9369-feb1-ac09-9fa0-5604adff0f58','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aee61d95-7d2c-c481-0eab-5604ad537d8f','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('af7e89e2-290f-b69b-1eb1-5604adf773d0','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('afedab5e-8168-db59-e54b-5604ada47061','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('b0928f88-55f1-37e2-358a-5604ada318df','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b188f4ee-0baa-3d9c-0cad-5604ade345ba','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b1fb584a-4d84-4417-0e0c-5604ad3f2167','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2a20647-e107-9ce3-1a9b-5604ad1d287d','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b33cfd80-441c-0439-353f-5604adb5cc18','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('b3c6a503-ab8d-fc69-3530-5604adf83d32','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b4538a41-19ce-9b8a-b2ce-5604ad1e022e','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b4ad04c3-c6c5-0570-577a-5604ad0d5c01','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b5340542-ada4-ebdb-5db1-5604adb147ef','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b6b864ca-1acb-461c-be36-5604ad039fb9','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b7401bb3-9e01-ad1b-e695-5604addde588','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b7a67ed3-118e-89ca-df2f-5604adfdf18d','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b8399a46-0968-a7fb-8366-5604ad8c261a','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b901c59f-c4e4-0514-249a-5604ad9dd11b','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ba94a1cb-8385-f949-c1be-5604ad4591ce','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('bbe64e3f-a34a-75f2-62d4-5604addd66e9','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('bd38f474-0840-668e-f2dc-5604adc789d7','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('beb55b2d-2cc5-7090-a2e0-5604ad4ddd14','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c012ceec-84cb-e674-4fbc-5604ad92ef01','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c15f0dca-472e-cc39-9d05-5604ad7f7b8d','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c2cf11e5-0ed4-4b33-7ee6-5604ad0f4640','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c42070d1-9d18-af04-aaca-5604ad245b36','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c584db46-ff20-d965-f980-5604ad9d58b9','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c74031ee-4d84-4b53-86e7-5604ad7c776c','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauthkeys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c8baa19f-8800-7ebf-0a71-5604adf97688','oauthkeys_created_by','Users','users','id','OAuthKeys','oauthkeys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ca00083f-77ac-e7b3-c64d-5604ad536665','oqc_task_modified_user','Users','users','id','oqc_Task','oqc_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ca560e62-24b8-44b0-4c79-5604ade5071e','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauthkeys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cbef3983-a541-7329-c6df-5604ad1a2a5b','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cd797086-1073-ef84-bb40-5604ad3b1809','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cf3b574b-423b-2262-2a14-5604ad646ba6','oqc_category_modified_user','Users','users','id','oqc_Category','oqc_category','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d0d29a54-6d64-982a-f4eb-5604adc4f3d7','oqc_category_created_by','Users','users','id','oqc_Category','oqc_category','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d25ed5da-c5e4-ceab-d70f-5604adb9717b','oqc_category_assigned_user','Users','users','id','oqc_Category','oqc_category','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d3de6fba-85c9-c1a7-4f8f-5604ad6624b0','oqc_category_catalog_rel','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Category','oqc_category','catalog_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d5b35b1e-020c-bebb-391f-5604ada375b9','oqc_product_modified_user','Users','users','id','oqc_Product','oqc_product','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d72e0248-ef26-d0d5-2e92-5604add1f7ab','oqc_product_created_by','Users','users','id','oqc_Product','oqc_product','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d8a42930-f1c7-798e-3547-5604ad0241bc','oqc_product_assigned_user','Users','users','id','oqc_Product','oqc_product','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d9fbbfac-da11-8675-2117-5604ad667116','oqc_product_category_rel','oqc_Category','oqc_category','id','oqc_Product','oqc_product','relatedcategory_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('db42ab81-c258-e54c-f06e-5604ad0a252c','oqc_product_catalog_rel','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Product','oqc_product','catalog_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dc7f1dec-6f10-3420-a5aa-5604adf3441d','oqc_task_oqc_product','oqc_Product','oqc_product','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ddbf9190-70c3-3874-e771-5604adf4ec73','account_oqc_product_rel','Accounts','accounts','id','oqc_Product','oqc_product','supplier_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df2cbaf2-d97a-be95-5db1-5604ad35027f','oqc_contract_modified_user','Users','users','id','oqc_Contract','oqc_contract','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e07bf351-5316-e817-7662-5604ad3e46bf','oqc_contract_created_by','Users','users','id','oqc_Contract','oqc_contract','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1c76b6a-96de-be2e-c5b6-5604ad1a7148','oqc_contract_assigned_user','Users','users','id','oqc_Contract','oqc_contract','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1f60565-61ef-abf1-487f-5604add2095a','oqc_task_created_by','Users','users','id','oqc_Task','oqc_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e311f7dd-c7f7-b9e1-693f-5604add668ee','oqc_contract_company_search','Accounts','accounts','id','oqc_Contract','oqc_contract','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e47c6be1-cfc9-877b-7a1b-5604ad004ab9','oqc_contract_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Contract','oqc_contract','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e5ff6f5b-43ec-9603-b8ad-5604ad7a9650','oqc_contract_contact_rel','Contacts','contacts','id','oqc_Contract','oqc_contract','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e72d650f-ed0d-b0d9-4771-5604ad9a9b66','oqc_task_oqc_contract','oqc_Contract','oqc_contract','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7800491-4959-9685-a7d4-5604ad453982','oqc_productcatalog_modified_user','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e81c4f13-3635-9654-3aec-5604ada4eb80','oqc_service_modified_user','Users','users','id','oqc_Service','oqc_service','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e8c93a5a-aca3-b901-6c57-5604ad394037','oqc_service_created_by','Users','users','id','oqc_Service','oqc_service','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e97dbdf6-8336-3eea-4703-5604ad4ae592','oqc_service_assigned_user','Users','users','id','oqc_Service','oqc_service','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ea60c8e4-d176-106a-8f3a-5604ad7a0616','oqc_editedtextblock_modified_user','Users','users','id','oqc_EditedTextBlock','oqc_editedtextblock','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eb1598d6-a6e2-c1a2-42ca-5604adc1ff3d','oqc_editedtextblock_created_by','Users','users','id','oqc_EditedTextBlock','oqc_editedtextblock','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ebc35ff8-3b98-b991-ea37-5604ada70f24','oqc_textblock_modified_user','Users','users','id','oqc_TextBlock','oqc_textblock','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ec6b108a-f36c-1131-43fb-5604adae5bb2','oqc_textblock_created_by','Users','users','id','oqc_TextBlock','oqc_textblock','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed7370ea-bf1b-eb96-c399-5604ade70647','oqc_offering_modified_user','Users','users','id','oqc_Offering','oqc_offering','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ee26e5ed-f427-39c7-5306-5604ade811fd','oqc_offering_created_by','Users','users','id','oqc_Offering','oqc_offering','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eee6dcdc-fc00-7d77-0128-5604ad1de883','oqc_offering_assigned_user','Users','users','id','oqc_Offering','oqc_offering','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ef5fc1ba-9d32-7604-a8df-5604ad37c6f8','oqc_offering_company_search','Accounts','accounts','id','oqc_Offering','oqc_offering','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('effab39d-0c76-766d-5dfa-5604ad18d79c','oqc_offering_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Offering','oqc_offering','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f0683e85-3c6a-c6fd-a09e-5604ad65f4c2','oqc_offering_contact_rel','Contacts','contacts','id','oqc_Offering','oqc_offering','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f101f3f9-de23-d0a8-58e1-5604ad1d013d','oqc_task_oqc_offering','oqc_Offering','oqc_offering','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f19c6e01-c166-1db1-718f-5604ad78fe0a','oqc_addition_modified_user','Users','users','id','oqc_Addition','oqc_addition','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2209ff8-eb00-809d-f61b-5604ad3a11e1','oqc_addition_created_by','Users','users','id','oqc_Addition','oqc_addition','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2a39eec-9291-cc2d-8971-5604ada493a7','oqc_addition_assigned_user','Users','users','id','oqc_Addition','oqc_addition','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2f8eb91-a9e1-bef0-0f44-5604ad713fd7','oqc_addition_company_search','Accounts','accounts','id','oqc_Addition','oqc_addition','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f34c4c4e-5b33-e4b2-b9ac-5604ad56754b','oqc_addition_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Addition','oqc_addition','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f3e545bf-c2c8-229f-824b-5604ad50db95','oqc_addition_contact_rel','Contacts','contacts','id','oqc_Addition','oqc_addition','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f98b0a89-b7f4-8cfa-3dd8-5604ad316e9e','oqc_task_assigned_user','Users','users','id','oqc_Task','oqc_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('599025ff-274a-beb5-16bc-5604ab41bd64',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Prune Tracker Tables','function::trimTracker','2005-01-01 19:15:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1),('5a07a341-b038-2fcb-6e97-5604ab201bdf',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxes','2005-01-01 08:00:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('5a8e6c64-c25e-3681-db52-5604ab047ce0',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2005-01-01 09:30:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('5ae79a65-739a-5d9d-45cb-5604ab03e0ab',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2005-01-01 11:30:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('5b6cd301-0e48-0df0-077e-5604abe6c262',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Prune Database on 1st of Month','function::pruneDatabase','2005-01-01 14:00:01','2020-12-31 23:59:59','0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('5bca3b9e-730a-da1d-37c5-5604ab0d0430',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2008-01-01 17:00:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('5c4a794c-125d-39e2-4791-5604abe7db2a',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Clean Jobs Queue','function::cleanJobQueue','2012-01-01 08:15:01','2030-12-31 23:59:59','0::5::*::*::*',NULL,NULL,NULL,'Active',0),('5ca15127-882e-d3c2-b2b0-5604ab7a1cb2',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2012-01-01 14:45:01','2030-12-31 23:59:59','0::3::1::*::*',NULL,NULL,NULL,'Active',0),('5d27b4bd-a637-5bcd-8500-5604ab7f1bfe',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Prune SugarFeed Tables','function::trimSugarFeeds','2005-01-01 18:00:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`),
  KEY `idx_sgrfeed_rmod_rid_date` (`related_module`,`related_id`,`date_entered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
INSERT INTO `upgrade_history` VALUES ('65eeeff3-0fd6-6d41-d87e-5604adabaf34','upload/upgrades/module/MaestranoDataSharing2015_09_25_091248.zip','11ecd6b4bbd514698247a219bb1fa3e0','module','installed','1443136368','MaestranoDataSharing','Data sharing with Connec!™','MaestranoDataSharing','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MzoiTU5PIjtzOjY6ImF1dGhvciI7czo5OiJNYWVzdHJhbm8iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjI4OiJEYXRhIHNoYXJpbmcgd2l0aCBDb25uZWMh4oSiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjIwOiJNYWVzdHJhbm9EYXRhU2hhcmluZyI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTUtMDktMjQgMjM6MTI6NDgiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDQzMTM2MzY4O3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6Nzp7czoyOiJpZCI7czoyMDoiTWFlc3RyYW5vRGF0YVNoYXJpbmciO3M6NToiYmVhbnMiO2E6MTp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6OToiTU5PX1RheGVzIjtzOjU6ImNsYXNzIjtzOjk6Ik1OT19UYXhlcyI7czo0OiJwYXRoIjtzOjMxOiJtb2R1bGVzL01OT19UYXhlcy9NTk9fVGF4ZXMucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YTowOnt9czoxMzoicmVsYXRpb25zaGlwcyI7YTowOnt9czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6NDE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvTU5PX1RheGVzIjtzOjI6InRvIjtzOjE3OiJtb2R1bGVzL01OT19UYXhlcyI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=','2015-09-25 02:10:16',1),('868ccf62-751e-37d5-2803-5604accc3602','upload/upgrades/module/oqc-openqc-2.2RC3.zip','2783718fbfcb86532a7531e3e19b3db5','module','installed','2.2RC3','OpenQuotesAndContracts','Quotes, Contracts and Products modules plus a lot of extra functionality','OpenQuotesAndContracts','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e3M6MTM6InJlZ2V4X21hdGNoZXMiO2E6MTp7aTowO3M6MTE6IjZcLlswLTVdXC4qIjt9fXM6MjQ6ImFjY2VwdGFibGVfc3VnYXJfZmxhdm9ycyI7YToxOntpOjA7czoyOiJDRSI7fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6Mzoib3FjIjtzOjY6ImF1dGhvciI7czozOiJIUEkiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjcyOiJRdW90ZXMsIENvbnRyYWN0cyBhbmQgUHJvZHVjdHMgbW9kdWxlcyBwbHVzIGEgbG90IG9mIGV4dHJhIGZ1bmN0aW9uYWxpdHkiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MjI6Ik9wZW5RdW90ZXNBbmRDb250cmFjdHMiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjEwOiIyMDEzLzA5LzEwIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjc6InZlcnNpb24iO3M6NjoiMi4yUkMzIjtzOjEzOiJyZW1vdmVfdGFibGVzIjtzOjY6InByb21wdCI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjEyOntzOjI6ImlkIjtzOjIyOiJPcGVuUXVvdGVzQW5kQ29udHJhY3RzIjtzOjE0OiJhZG1pbmlzdHJhdGlvbiI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6Nzg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0FkbWluaXN0cmF0aW9uL29xY19BZG1pbmlzdHJhdGlvbl9tZW51LnBocCI7czoyOiJ0byI7czo1MDoibW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9vcWNfQWRtaW5pc3RyYXRpb25fbWVudS5waHAiO319czoxMjoic2NoZWR1bGVkZWZzIjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfU2NoZWR1bGVycy9vcWNfQWRkSm9ic0hlcmUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7fX1zOjQ6ImNvcHkiO2E6MjI6e2k6MTthOjI6e3M6NDoiZnJvbSI7czo0NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfQ2F0ZWdvcnkiO3M6MjoidG8iO3M6MjA6Im1vZHVsZXMvb3FjX0NhdGVnb3J5Ijt9aToyO2E6Mjp7czo0OiJmcm9tIjtzOjQzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19Qcm9kdWN0IjtzOjI6InRvIjtzOjE5OiJtb2R1bGVzL29xY19Qcm9kdWN0Ijt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjQ0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19Db250cmFjdCI7czoyOiJ0byI7czoyMDoibW9kdWxlcy9vcWNfQ29udHJhY3QiO31pOjQ7YToyOntzOjQ6ImZyb20iO3M6NDM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX1NlcnZpY2UiO3M6MjoidG8iO3M6MTk6Im1vZHVsZXMvb3FjX1NlcnZpY2UiO31pOjU7YToyOntzOjQ6ImZyb20iO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0VkaXRlZFRleHRCbG9jayI7czoyOiJ0byI7czoyNzoibW9kdWxlcy9vcWNfRWRpdGVkVGV4dEJsb2NrIjt9aTo2O2E6Mjp7czo0OiJmcm9tIjtzOjQ1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19UZXh0QmxvY2siO3M6MjoidG8iO3M6MjE6Im1vZHVsZXMvb3FjX1RleHRCbG9jayI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czo0NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfT2ZmZXJpbmciO3M6MjoidG8iO3M6MjA6Im1vZHVsZXMvb3FjX09mZmVyaW5nIjt9aTo4O2E6Mjp7czo0OiJmcm9tIjtzOjQ0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19BZGRpdGlvbiI7czoyOiJ0byI7czoyMDoibW9kdWxlcy9vcWNfQWRkaXRpb24iO31pOjk7YToyOntzOjQ6ImZyb20iO3M6MzU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2luY2x1ZGUvb3FjIjtzOjI6InRvIjtzOjExOiJpbmNsdWRlL29xYyI7fWk6MTA7YToyOntzOjQ6ImZyb20iO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0NyZWF0ZVBvcHVwIjtzOjI6InRvIjtzOjIzOiJtb2R1bGVzL29xY19DcmVhdGVQb3B1cCI7fWk6MTE7YToyOntzOjQ6ImZyb20iO3M6Mjc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL29xYyI7czoyOiJ0byI7czozOiJvcWMiO31pOjEyO2E6Mjp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9pbmNsdWRlL1N1Z2FyT2JqZWN0cy90ZW1wbGF0ZXMvb3FjX2NvbnRyYWN0X2Jhc2UiO3M6MjoidG8iO3M6NDg6ImluY2x1ZGUvU3VnYXJPYmplY3RzL3RlbXBsYXRlcy9vcWNfY29udHJhY3RfYmFzZSI7fWk6MTM7YToyOntzOjQ6ImZyb20iO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX1Byb2R1Y3RDYXRhbG9nIjtzOjI6InRvIjtzOjI2OiJtb2R1bGVzL29xY19Qcm9kdWN0Q2F0YWxvZyI7fWk6MTQ7YToyOntzOjQ6ImZyb20iO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3QiO3M6MjoidG8iO3M6Mjg6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3QiO31pOjE1O2E6Mjp7czo0OiJmcm9tIjtzOjU3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0Q29zdHMiO3M6MjoidG8iO3M6MzM6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RDb3N0cyI7fWk6MTY7YToyOntzOjQ6ImZyb20iO3M6NjU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3REZXRhaWxlZENvc3RzIjtzOjI6InRvIjtzOjQxOiJtb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0RGV0YWlsZWRDb3N0cyI7fWk6MTc7YToyOntzOjQ6ImZyb20iO3M6NjE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RQb3NpdGlvbnMiO3M6MjoidG8iO3M6Mzc6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RQb3NpdGlvbnMiO31pOjE4O2E6Mjp7czo0OiJmcm9tIjtzOjQwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19UYXNrIjtzOjI6InRvIjtzOjE2OiJtb2R1bGVzL29xY19UYXNrIjt9aToxOTthOjI6e3M6NDoiZnJvbSI7czo1NDoiPGJhc2VwYXRoPi9pY29ucy9kZWZhdWx0L2ltYWdlcy9vcWNfQWRtaW5pc3RyYXRpb24uZ2lmIjtzOjI6InRvIjtzOjQ0OiJ0aGVtZXMvZGVmYXVsdC9pbWFnZXMvb3FjX0FkbWluaXN0cmF0aW9uLmdpZiI7fWk6MjA7YToyOntzOjQ6ImZyb20iO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0FkbWluaXN0cmF0aW9uIjtzOjI6InRvIjtzOjI2OiJtb2R1bGVzL29xY19BZG1pbmlzdHJhdGlvbiI7fWk6MjE7YToyOntzOjQ6ImZyb20iO3M6NjY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX1NjaGVkdWxlcnMvb3FjX0FkZEpvYnNIZXJlLnBocCI7czoyOiJ0byI7czo0NToiY3VzdG9tL21vZHVsZXMvU2NoZWR1bGVycy9vcWNfQWRkSm9ic0hlcmUucGhwIjt9aToyMjthOjI6e3M6NDoiZnJvbSI7czo0MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfQXVkaXQiO3M6MjoidG8iO3M6MTc6Im1vZHVsZXMvb3FjX0F1ZGl0Ijt9fXM6ODoibGFuZ3VhZ2UiO2E6NjQ6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZ2VfZ2UubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZGVfZGUubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MzthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vaXRfaXQubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZXNfRVMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6NTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZnJfRlIubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6NjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vcHRfQlIubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NzthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vcnVfcnUubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6ODthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo5O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEwO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTE7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxMjthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTM7YTozOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vbW9kX3N0cmluZ3NfZW5fdXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE0O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1NjaGVkdWxlcnMvbW9kX3N0cmluZ3NfZW5fdXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTU7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfZ2VfZ2UucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MTY7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfZ2VfZ2UucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MTc7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX2dlX2dlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImdlX2dlIjt9aToxODthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX2dlX2dlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZ2VfZ2UiO31pOjE5O2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfZ2VfZ2UucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImdlX2dlIjt9aToyMDthOjM6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9tb2Rfc3RyaW5nc19nZV9nZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MjE7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvU2NoZWR1bGVycy9tb2Rfc3RyaW5nc19nZV9nZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJTY2hlZHVsZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImdlX2dlIjt9aToyMjthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToyMzthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Db250YWN0cy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToyNDthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Eb2N1bWVudHMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjI1O2E6Mzp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL09wcG9ydHVuaXRpZXMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MjY7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjI3O2E6Mzp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToyODthOjM6e3M6NDoiZnJvbSI7czo3MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9TY2hlZHVsZXJzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IlNjaGVkdWxlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjI5O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjMwO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjMxO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6MzI7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTozMzthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6MzQ7YTozOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjM1O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1NjaGVkdWxlcnMvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6MzY7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfZXNfRVMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6Mzc7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfZXNfRVMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6Mzg7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX2VzX0VTLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX0VTIjt9aTozOTthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX2VzX0VTLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfRVMiO31pOjQwO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfZXNfRVMucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX0VTIjt9aTo0MTthOjM6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9tb2Rfc3RyaW5nc19lc19FUy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6NDI7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvU2NoZWR1bGVycy9tb2Rfc3RyaW5nc19lc19FUy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJTY2hlZHVsZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX0VTIjt9aTo0MzthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo0NDthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Db250YWN0cy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo0NTthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Eb2N1bWVudHMvbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjQ2O2E6Mzp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL09wcG9ydHVuaXRpZXMvbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6NDc7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjQ4O2E6Mzp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo0OTthOjM6e3M6NDoiZnJvbSI7czo3MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9TY2hlZHVsZXJzL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IlNjaGVkdWxlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjUwO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX3B0X0JSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfQlIiO31pOjUxO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX3B0X0JSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfQlIiO31pOjUyO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19wdF9CUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NTM7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19wdF9CUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X0JSIjt9aTo1NDthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX3B0X0JSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NTU7YTozOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vbW9kX3N0cmluZ3NfcHRfQlIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfQlIiO31pOjU2O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1NjaGVkdWxlcnMvbW9kX3N0cmluZ3NfcHRfQlIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NTc7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NTg7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NTk7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo2MDthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjYxO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo2MjthOjM6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NjM7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvU2NoZWR1bGVycy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJTY2hlZHVsZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9fXM6NToiYmVhbnMiO2E6MTQ6e2k6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJvcWNfQ2F0ZWdvcnkiO3M6NToiY2xhc3MiO3M6MTI6Im9xY19DYXRlZ29yeSI7czo0OiJwYXRoIjtzOjM3OiJtb2R1bGVzL29xY19DYXRlZ29yeS9vcWNfQ2F0ZWdvcnkucGhwIjtzOjM6InRhYiI7YjowO31pOjI7YTo0OntzOjY6Im1vZHVsZSI7czoxMToib3FjX1Byb2R1Y3QiO3M6NToiY2xhc3MiO3M6MTE6Im9xY19Qcm9kdWN0IjtzOjQ6InBhdGgiO3M6MzU6Im1vZHVsZXMvb3FjX1Byb2R1Y3Qvb3FjX1Byb2R1Y3QucGhwIjtzOjM6InRhYiI7YjoxO31pOjM7YTo0OntzOjY6Im1vZHVsZSI7czoxMjoib3FjX0NvbnRyYWN0IjtzOjU6ImNsYXNzIjtzOjEyOiJvcWNfQ29udHJhY3QiO3M6NDoicGF0aCI7czozNzoibW9kdWxlcy9vcWNfQ29udHJhY3Qvb3FjX0NvbnRyYWN0LnBocCI7czozOiJ0YWIiO2I6MTt9aTo0O2E6NDp7czo2OiJtb2R1bGUiO3M6MTE6Im9xY19TZXJ2aWNlIjtzOjU6ImNsYXNzIjtzOjExOiJvcWNfU2VydmljZSI7czo0OiJwYXRoIjtzOjM1OiJtb2R1bGVzL29xY19TZXJ2aWNlL29xY19TZXJ2aWNlLnBocCI7czozOiJ0YWIiO2I6MDt9aTo1O2E6NDp7czo2OiJtb2R1bGUiO3M6MTk6Im9xY19FZGl0ZWRUZXh0QmxvY2siO3M6NToiY2xhc3MiO3M6MTk6Im9xY19FZGl0ZWRUZXh0QmxvY2siO3M6NDoicGF0aCI7czo1MToibW9kdWxlcy9vcWNfRWRpdGVkVGV4dEJsb2NrL29xY19FZGl0ZWRUZXh0QmxvY2sucGhwIjtzOjM6InRhYiI7YjowO31pOjY7YTo0OntzOjY6Im1vZHVsZSI7czoxMzoib3FjX1RleHRCbG9jayI7czo1OiJjbGFzcyI7czoxMzoib3FjX1RleHRCbG9jayI7czo0OiJwYXRoIjtzOjM5OiJtb2R1bGVzL29xY19UZXh0QmxvY2svb3FjX1RleHRCbG9jay5waHAiO3M6MzoidGFiIjtiOjE7fWk6NzthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJvcWNfT2ZmZXJpbmciO3M6NToiY2xhc3MiO3M6MTI6Im9xY19PZmZlcmluZyI7czo0OiJwYXRoIjtzOjM3OiJtb2R1bGVzL29xY19PZmZlcmluZy9vcWNfT2ZmZXJpbmcucGhwIjtzOjM6InRhYiI7YjoxO31pOjg7YTo0OntzOjY6Im1vZHVsZSI7czoxMjoib3FjX0FkZGl0aW9uIjtzOjU6ImNsYXNzIjtzOjEyOiJvcWNfQWRkaXRpb24iO3M6NDoicGF0aCI7czozNzoibW9kdWxlcy9vcWNfQWRkaXRpb24vb3FjX0FkZGl0aW9uLnBocCI7czozOiJ0YWIiO2I6MDt9aTo5O2E6NDp7czo2OiJtb2R1bGUiO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7czo1OiJjbGFzcyI7czoxODoib3FjX1Byb2R1Y3RDYXRhbG9nIjtzOjQ6InBhdGgiO3M6NDk6Im1vZHVsZXMvb3FjX1Byb2R1Y3RDYXRhbG9nL29xY19Qcm9kdWN0Q2F0YWxvZy5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTA7YTo0OntzOjY6Im1vZHVsZSI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO3M6NToiY2xhc3MiO3M6MjA6Im9xY19FeHRlcm5hbENvbnRyYWN0IjtzOjQ6InBhdGgiO3M6NTM6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3Qvb3FjX0V4dGVybmFsQ29udHJhY3QucGhwIjtzOjM6InRhYiI7YjoxO31pOjExO2E6NDp7czo2OiJtb2R1bGUiO3M6Mjk6Im9xY19FeHRlcm5hbENvbnRyYWN0UG9zaXRpb25zIjtzOjU6ImNsYXNzIjtzOjI5OiJvcWNfRXh0ZXJuYWxDb250cmFjdFBvc2l0aW9ucyI7czo0OiJwYXRoIjtzOjcxOiJtb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0UG9zaXRpb25zL29xY19FeHRlcm5hbENvbnRyYWN0UG9zaXRpb25zLnBocCI7czozOiJ0YWIiO2I6MDt9aToxMjthOjQ6e3M6NjoibW9kdWxlIjtzOjI1OiJvcWNfRXh0ZXJuYWxDb250cmFjdENvc3RzIjtzOjU6ImNsYXNzIjtzOjI1OiJvcWNfRXh0ZXJuYWxDb250cmFjdENvc3RzIjtzOjQ6InBhdGgiO3M6NjM6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RDb3N0cy9vcWNfRXh0ZXJuYWxDb250cmFjdENvc3RzLnBocCI7czozOiJ0YWIiO2I6MDt9aToxMzthOjQ6e3M6NjoibW9kdWxlIjtzOjMzOiJvcWNfRXh0ZXJuYWxDb250cmFjdERldGFpbGVkQ29zdHMiO3M6NToiY2xhc3MiO3M6MzM6Im9xY19FeHRlcm5hbENvbnRyYWN0RGV0YWlsZWRDb3N0cyI7czo0OiJwYXRoIjtzOjc5OiJtb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0RGV0YWlsZWRDb3N0cy9vcWNfRXh0ZXJuYWxDb250cmFjdERldGFpbGVkQ29zdHMucGhwIjtzOjM6InRhYiI7YjowO31pOjE0O2E6NDp7czo2OiJtb2R1bGUiO3M6ODoib3FjX1Rhc2siO3M6NToiY2xhc3MiO3M6ODoib3FjX1Rhc2siO3M6NDoicGF0aCI7czoyOToibW9kdWxlcy9vcWNfVGFzay9vcWNfVGFzay5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjU6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfT2ZmZXJpbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoib3FjX09mZmVyaW5nIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19BZGRpdGlvbi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJvcWNfQWRkaXRpb24iO31pOjI7YToyOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0V4dGVybmFsQ29udHJhY3QucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO31pOjM7YToyOntzOjQ6ImZyb20iO3M6NTc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX1Byb2R1Y3RDYXRhbG9nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfVGFzay5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6Im9xY19UYXNrIjt9fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6Mjk6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0RvY3VtZW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19wcm9kdWN0X2RvY3VtZW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0RvY3VtZW50cy5waHAiO31pOjE7YTo0OntzOjY6Im1vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Eb2N1bWVudHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfcHJvZHVjdGNhdGFsb2dfZG9jdW1lbnRzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfRG9jdW1lbnRzLnBocCI7fWk6MjthOjQ6e3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0RvY3VtZW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19kb2N1bWVudHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Eb2N1bWVudHMucGhwIjt9aTozO2E6NDp7czo2OiJtb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfRG9jdW1lbnRzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2FkZGl0aW9uX2RvY3VtZW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0RvY3VtZW50cy5waHAiO31pOjQ7YTo0OntzOjY6Im1vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Eb2N1bWVudHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfY29udHJhY3RfZG9jdW1lbnRzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfRG9jdW1lbnRzLnBocCI7fWk6NTthOjQ6e3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0RvY3VtZW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjgwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19leHRlcm5hbGNvbnRyYWN0X2RvY3VtZW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0RvY3VtZW50cy5waHAiO31pOjY7YTo0OntzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0FjY291bnRzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2NvbnRyYWN0X2FjY291bnRzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQWNjb3VudHMucGhwIjt9aTo3O2E6NDp7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19BY2NvdW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19hY2NvdW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0FjY291bnRzLnBocCI7fWk6ODthOjQ6e3M6NjoibW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfQWNjb3VudHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfYWRkaXRpb25fYWNjb3VudHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19BY2NvdW50cy5waHAiO31pOjk7YTo0OntzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0FjY291bnRzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6Nzk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2V4dGVybmFsY29udHJhY3RfYWNjb3VudHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19BY2NvdW50cy5waHAiO31pOjEwO2E6NDp7czo2OiJtb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Db250YWN0cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19jb250cmFjdF9jb250YWN0c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0NvbnRhY3RzLnBocCI7fWk6MTE7YTo0OntzOjY6Im1vZHVsZSI7czo4OiJDb250YWN0cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0NvbnRhY3RzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2FkZGl0aW9uX2NvbnRhY3RzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQ29udGFjdHMucGhwIjt9aToxMjthOjQ6e3M6NjoibW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfQ29udGFjdHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfb2ZmZXJpbmdfY29udGFjdHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Db250YWN0cy5waHAiO31pOjEzO2E6NDp7czo2OiJtb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Db250YWN0cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19leHRlcm5hbGNvbnRyYWN0X2NvbnRhY3RzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQ29udGFjdHMucGhwIjt9aToxNDthOjQ6e3M6NjoibW9kdWxlIjtzOjExOiJvcWNfUHJvZHVjdCI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1Byb2R1Y3QucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfY29udHJhY3Rfb3FjX3Byb2R1Y3RNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Qcm9kdWN0LnBocCI7fWk6MTU7YTo0OntzOjY6Im1vZHVsZSI7czoxMToib3FjX1Byb2R1Y3QiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Qcm9kdWN0LnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX29mZmVyaW5nX29xY19wcm9kdWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfUHJvZHVjdC5waHAiO31pOjE2O2E6NDp7czo2OiJtb2R1bGUiO3M6MTE6Im9xY19Qcm9kdWN0IjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfUHJvZHVjdC5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19hZGRpdGlvbl9vcWNfcHJvZHVjdE1ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX1Byb2R1Y3QucGhwIjt9aToxNzthOjQ6e3M6NjoibW9kdWxlIjtzOjc6IlByb2plY3QiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Qcm9qZWN0LnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2NvbnRyYWN0X3Byb2plY3RNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Qcm9qZWN0LnBocCI7fWk6MTg7YTo0OntzOjY6Im1vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfUHJvamVjdC5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19wcm9qZWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfUHJvamVjdC5waHAiO31pOjE5O2E6NDp7czo2OiJtb2R1bGUiO3M6NzoiUHJvamVjdCI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1Byb2plY3QucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfZXh0ZXJuYWxjb250cmFjdF9wcm9qZWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfUHJvamVjdC5waHAiO31pOjIwO2E6NDp7czo2OiJtb2R1bGUiO3M6MTI6Im9xY19Db250cmFjdCI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0NvbnRyYWN0LnBocCI7czo5OiJtZXRhX2RhdGEiO3M6ODM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2V4dGVybmFsY29udHJhY3Rfb3FjX2NvbnRyYWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQ29udHJhY3QucGhwIjt9aToyMTthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJvcWNfQ29udHJhY3QiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Db250cmFjdC5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19jb250cmFjdF9vcWNfYWRkaXRpb25NZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Db250cmFjdC5waHAiO31pOjIyO2E6NDp7czo2OiJtb2R1bGUiO3M6MTI6Im9xY19PZmZlcmluZyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX09mZmVyaW5nLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX29mZmVyaW5nX29xY19jb250cmFjdE1ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX09mZmVyaW5nLnBocCI7fWk6MjM7YToyOntzOjY6Im1vZHVsZSI7czo4OiJvcWNfVGFzayI7czo5OiJtZXRhX2RhdGEiO3M6NjE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2RlZmF1bHRNZXRhRGF0YS5waHAiO31pOjI0O2E6Mzp7czo2OiJtb2R1bGUiO3M6NToiVXNlcnMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Vc2Vycy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjY0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY190YXNrX3VzZXJzTWV0YURhdGEucGhwIjt9aToyNTthOjQ6e3M6NjoibW9kdWxlIjtzOjExOiJvcWNfU2VydmljZSI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1NlcnZpY2UucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfY29udHJhY3Rfb3FjX3NlcnZpY2VNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19TZXJ2aWNlLnBocCI7fWk6MjY7YTo0OntzOjY6Im1vZHVsZSI7czoxMToib3FjX1NlcnZpY2UiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19TZXJ2aWNlLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX29mZmVyaW5nX29xY19zZXJ2aWNlTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfU2VydmljZS5waHAiO31pOjI3O2E6NDp7czo2OiJtb2R1bGUiO3M6MTE6Im9xY19TZXJ2aWNlIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfU2VydmljZS5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19hZGRpdGlvbl9vcWNfc2VydmljZU1ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX1NlcnZpY2UucGhwIjt9aToyODthOjQ6e3M6NjoibW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo1MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19vcHBvcnR1bml0aWVzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfT3Bwb3J0dW5pdGllcy5waHAiO319czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6MTM6ImN1c3RvbV9maWVsZHMiO2E6NDp7aTowO2E6Nzp7czo0OiJuYW1lIjtzOjE0OiJvZmZpY2VudW1iZXJfYyI7czo1OiJsYWJlbCI7czoyMToiTEJMX09RQ19PRkZJQ0VfTlVNQkVSIjtzOjQ6InR5cGUiO3M6NzoidmFyY2hhciI7czo4OiJtYXhfc2l6ZSI7czoyOiIyNSI7czo3OiJhdWRpdGVkIjtiOjA7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTA6Im1hc3N1cGRhdGUiO2I6MDt9aToxO2E6Njp7czo0OiJuYW1lIjtzOjEyOiJpc2V4dGVybmFsX2MiO3M6NToibGFiZWwiO3M6MTY6IkxCTF9PUUNfRVhURVJOQUwiO3M6NDoidHlwZSI7czo0OiJib29sIjtzOjc6ImF1ZGl0ZWQiO2I6MDtzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxMDoibWFzc3VwZGF0ZSI7YjowO31pOjI7YTo2OntzOjQ6Im5hbWUiO3M6MTI6ImlzZXh0ZXJuYWxfYyI7czo1OiJsYWJlbCI7czoxNjoiTEJMX09RQ19FWFRFUk5BTCI7czo0OiJ0eXBlIjtzOjQ6ImJvb2wiO3M6NzoiYXVkaXRlZCI7YjowO3M6NjoibW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjEwOiJtYXNzdXBkYXRlIjtiOjA7fWk6MzthOjk6e3M6NDoibmFtZSI7czoxODoiZG9jdW1lbnRfcHVycG9zZV9jIjtzOjU6ImxhYmVsIjtzOjIwOiJMQkxfRE9DVU1FTlRfUFVSUE9TRSI7czo0OiJ0eXBlIjtzOjQ6ImVudW0iO3M6MTM6ImRlZmF1bHRfdmFsdWUiO3M6MToiICI7czo0OiJleHQxIjtzOjIxOiJkb2N1bWVudF9wdXJwb3NlX2xpc3QiO3M6NzoiYXVkaXRlZCI7YjowO3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxMDoibWFzc3VwZGF0ZSI7YjowO3M6Njoic3R1ZGlvIjtzOjc6InZpc2libGUiO319czo3OiJ2YXJkZWZzIjthOjY6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfT2ZmZXJpbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoib3FjX09mZmVyaW5nIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19BZGRpdGlvbi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJvcWNfQWRkaXRpb24iO31pOjI7YToyOntzOjQ6ImZyb20iO3M6NTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0V4dGVybmFsQ29udHJhY3QucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO31pOjM7YToyOntzOjQ6ImZyb20iO3M6NTQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1Byb2R1Y3RDYXRhbG9nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo1MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjt9fXM6MTQ6InBvc3RfdW5pbnN0YWxsIjthOjE6e2k6MDtzOjM3OiI8YmFzZXBhdGg+L3NjcmlwdHMvcG9zdF91bmluc3RhbGwucGhwIjt9fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9','2015-09-25 02:05:59',1);
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('377ba4e4-1c24-5e31-94a9-5604ab77c664','ETag',0,'2015-09-25 02:05:32','2015-09-25 02:10:16','1','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mzt9'),('4d3986b2-bb91-b875-fc70-5604acfec4f3','global',0,'2015-09-25 02:08:11','2015-09-25 02:08:11','4b4e55a5-4581-05a5-4f14-5604acc3ed56','YToxOntzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czozNjoiNGQyMWQxMTEtYjliYi00MTE3LWE3MTYtNTYwNGFjMDc4YThkIjt9'),('58b46b73-189f-689f-92dd-5604ab190b0e','global',0,'2015-09-25 02:04:13','2015-09-25 02:05:32','1','YToyNzp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6IjU4OTdlM2QyLWVlNWYtZTg0Ny00NTFiLTU2MDRhYjhkNGE5NCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWdhcjUiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MTk6IkF1c3RyYWxpYS9NZWxib3VybmUiO3M6MTY6InN3YXBfbGFzdF92aWV3ZWQiO3M6MDoiIjtzOjE0OiJzd2FwX3Nob3J0Y3V0cyI7czowOiIiO3M6MTk6Im5hdmlnYXRpb25fcGFyYWRpZ20iO3M6MjoiZ20iO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTotMTtzOjI6InV0IjtzOjE6IjEiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7fQ=='),('74773743-5bb0-a773-ec93-5604ab87b44f','Home',0,'2015-09-25 02:05:32','2015-09-25 02:05:32','1','YToyOntzOjg6ImRhc2hsZXRzIjthOjg6e3M6MzY6IjUzZTYwNTM4LTIyZjAtYWE5ZS0yZTMzLTU2MDRhYjZkNDAyYyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxMzoiaUZyYW1lRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NDoiSG9tZSI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTM6Im1vZHVsZXMvSG9tZS9EYXNobGV0cy9pRnJhbWVEYXNobGV0L2lGcmFtZURhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6Mzp7czoxMDoidGl0bGVMYWJlbCI7czozMDoiTEJMX0RBU0hMRVRfRElTQ09WRVJfU1VHQVJfUFJPIjtzOjM6InVybCI7czo0MjoiaHR0cHM6Ly93d3cuc3VnYXJjcm0uY29tL2NybS9wcm9kdWN0L2dvcHJvIjtzOjY6ImhlaWdodCI7aTozMTU7fX1zOjM2OiI1M2U3NmMxOC01OTZhLTRiMTYtMjQ5OS01NjA0YWI1MmYyM2EiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6MTY6IlN1Z2FyRmVlZERhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjk6IlN1Z2FyRmVlZCI7czoxMToiZm9yY2VDb2x1bW4iO2k6MTtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjQ6Im1vZHVsZXMvU3VnYXJGZWVkL0Rhc2hsZXRzL1N1Z2FyRmVlZERhc2hsZXQvU3VnYXJGZWVkRGFzaGxldC5waHAiO31zOjM2OiI1M2U4MWVlMi1kMDk3LTk3ZWQtNWQ4YS01NjA0YWJlMzM1OTUiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTM6ImlGcmFtZURhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjQ6IkhvbWUiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjE7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjUzOiJtb2R1bGVzL0hvbWUvRGFzaGxldHMvaUZyYW1lRGFzaGxldC9pRnJhbWVEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjM6e3M6MTA6InRpdGxlTGFiZWwiO3M6MjI6IkxCTF9EQVNITEVUX1NVR0FSX05FV1MiO3M6MzoidXJsIjtzOjQxOiJodHRwczovL3d3dy5zdWdhcmNybS5jb20vY3JtL3Byb2R1Y3QvbmV3cyI7czo2OiJoZWlnaHQiO2k6MzE1O319czozNjoiNTQ4NWJlMDEtNzE5Ny1jMzBiLTcwMWMtNTYwNGFiNzhkOWM2IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUNhbGxzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiQ2FsbHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0NhbGxzL0Rhc2hsZXRzL015Q2FsbHNEYXNobGV0L015Q2FsbHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNTU0ZDFhNTUtZmMxNC0yNjNlLWViYzAtNTYwNGFiYTQxY2YzIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeU1lZXRpbmdzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiTWVldGluZ3MiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL01lZXRpbmdzL0Rhc2hsZXRzL015TWVldGluZ3NEYXNobGV0L015TWVldGluZ3NEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNTVjYTJjMDktY2ZmOS1mYzk3LTQwZDYtNTYwNGFiNmNiMWNjIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjIyOiJNeU9wcG9ydHVuaXRpZXNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6ODA6Im1vZHVsZXMvT3Bwb3J0dW5pdGllcy9EYXNobGV0cy9NeU9wcG9ydHVuaXRpZXNEYXNobGV0L015T3Bwb3J0dW5pdGllc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiI1NzAwNGU2OC02MDUxLTc5MTgtM2M3My01NjA0YWI4NzgwZTYiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTc6Ik15QWNjb3VudHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjU6Im1vZHVsZXMvQWNjb3VudHMvRGFzaGxldHMvTXlBY2NvdW50c0Rhc2hsZXQvTXlBY2NvdW50c0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiI1N2NkM2ZjOC1mYmNlLTFlOGYtODJlNi01NjA0YWJjMzgwMWIiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTQ6Ik15TGVhZHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo1OiJMZWFkcyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTY6Im1vZHVsZXMvTGVhZHMvRGFzaGxldHMvTXlMZWFkc0Rhc2hsZXQvTXlMZWFkc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX19czo1OiJwYWdlcyI7YToxOntpOjA7YTozOntzOjc6ImNvbHVtbnMiO2E6Mjp7aTowO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI2MCUiO3M6ODoiZGFzaGxldHMiO2E6Njp7aTowO3M6MzY6IjUzZTYwNTM4LTIyZjAtYWE5ZS0yZTMzLTU2MDRhYjZkNDAyYyI7aToxO3M6MzY6IjU0ODViZTAxLTcxOTctYzMwYi03MDFjLTU2MDRhYjc4ZDljNiI7aToyO3M6MzY6IjU1NGQxYTU1LWZjMTQtMjYzZS1lYmMwLTU2MDRhYmE0MWNmMyI7aTozO3M6MzY6IjU1Y2EyYzA5LWNmZjktZmM5Ny00MGQ2LTU2MDRhYjZjYjFjYyI7aTo0O3M6MzY6IjU3MDA0ZTY4LTYwNTEtNzkxOC0zYzczLTU2MDRhYjg3ODBlNiI7aTo1O3M6MzY6IjU3Y2QzZmM4LWZiY2UtMWU4Zi04MmU2LTU2MDRhYmMzODAxYiI7fX1pOjE7YToyOntzOjU6IndpZHRoIjtzOjM6IjQwJSI7czo4OiJkYXNobGV0cyI7YToyOntpOjA7czozNjoiNTNlNzZjMTgtNTk2YS00YjE2LTI0OTktNTYwNGFiNTJmMjNhIjtpOjE7czozNjoiNTNlODFlZTItZDA5Ny05N2VkLTVkOGEtNTYwNGFiZTMzNTk1Ijt9fX1zOjEwOiJudW1Db2x1bW5zIjtzOjE6IjIiO3M6MTQ6InBhZ2VUaXRsZUxhYmVsIjtzOjIwOiJMQkxfSE9NRV9QQUdFXzFfTkFNRSI7fX19'),('75d77968-5393-e2e6-1fa2-5604abee1d95','Home2_CALL',0,'2015-09-25 02:05:32','2015-09-25 02:05:32','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('76744b98-07fa-1b06-cb0f-5604ab9b58f1','Home2_MEETING',0,'2015-09-25 02:05:32','2015-09-25 02:05:32','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('770f5a1a-8098-0b5e-976d-5604abf7c40e','Home2_OPPORTUNITY',0,'2015-09-25 02:05:32','2015-09-25 02:05:32','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('77a5755e-51d1-0b3b-9ec8-5604abb8e0ec','Home2_ACCOUNT',0,'2015-09-25 02:05:32','2015-09-25 02:05:32','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('780d8565-ec4c-761f-113d-5604ab7cf6dc','Home2_LEAD',0,'2015-09-25 02:05:32','2015-09-25 02:05:32','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('78ed4a3a-0db0-7788-c86d-5604abc24694','Home2_SUGARFEED',0,'2015-09-25 02:05:32','2015-09-25 02:05:32','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$1$6pSjS9w1$rnF55Uummbkb/leQtJyp6/',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2015-09-25 02:04:13','2015-09-25 02:05:32','1','','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0),('4b4e55a5-4581-05a5-4f14-5604acc3ed56','usr-4llf','b98ee2dd595bcc477cb26a77e3304884',0,NULL,NULL,1,'Bruno','Chauvet',1,0,1,NULL,'2015-09-25 02:08:11','2015-09-25 02:08:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES ('5d96cccb-2b24-3708-d5c7-5604adcec4aa',0,'2015-09-25 02:10:18','2015-09-25 02:10:18','1','1','Rebuild Relationships','4.0.0','4.0.0'),('61c97487-f36e-cc80-1dee-5604ab2fa620',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','Chart Data Cache','3.5.1','3.5.1'),('62aeba1e-8190-f45e-c8ad-5604abdfab0f',0,'2015-09-25 02:04:13','2015-09-25 02:04:13','1','1','htaccess','3.5.1','3.5.1'),('e2b3a68f-68db-c379-05c0-5604ac7b198c',0,'2015-09-25 02:06:10','2015-09-25 02:06:10','1','1','Rebuild Extensions','4.0.0','4.0.0');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-25 12:17:17
