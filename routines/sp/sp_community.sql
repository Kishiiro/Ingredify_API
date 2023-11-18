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

/* Procedure structure for procedure `sp_community` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_community` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_community`(
	  OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_CommunityID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_CheffiesID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ExpertsID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_Content			VARCHAR(100) DEFAULT NULL;
	DECLARE $_ContentImage			VARCHAR(100) DEFAULT NULL;
	DECLARE $_RecipeName			VARCHAR(100) DEFAULT NULL;
		
	
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
						
				CALL sp_community(
					@ReturnIsSuccess		
					,'{
						 "CommunityID": "1"	
						,"CheffiesID": "1"
						,"ExpertsID": ""
						,"Content": ""
						,"ContentImage": ""
						,"ReferenceTableStatusID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'community_1'; 		
			-- SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
			
			-- IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID := NULL; END IF;			
			
			 SELECT 
				`CommunityID`
				,`CheffiesID`
				,`ExpertsID`
				,`Content`
				,`ContentImage`
				, `ReferenceTableStatusID` 
			FROM 
				`MT_Community` 
			WHERE 
				`ReferenceTableStatusID` = 1;
			 
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
						
				CALL sp_community(
					@ReturnIsSuccess		
					,'{
						 "RecipeName": "ap"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'community_2'; 		
			SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));
			
			IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;				
			
				
			SELECT 	 A.`RecipeName`
				,A.`Description`
				,A.`RecipeImage`
				,A.`MealType`
				,CONCAT(B.`ProfileFirstName`,' ',`ProfileLastName`) AS Fullname
				,B.`ProfilePic`
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Recipe` A
			INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
			WHERE A.`RecipeName` LIKE IFNULL(CONCAT('%',$_RecipeName,'%'),A.`RecipeName`)
			AND A.`ReferenceRecipeStatusID` = 7;
				    
		
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
						
				CALL sp_community(
					@ReturnIsSuccess		
					,'{
						 "RecipeName": "ap"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'community_3'; 		
			SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));
			
			IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;				
							
			SELECT 	 A.`RecipeName`
				,A.`Description`
				,A.`RecipeImage`
				,A.`MealType`
				,CONCAT(B.`ProfileFirstName`,' ',`ProfileLastName`) AS ExpertsName
				,B.`ProfilePic`
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Recipe` A
			INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
			INNER JOIN `MT_Community` C ON A.RecipeID = C.RecipeID
			WHERE A.`RecipeName` LIKE IFNULL(CONCAT('%',$_RecipeName,'%'),A.`RecipeName`)
			AND A.`ReferenceRecipeStatusID` = 7
			AND C.`ProfileID` = `fn_login`($_TransactBy ,null,null,2);
				    
		END; -- end of flag 3			
	    				
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_CommunityID;
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
				 A.`CommunityID`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `MT_Community` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`CommunityID` = $_CommunityID;	        
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
