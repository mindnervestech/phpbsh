-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.44-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table bsh.reportmd
CREATE TABLE IF NOT EXISTS `reportmd` (
  `id` bigint(20) NOT NULL,
  `access` longtext,
  `columns` longtext,
  `description` longtext,
  `hiddenpivotcol` longtext,
  `jsonForm` longtext,
  `jsonSchema` longtext,
  `name` varchar(255) DEFAULT NULL,
  `query` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bsh.reportmd: ~1 rows (approximately)
/*!40000 ALTER TABLE `reportmd` DISABLE KEYS */;
INSERT INTO `reportmd` (`id`, `access`, `columns`, `description`, `hiddenpivotcol`, `jsonForm`, `jsonSchema`, `name`, `query`) VALUES
	(2, NULL, '[\r\n	{ "data": "Disposition1", "name":"Disposition1" },\r\n	{ "data": "Disposition2","name":"Disposition2" },\r\n	{ "data": "Lead number","name":"Lead number" },\r\n	{ "data": "Upload date","name":"Upload date" },\r\n	{ "data": "Follow up date","name":"Follow up date" },\r\n	{ "data": "Reason","name":"Reason" },\r\n	{ "data": "Escaled date","name":"Escaled date" },\r\n	{ "data": "Last modified", "name":"Last modified" }\r\n]', 'New Report', '[]', '[\r\n	{\r\n    	"type":"section",\r\n        "htmlClass":"row",\r\n           \r\n        "items":[\r\n        	{\r\n            	"items":[\r\n                	{\r\n                    	"key":"status",\r\n                    	"feedback":false, \r\n                    	"type":"checkboxes",\r\n                    	"labelHtmlClass":"labelHtmlClass",\r\n                                "titleMap":[\r\n                                                     {"name":"Escalated","value":"Escalated"},\r\n                                                {"name":"Tried Contacted","value":"Tried Contacted"},\r\n                                                {"name":"Contacted","value":"Contacted"},\r\n                                                {"name":"New","value":"New"}\r\n                                            ]\r\n               		}\r\n             	],\r\n                "htmlClass":"col-xs-2-4",\r\n                "type":"section" \r\n           	},\r\n	{\r\n            	"items":[\r\n                	{\r\n                    	"key":"ZONE_PT",\r\n                    	"feedback":false, \r\n                    	"type":"checkboxes",\r\n                    	"labelHtmlClass":"labelHtmlClass",\r\n                                "titleMap":"titleMapFn_allZONE_PT"\r\n               		}\r\n             	],\r\n                "htmlClass":"col-xs-2-4",\r\n                "type":"section" \r\n           	},\r\n            {\r\n            	"items":[\r\n                 	{\r\n                    	"key":"PRODUCT_PT",\r\n                        "feedback":false, \r\n                        "type":"strapselect",\r\n                        "htmlClass":"strapselect-multiple",\r\n                        "placeholder":"Please Select",\r\n                        "options": {\r\n                        	"multiple": "true", \r\n                            "inlineMaxLength": "2",\r\n                            "inlineMaxLengthHtml": "Too many items to show..." \r\n                        } ,\r\n                        "labelHtmlClass":"labelHtmlClass",\r\n                        "titleMap":"titleMapFn_allPRODUCT_PT"\r\n                  	}\r\n              	],\r\n              	"htmlClass":"col-xs-2-4",\r\n                "type":"section" \r\n          	}\r\n          	{ \r\n				"items":[ \r\n					{ \r\n						"key":"fromdate",\r\n						"htmlClass":"strapselect-date",\r\n						"feedback":false, \r\n						"fieldHtmlClass":"input-sm-cust",\r\n						"labelHtmlClass":"labelHtmlClass" \r\n					} \r\n				], \r\n				"htmlClass":"col-xs-2-4", \r\n				"type":"section" \r\n			}\r\n			{ \r\n				"items":[ \r\n					{ \r\n						"key":"todate",\r\n						"htmlClass":"strapselect-date",\r\n						"feedback":false, \r\n						"fieldHtmlClass":"input-sm-cust",\r\n						"labelHtmlClass":"labelHtmlClass" \r\n					} \r\n				], \r\n				"htmlClass":"col-xs-2-4", \r\n				"type":"section" \r\n			}\r\n      	],\r\n        "htmlClass":"col-xs-12",\r\n        "type":"section"\r\n   	}\r\n]', '{\r\n	"properties":{\r\n		"status":{\r\n			"title":"Status",\r\n			"type":"array",\r\n			"items":{\r\n				"type":"string"\r\n			}\r\n		},"ZONE_PT":{\r\n			"title":"Zone",\r\n			"type":"array",\r\n			"items": { \r\n				"type": "string"\r\n				}\r\n		},\r\n        "PRODUCT_PT":{\r\n        	"title":"Product",\r\n        	"type":"array",\r\n        	"items": { \r\n        		"type": "string"\r\n        	}\r\n        },\r\n        "fromdate":{\r\n        	"title":"From Date",\r\n        	"type":"string",\r\n        	"format":"datepicker"\r\n        },\r\n        "todate":{\r\n        	"title":"To Date",\r\n        	"type":"string",\r\n        	"format":"datepicker"\r\n        }\r\n	},\r\n    "type":"object",\r\n    "title": "form"\r\n}', 'Report', 'SELECT \r\nL.disposition1 AS \'Disposition1\',\r\nL.disposition2 AS \'Disposition2\',\r\nL.leadNumber AS \'Lead number\',\r\nDATE_FORMAT(L.uploadDate,\'%d/%m/%Y\') AS \'Upload date\',\r\nDATE_FORMAT(L.followUpDate,\'%d/%m/%Y\') AS \'Follow up date\',\r\nL.reason AS \'Reason\',\r\nDATE_FORMAT(L.escalatedDate,\'%d/%m/%Y\') AS \'Escaled date\',\r\nDATE_FORMAT(L.lastDispo1ModifiedDate,\'%d/%m/%Y\') AS \'Last modified\' \r\nFROM lead L,leaddetails LD,dealer D \r\nWHERE \r\n	L.dealer_id = D.id AND \r\n	L.leadDetails_id=LD.id AND \r\n	(D.zone in (:ZONE_PTin) OR :ZONE_PT IS NULL) AND\r\n	(L.disposition1 in (:statusin) OR :status IS NULL) AND\r\n	(LD.product_id in (:PRODUCT_PTin) OR :PRODUCT_PT IS NULL) AND\r\n	(L.uploadDate >= STR_TO_DATE(:fromdate,\'%d/%m/%Y\') OR :fromdate IS NULL) AND\r\n	(L.uploadDate <= STR_TO_DATE(:todate,\'%d/%m/%Y\') OR :todate IS NULL)');
/*!40000 ALTER TABLE `reportmd` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
