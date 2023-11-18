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

/* Procedure structure for procedure `sp_mealplan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_mealplan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mealplan`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_MealPlanID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_RecipeID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_MealType			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_MealPlanDate			VARCHAR(50)  DEFAULT NULL;
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
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_mealplan(
					@ReturnIsSuccess		
					,'{
						 "ProfileID": "21"	
						,"RecipeID": "1"
						,"Date": "2023-11-02"
						,"MealType": "Breakfast"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'mealplan_1'; 		
			SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));
			SET $_RecipeID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeID")));	
			SET $_MealType := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MealType")));	
			SET $_MealPlanDate := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Date")));	
			
			IF $_ProfileID 	= 'NULL' OR $_ProfileID		= '' THEN SET $_ProfileID	:= NULL; END IF;
			IF $_RecipeID	= 'NULL' OR $_RecipeID	= '' THEN SET $_RecipeID	:= NULL; END IF;		
			IF $_MealType	= 'NULL' OR $_MealType	= '' THEN SET $_MealType	:= NULL; END IF;		
			IF $_MealPlanDate	= 'NULL' OR $_MealPlanDate	= '' THEN SET $_MealPlanDate	:= NULL; END IF;				
			
			IF $_ProfileID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';
			ELSEIF $_RecipeID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'RecipeID is required.';	
			ELSEIF $_MealType IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'MealType is required.';	
			ELSEIF $_MealPlanDate IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'Date is required.';											
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_MealPlanID		:= (SELECT IFNULL(MAX(`MealPlanID`), 0) + 1 FROM `MT_MealPlan`);
				
				INSERT INTO `MT_MealPlan`(
					 `MealPlanID`
					,`ProfileID`
					,`RecipeID`
					,`MealType`
					,`MealPlanDate`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_MealPlanID
					,$_ProfileID
					,$_RecipeID
					,$_MealType
					,$_MealPlanDate
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
					signal SQLSTATE '45000' SET message_text = 'No MealPlan is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1		
	    WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_mealplan(
					@ReturnIsSuccess		
					,'{
						 "Date": "2023-11-02"
						,"ProfileID": "22"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'mealplan_2'; 		
			SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
			SET $_MealPlanDate := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Date")));	
			
			IF $_ProfileID 	= 'NULL' OR $_ProfileID		= '' THEN SET $_ProfileID	:= NULL; END IF;		
			IF $_MealPlanDate	= 'NULL' OR $_MealPlanDate	= '' THEN SET $_MealPlanDate	:= NULL; END IF;				
			
			IF $_ProfileID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';	
			ELSEIF $_MealPlanDate IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'MealPlanDate is required.';											
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SELECT 
					A.`RecipeID`
					,B.`RecipeImage`
					,B.`RecipeName`
					,A.`MealPlanDate`
					,A.`MealType`
					,CONCAT(C.`ProfileFirstName`,' ' ,C.`ProfileLastName`) AS 'ExpertsName'	
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `MT_MealPlan` A
				INNER JOIN `T_Recipe` B ON A.RecipeID = B.RecipeID
				INNER JOIN `M_Profile` C ON C.ProfileID = B.ProfileID
				WHERE A.ProfileID = $_ProfileID AND A.MealPlanDate = $_MealPlanDate
				AND A.`ReferenceTableStatusID` = 1
				AND B.`ReferenceRecipeStatusID` = 7;
			 END IF;
		END; -- end of flag 2			
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_MealPlanID;
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
				 A.`MealPlanID`
				,A.`ProfileID`
				,A.`RecipeID`
				,A.`MealType`
				,A.`MealPlanDate`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				-- ,$_View 				AS 'View'
			FROM `MT_MealPlan` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`MealPlanID` = $_MealPlanID;	        
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
