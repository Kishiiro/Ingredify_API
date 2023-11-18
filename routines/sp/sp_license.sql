/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 11.2.0-MariaDB : Database - pantry
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pantry` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `pantry`;

/* Procedure structure for procedure `sp_license` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_license` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_license`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_LicenseID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_LicenseType			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_Certificates			VARCHAR(100) DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_license(
					@ReturnIsSuccess		
					,'{
						 "LicenseType": "12345"	
						,"Certiificate": ""
						,"Delimert": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'license_1'; 		
			SET $_LicenseType := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseType")));		
			SET $_Certificates := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Certificates")));	
			
			IF $_LicenseType 	= 'NULL' OR $_LicenseType	= '' THEN SET $_LicenseType	:= NULL; END IF;			
			IF $_Certificates 	= 'NULL' OR $_Certificates	= '' THEN SET $_Certificates  	:= NULL; END IF;			
			
			IF $_LicenseType IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'LicenseType is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_LicenseID		:= (SELECT IFNULL(MAX(`LicenseID`), 0) + 1 FROM `M_License`);
				
				INSERT INTO `M_License`(
					 `LicenseID`
					,`LicenseType`
					,`Certificates`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_LicenseID
					,$_LicenseType
					,$_Certificates
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No License is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1						
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_LicenseID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`LicenseID`
				,A.`LicenseType`
				,A.`Certificates`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `M_License` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`LicenseID` = $_LicenseID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
