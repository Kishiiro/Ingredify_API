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

/* Procedure structure for procedure `sp_ingredients` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ingredients` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ingredients`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_IngredientsID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ingredientsName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_Category			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_NutritionalInformation	VARCHAR(50)  DEFAULT NULL;
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
						
				CALL sp_ingredients(
					@ReturnIsSuccess		
					,'{
						 "IngredientsName": "Onion"	
						,"Category": "Spicy"
						,"NutritionalInformation": "Vitamins"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'ingredients_1'; 		
			SET $_IngredientsName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.IngredientsName")));
			SET $_Category := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Category")));	
			SET $_NutritionalInformation := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.NutritionalInformation")));	
			
			IF $_IngredientsName 	= 'NULL' OR $_IngredientsName		= '' THEN SET $_IngredientsName	:= NULL; END IF;
			IF $_Category	= 'NULL' OR $_Category	= '' THEN SET $_Category	:= NULL; END IF;		
			IF $_NutritionalInformation	= 'NULL' OR $_NutritionalInformation	= '' THEN SET $_NutritionalInformation	:= NULL; END IF;				
			
			IF $_IngredientsName IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'IngredientsName is required.';
			ELSEIF $_Category IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'Category is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_IngredientsID		:= (SELECT IFNULL(MAX(`IngredientsID`), 0) + 1 FROM `M_Ingredients`);
				
				INSERT INTO `M_Ingredients`(
					 `IngredientsID`
					,`IngredientsName`
					,`Category`
					,`NutritionalInformation`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_IngredientsID
					,$_IngredientsName
					,$_Category
					,$_NutritionalInformation
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
					signal SQLSTATE '45000' SET message_text = 'No Ingredients is inserted.';	
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
						
				CALL sp_ingredients(
					@ReturnIsSuccess		
					,'{
						 "IngredientsName": "Onion"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'ingredients_2'; 		
			SET $_IngredientsName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.IngredientsName")));
			
			IF $_IngredientsName 	= 'NULL' OR $_IngredientsName	= '' THEN SET $_IngredientsName	:= NULL; END IF;				
			
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				
				SET @_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				IF EXISTS(SELECT `CheffiesID` FROM `M_Cheffies` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					
					SELECT   C.`IngredientsID`
						,C.`IngredientsName`
						,'No'					AS 'IsExperts'
						,@_ProfileID				AS 'ProfileID'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `M_Ingredients` C 
					WHERE C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1;
					
				ELSEIF EXISTS(SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
				
					SELECT   B.`IngredientID`
						,C.`IngredientsName`
						,B.`QuantityAvailable`
						,A.`ProfileID`
						,'Yes'					AS 'IsExperts'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `MT_Experts` A
					INNER JOIN `T_Pantry` B ON A.`ExpertsID` = B.`ExpertsID`
					INNER JOIN `M_Ingredients` C ON B.`IngredientID` = C.`IngredientsID`
					WHERE A.`ProfileID` = fn_login($_TransactBy,NULL,NULL,2)
					AND C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1
					AND B.`ReferenceTableStatusID` = 1;
				 END IF;  
			 END IF;
		END; -- end of flag 2	
	    WHEN 3 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_ingredients(
					@ReturnIsSuccess		
					,'{
						 "IngredientsName": "Onion"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "3"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'ingredients_3'; 		
			SET $_IngredientsName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.IngredientsName")));
			
			IF $_IngredientsName 	= 'NULL' OR $_IngredientsName		= '' THEN SET $_IngredientsName	:= NULL; END IF;				
			
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET @_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				IF EXISTS(SELECT `CheffiesID` FROM `M_Cheffies` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					
					SELECT   E.`RecipeID`
						,E.`RecipeName`
						,C.`IngredientsName`
						,E.`CookingInstruction`
						,E.`Description`
						,E.`RecipeImage`
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM  `M_Ingredients` C 
					INNER JOIN `T_RecipeIngredients` D ON C.`IngredientsID` = D.`IngredientsID`
					INNER JOIN `T_Recipe` E ON D.`RecipeID` = E.`RecipeID`
					WHERE C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1;
					
				ELSEIF EXISTS(SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
				
					SELECT   E.`RecipeID`
						,E.`RecipeName`
						,C.`IngredientsName`
						,E.`CookingInstruction`
						,E.`Description`
						,E.`RecipeImage`
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `MT_Experts` A
					INNER JOIN `T_Pantry` B ON A.`ExpertsID` = B.`ExpertsID`
					INNER JOIN `M_Ingredients` C ON B.`IngredientID` = C.`IngredientsID`
					INNER JOIN `T_RecipeIngredients` D ON C.`IngredientsID` = D.`IngredientsID`
					INNER JOIN `T_Recipe` E ON D.`RecipeID` = E.`RecipeID`
					WHERE A.`ProfileID` = fn_login($_TransactBy,NULL,NULL,2)
					AND C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1
					AND B.`ReferenceTableStatusID` = 1;
				 END IF; 
			 END IF;
		END; -- end of flag 3		
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_IngredientsID;
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
				 A.`IngredientsID`
				,A.`IngredientsName`
				,A.`Category`
				,A.`NutritionalInformation`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `M_Ingredients` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`IngredientsID` = $_IngredientsID;	        
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
