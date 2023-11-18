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

/* Procedure structure for procedure `sp_recipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_recipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe`(
	  OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_RecipeID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_RestrictionsID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_RecipeName			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_Description			VARCHAR(100) DEFAULT NULL;
	DECLARE $_CookingInstruction		VARCHAR(100) DEFAULT NULL;
	DECLARE $_Preparation			VARCHAR(100) DEFAULT NULL;
	DECLARE $_DifficultyLevel		VARCHAR(100) DEFAULT NULL;
	DECLARE $_RecipeImage			VARCHAR(100) DEFAULT NULL;
	DECLARE $_MealType			VARCHAR(100) DEFAULT NULL;
	DECLARE $_VidioUrl			VARCHAR(100) DEFAULT NULL;
	DECLARE $_ReferenceRecipeStatusID	VARCHAR(100) DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_IngredientsID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Quantity			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Measurement			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_RecipeIngredientsID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ExpertID			VARCHAR(10)  DEFAULT NULL;
	
	
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
						
				CALL sp_recipe(
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
			
			
			SET $_View 		:= 'recipe_1'; 		
			-- SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
			
			-- IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID := NULL; END IF;			
			
			 SELECT 
				 `RecipeID`
				,`RecipeImage`
				,`RecipeName`
				,`MealType`
				,`Description`
				,`CookingInstruction`
				,`Preparation`
				,`DifficultyLevel`
				,`VidioUrl`
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			 FROM `T_Recipe` 
			 WHERE `ReferenceRecipeStatusID`= 7;
			 
		END; -- end of flag 1		
	    WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : Nov.1, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_recipe(@ReturnIsSuccess, '{"RecipeName": "grapes", 
								  "IngredientsName": "Curry", 
								  "CookingInstruction": "testing ", 
								  "Description": "good for diet", 
								  "RecipeImage": "", 
								  "RestrictionsID": "1", 
								  "Preparation": "10:00:00", 
								  "DifficultyLevel": "2", 
								  "MealType": "Breakfast", 
								  "VidioUrl": "testlink", 
								  "TransactBy": 23, 
								  "Flag": 2, 
								  "SPName": "recipe",
								  "Detail":[{
									"IngredientsID":"1"	
									,"Quantity":"2" 	
									,"Measurement":"pcs" 	
								  }]
							}'
						)
					
			*/
			
			
			SET $_View 		:= 'recipe_2'; 		
			SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));	
			SET $_RestrictionsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RestrictionID")));	
			SET $_Description := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Description")));	
			SET $_CookingInstruction := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Instruction")));	
			SET $_Preparation := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Preparation")));	
			SET $_DifficultyLevel := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.DifficultyLevel")));	
			SET $_RecipeImage := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeImage")));	
			SET $_VidioUrl := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.VedioUrl")));	
			SET $_ExpertID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExpertID")));	
			SET @_Detail := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Detail")));
				
			
			IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;
			IF $_RestrictionsID	= 'NULL' OR $_RestrictionsID	= '' THEN SET $_RestrictionsID := NULL; END IF;
			IF $_Description	= 'NULL' OR $_Description	= '' THEN SET $_Description := NULL; END IF;
			IF $_CookingInstruction	= 'NULL' OR $_CookingInstruction	= '' THEN SET $_CookingInstruction := NULL; END IF;
			IF $_Preparation	= 'NULL' OR $_Preparation	= '' THEN SET $_Preparation := NULL; END IF;
			IF $_DifficultyLevel	= 'NULL' OR $_DifficultyLevel	= '' THEN SET $_DifficultyLevel := NULL; END IF;
			IF $_RecipeImage	= 'NULL' OR $_RecipeImage	= '' THEN SET $_RecipeImage := NULL; END IF;
			IF $_VidioUrl	= 'NULL' OR $_VidioUrl	= '' THEN SET $_VidioUrl := NULL; END IF;	
			IF $_ExpertID	= 'NULL' OR $_ExpertID	= '' THEN SET $_ExpertID := NULL; END IF;	
			IF @_Detail	= 'NULL' OR @_Detail	= '' THEN SET @_Detail:=  NULL; END IF;			
			
			
			IF $_TransactBy IS NULL THEN 
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
			ELSEIF $_RecipeName IS NULL THEN 
				signal SQLSTATE '45000' SET message_text = 'RecipeName is required.';			
			ELSE
				SET $_RecipeID	:= (SELECT IFNULL(MAX(`RecipeID`), 0) + 1 FROM `T_Recipe`);
				SET $_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				
				INSERT INTO `T_Recipe`(
					 `RecipeID`
					,`ProfileID`
					,`ExpertsID`
					,`RestrictionsID`
					,`RecipeName`
					,`Description`
					,`CookingInstruction`
					,`Preparation`
					,`DifficultyLevel`
					,`RecipeImage`
					,`MealType`
					,`VidioUrl`
					,`ReferenceRecipeStatusID`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_RecipeID
					,$_ProfileID
					,$_ExpertID
					,$_RestrictionsID
					,$_RecipeName
					,$_Description
					,$_CookingInstruction
					,$_Preparation
					,$_DifficultyLevel
					,$_RecipeImage
					,$_MealType
					,$_VidioUrl
					,7
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN
				
					SET @_Data = JSON_EXTRACT($JSON,'$.Detail');
					SET @_DataLength = JSON_LENGTH(@_Data);
					SET @row_count = 0;
					SET @i = 0;
					
					WHILE @i < (@_DataLength) DO
					
						SET $_IngredientsID 	= JSON_UNQUOTE(JSON_EXTRACT(@_Data,CONCAT('$[',@i,'].IngredientsID')));
						SET $_Quantity 	= JSON_UNQUOTE(JSON_EXTRACT(@_Data,CONCAT('$[',@i,'].Quantity')));
						SET $_Measurement	= JSON_UNQUOTE(JSON_EXTRACT(@_Data,CONCAT('$[',@i,'].Measurement'))); 
							
						IF $_IngredientsID 	= 'NULL' OR $_IngredientsID  	= '' THEN SET $_IngredientsID 	= NULL; END IF;	
						IF $_Quantity 	= 'NULL' OR $_Quantity  	= '' THEN SET $_Quantity = NULL; END IF;	
						IF $_Measurement 	= 'NULL' OR $_Measurement  	= '' THEN SET $_Measurement 	= NULL; END IF;
						SET @_AvailableQty = (SELECT `QuantityAvailable` FROM `T_Pantry` WHERE `IngredientID` = $_IngredientsID );
					
						IF $_IngredientsID IS NULL THEN
							signal SQLSTATE '45000' SET message_text  	= 'IngredientsID is required.';
						ELSEIF $_Quantity IS NULL THEN
							signal SQLSTATE '45000' SET message_text  	= 'Quantity is required.';
						ELSEIF @_AvailableQty IS NULL THEN
							signal SQLSTATE '45000' SET message_text  	= 'Your available quantity is is not enoughh.';		
						ELSEIF $_Measurement IS NULL THEN
							signal SQLSTATE '45000' SET message_text  	= 'Measurement is required.';				
						ELSE 
							
							SET $_RecipeIngredientsID = (SELECT IFNULL(MAX(RecipeIngredientsID),0) + 1  FROM `T_RecipeIngredients`);
							
							INSERT INTO `T_RecipeIngredients`(
								 `RecipeIngredientsID`
								,`RecipeID`
								,`IngredientsID`
								,`Quantity`
								,`Measurement`
								,`ReferenceRecipeStatusID`
								,`UpdatedByUserLoginID`
							)VALUES(
								 $_RecipeIngredientsID
								,$_RecipeID
								,$_IngredientsID
								,$_Quantity
								,$_Measurement
								,7
								,$_TransactBy 
							);
							IF ROW_COUNT() > 0 THEN
								-- less the quantity of ingredients in pantry
								UPDATE `T_Pantry` 
								SET `QuantityAvailable` = `QuantityAvailable` - $_Quantity
								    ,`DateUpdated` 	= NOW()
								    ,`UpdatedByUserLoginID` = $_TransactBy 
								WHERE `IngredientID` = $_IngredientsID;
								
								IF ROW_COUNT() > 0 THEN
								
									SET @row_count = @row_count + 1;
								ELSE
									SET @i= @_DataLength + 1;
								END IF;
							ELSE
								SET @i= @_DataLength + 1;
							END IF;
								
						END IF;
						SET @i= @i + 1;
					END WHILE;	
					IF @row_count = (@_DataLength) THEN
						IF $_Delimiter = 'SP' THEN -- return para sa SP
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 100;			
						
						ELSE			  -- return para sa model
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 103;			
						END IF;
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No recipe is inserted.';	
					END IF;		
							
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No recipe is inserted.';	
				END IF;
			
			END IF;
			 
		END; -- end of flag 2
		
	    WHEN 3 THEN 
		 BEGIN
			/*
				Author		: Tobey Van Oliver Supangan
				Table Accessed  : 
				Description     : Dashboard Page
				DateCreated     : 11/02/23
				Time 		: 06:34PM
				
				Module used:		
						
				CALL sp_recipe(
					@ReturnIsSuccess		
					,'{
						 "RecipeName": "ap"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "3"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'recipe_3'; 		
			SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));
			
			IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;				
			IF $_RecipeName IS NULL THEN 
				signal SQLSTATE '45000' SET message_text = 'RecipeName is required.';
			
			ELSE
				
				SELECT 
					A.`RecipeImage`
					,A.`RecipeName`
					,A.`MealType`
					,CONCAT(B.`ProfileFirstName`,' ',B.`ProfileLastName`) AS Fullname
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `T_Recipe` A
				INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
				WHERE A.`RecipeName` LIKE IFNULL(CONCAT('%',$_RecipeName,'%'),A.`RecipeName`)
				AND `ReferenceRecipeStatusID` = 7;
				    
			END IF;
		END; -- end of flag 3

		WHEN 4 THEN
		    BEGIN
			DROP TABLE IF EXISTS ingredients;
			CREATE TEMPORARY TABLE ingredients (
			    ingredientsid BIGINT
			);
		    END;

		    SET $_View := 'recipe_4';
		    
		    -- Use $_IngredientsID to store the comma-separated string
		    SET $_IngredientsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON, "$.IngredientsID")));

		    IF $_IngredientsID = 'NULL' OR $_IngredientsID = '' THEN SET $_IngredientsID = NULL; END IF;

		    IF $_IngredientsID IS NOT NULL THEN
			-- Split the $_IngredientsID string into a temporary table
			CREATE TEMPORARY TABLE IF NOT EXISTS temp_ingredients_ids (ingredients_id BIGINT);

			SET @sql = CONCAT('INSERT INTO temp_ingredients_ids (ingredients_id) VALUES (', REPLACE($_IngredientsID, ',', '), ('), ')');
			PREPARE stmt FROM @sql;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;

			-- Select the records based on IngredientsID
			INSERT INTO ingredients (ingredientsid)
			SELECT ingredients_id FROM temp_ingredients_ids;

			-- Clean up the temporary table
			DROP TEMPORARY TABLE IF EXISTS temp_ingredients_ids;
		    ELSE
			SIGNAL SQLSTATE '45000' SET message_text = 'IngredientsID is required.';
		    END IF;

		    IF EXISTS (SELECT ingredientsid FROM ingredients) THEN
			SELECT
			    A.`RecipeImage`
			    ,A.`RecipeName`
			    ,A.`MealType`
			    ,CONCAT(B.`ProfileFirstName`, ' ', B.`ProfileLastName`) AS Fullname
			    ,'1' AS 'IsSuccess'
			    ,'Success' AS 'Result'
			    ,$_View AS 'View'
			FROM `T_Recipe` A
			INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
			INNER JOIN `T_RecipeIngredients` C ON A.`RecipeID` = C.`RecipeID`
			WHERE C.`IngredientsID` IN (SELECT ingredientsid FROM ingredients)
			AND A.`ReferenceRecipeStatusID` = 7;

			SET $_ErrorNumber = 105;
		    ELSE
			SIGNAL SQLSTATE '45000' SET message_text = 'No Record Found.';
		    END IF;
		 END CASE;
		-- end of flag 4
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_RecipeID;
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
				 A.`RecipeID`
				,A.`RecipeName`
				,A.`ExpertsID`
				,A.`ProfileID`
				,A.`Description`
				,A.`CookingInstruction`
				,A.`Preparation`
				,A.`DifficultyLevel`
				,A.`RecipeImage`
				,A.`MealType`
				,A.`VidioUrl`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceRecipeStatusID`		AS 'RecipeStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Recipe` A
				JOIN M_Reference B ON B.ReferenceID = A.`ReferenceRecipeStatusID`
			WHERE
				 A.`RecipeID` = $_RecipeID;	        
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
