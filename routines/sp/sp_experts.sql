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

/* Procedure structure for procedure `sp_experts` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_experts` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_experts`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_ExpertsID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_LicenseID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_PantryID			VARCHAR(100) DEFAULT NULL;
	DECLARE $_Points			VARCHAR(100) DEFAULT NULL;
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
						
				CALL sp_experts(
					@ReturnIsSuccess		
					,'{
						 "ProfileID": "12345"	
						,"LicenseID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'experts_1'; 		
			SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));		
			SET $_LicenseID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseID")));	
			
			IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID	:= NULL; END IF;			
			IF $_LicenseID 	= 'NULL' OR $_LicenseID	= '' THEN SET $_LicenseID  	:= NULL; END IF;			
			
			IF $_ProfileID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_ExpertsID		:= (SELECT IFNULL(MAX(`ExpertsID`), 0) + 1 FROM `MT_Experts`);
				
				INSERT INTO `MT_Experts`(
					 `ExpertsID`
					,`ProfileID`
					,`LicenseID`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_ExpertsID
					,$_ProfileID
					,$_LicenseID
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
					signal SQLSTATE '45000' SET message_text = 'No Experts is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1		
	    WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_experts(
					@ReturnIsSuccess		
					,'{
						 "ProfileID": "12345"	
						,"LicenseID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'experts_2'; 		
			SET $_ExpertsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExpertID")));	
			
			IF $_ExpertsID 	= 'NULL' OR $_ExpertsID	= '' THEN SET $_ExpertsID	:= NULL; END IF;			
			
			IF $_ExpertsID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ExpertsID is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				 Update MT_Experts
				 SET `ReferenceExpertsStatusID` = 6
				     ,`UpdatedByUserLogInID`  	= $_TransactBy
				     ,`DateUpdated` 		= now()
				 WHERE `ExpertsID` = $_ExpertsID;
				 
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Experts is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 2	
	 WHEN 3 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_experts(
					@ReturnIsSuccess		
					,'{
						
						"Delimeter": "SP"					
						,"TransactBy": "10"						
						,"Flag": "3"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'experts_3'; 				
			/*
			----------------------------------------------------------------------------------
							MEAL SUGGESTIONS SIDE
			----------------------------------------------------------------------------------
			*/
			IF $_TransactBy IS NULL THEN 
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
			ELSE
				SELECT 
					B.`RecipeName`
					,B.`RecipeImage`
					,B.`Description`
					,B.`DateAdded`
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `MT_Experts` A
				INNER JOIN `T_Recipe` B ON A.`ExpertsID` = B.`ExpertsID`
				WHERE `ReferenceRecipeStatusID` = 7
				AND A.`ProfileID` = fn_login($_TransactBy,NULL,NULL,2);	 
			END IF; 
		END; -- end of flag 3				
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_ExpertsID;
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
				 A.`ExpertsID`
				,A.`ProfileID`
				,A.`LicenseID`
				,A.`PantryID`
				,A.`Points`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `MT_Experts` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`ExpertsID` = $_ExpertsID;	        
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
