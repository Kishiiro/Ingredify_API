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

/* Procedure structure for procedure `sp_profile` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_profile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_profile`(
           OUT $ReturnIsSuccess	BIGINT  
	  ,$JSON		LONGTEXT 
)
BEGIN
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileFirstName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileMiddleName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileLastName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileExtName		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileBirthdate		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileAddress		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileContactNo		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfilePic			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileEmail			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferenceGenderID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Username			VARCHAR(100) DEFAULT NULL;
	DECLARE $_Password			VARCHAR(200) DEFAULT NULL;
	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimeter 	  	  	VARCHAR(50)  DEFAULT NULL;
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
	SET $_Delimeter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimeter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimeter	  	    	= 'NULL' OR $_Delimeter   	      = '' THEN SET $_Delimeter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/
		
	CASE $_Flag														
	     WHEN 1 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : EXPERTS SIGN UP
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						 "FirstName": "Jundel"
						,"MiddleName": ""
						,"LastName": "Zoilo"
						,"ExtName": ""
						,"Birthdate": "1981-07-09"
						,"GenderID": "4"
						,"Address": "Santiago San Francisco"
						,"ContactNo": "09989129540"
						,"Pic": ""
						,"Email": "zarnalen@gmail.com"
						,"Password": "arna-arna"
						,"TransactBy": "2" 
						,"Flag":"2"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_1';	
			SET $_ProfileFirstName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.FirstName")));
			SET $_ProfileMiddleName		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MiddleName")));			
			SET $_ProfileLastName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LastName")));			
			SET $_ProfileExtName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExtName")));			
			SET $_ProfileBirthdate 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Birthdate")));
			SET $_ReferenceGenderID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.GenderID")));
			SET $_ProfileAddress 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Address")));	
			SET $_ProfileContactNo 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ContactNo")));
			SET $_ProfilePic 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Pic")));
			SET $_ProfileEmail 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Email")));		
			SET $_Password 			:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Password")));	
			SET @_LicenseType 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseType")));	
			SET @_Certificates 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Certificates")));			
			
			IF $_ProfileFirstName 		= 'NULL' OR $_ProfileFirstName		= '' THEN SET $_ProfileFirstName    	:= NULL; END IF;			
			IF $_ProfileMiddleName 		= 'NULL' OR $_ProfileMiddleName		= '' THEN SET $_ProfileMiddleName     	:= NULL; END IF;
			IF $_ProfileLastName 		= 'NULL' OR $_ProfileLastName		= '' THEN SET $_ProfileLastName     	:= NULL; END IF;
			IF $_ProfileExtName 		= 'NULL' OR $_ProfileExtName		= '' THEN SET $_ProfileExtName     	:= NULL; END IF;									
			IF $_ProfileBirthdate 		= 'NULL' OR $_ProfileBirthdate		= '' THEN SET $_ProfileBirthdate    	:= NULL; END IF;
			IF $_ReferenceGenderID 		= 'NULL' OR $_ReferenceGenderID		= '' THEN SET $_ReferenceGenderID   	:= NULL; END IF;			
			IF $_Password 			= 'NULL' OR $_Password			= '' THEN SET $_Password 		:= NULL; END IF;				
			IF $_ProfileAddress		= 'NULL' OR $_ProfileAddress		= '' THEN SET $_ProfileAddress 		:= NULL; END IF;				
			IF $_ProfileContactNo		= 'NULL' OR $_ProfileContactNo		= '' THEN SET $_ProfileContactNo 	:= NULL; END IF;				
			IF $_ProfilePic			= 'NULL' OR $_ProfilePic		= '' THEN SET $_ProfilePic 		:= NULL; END IF;				
			IF $_ProfileEmail		= 'NULL' OR $_ProfileEmail		= '' THEN SET $_ProfileEmail 		:= NULL; END IF;		
			IF @_LicenseType 		IS NULL OR @_LicenseType		= '' THEN SET @_LicenseType  		:= 'NULL'; END IF;	
			IF @_Certificates 		IS NULL OR @_Certificates		= '' THEN SET @_Certificates  		:= 'NULL'; END IF;									
		
			IF EXISTS(
				SELECT ProfileID
				FROM M_Profile 
				WHERE 
					ProfileFirstName = $_ProfileFirstName 
					AND ProfileLastName = $_ProfileLastName 
					AND ProfileBirthdate = $_ProfileBirthdate
			) THEN
				SET $_ProfileID = (
					SELECT ProfileID
					FROM M_Profile 
					WHERE 
						ProfileFirstName = $_ProfileFirstName 
						AND ProfileLastName = $_ProfileLastName 
						AND ProfileBirthdate = $_ProfileBirthdate 		
				);
				SET $_ErrorMsg    := 'Profile already exist';
				IF $_Delimeter = 'SP' THEN 
				      SET $_ErrorNumber := 100;        -- return  para sa SP
				ELSE						
				      SET $_ErrorNumber := 106;						
				END IF;			
			ELSE	
				IF $_ProfileFirstName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'FirstName is required.';	
				ELSEIF $_ProfileLastName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'LastName is required.';					
				ELSEIF $_ProfileBirthdate IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Birthdate is required.';	
				ELSEIF $_ProfileEmail IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Email is required.';	
				ELSEIF $_Password IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Password is required.';	
				ELSEIF $_TransactBy IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';					
				ELSE 
				
					SET $_ProfileID  := (SELECT IFNULL(MAX(`ProfileID`), 0) + 1 FROM `M_Profile`);
					
					SET $_Username := $_ProfileEmail;
					
					INSERT INTO `M_Profile`(
						 `ProfileID`
						,`ProfileFirstName`
						,`ProfileMiddleName`
						,`ProfileLastName`
						,`ProfileExtName`
						,`ProfileBirthdate`
						,`ReferenceGenderID`
						,`ProfileAddress`
						,`ProfileContactNo`
						,`ProfilePic`
						,`ProfileEmail`
						,`AddedbyUserLogInID`
					) VALUES (
						 $_ProfileID
						,$_ProfileFirstName
						,$_ProfileMiddleName
						,$_ProfileLastName
						,$_ProfileExtName
						,$_ProfileBirthdate
						,$_ReferenceGenderID
						,$_ProfileAddress
						,$_ProfileContactNo
						,$_ProfilePic
						,$_ProfileEmail						
						,$_TransactBy
					);	
					
					IF ROW_COUNT() > 0 THEN
						-- insert license
						SET @_DelimiterData := CONCAT('{
										 "LicenseType": "',@_LicenseType,'"
										,"Certificates": "',@_Certificates,'"
										,"Delimiter": "SP"						
										,"TransactBy": "1"						
										,"Flag": "1"
									    }');
						CALL sp_license(
									   @LicenseID		
									  ,@_DelimiterData 	
						);
						IF @LicenseID	 != 0 THEN
							-- insert experts
							SET @_DelimiterData := CONCAT('{
											 "ProfileID": "',$_ProfileID,'"
											,"LicenseID": "',@LicenseID,'"
											,"Delimiter": "SP"						
											,"TransactBy": "1"						
											,"Flag": "1"
										    }');
							CALL sp_experts(
										   @ExpertsID		
										  ,@_DelimiterData 	
							);	
							IF IFNULL(@ExpertsID,0)	 != 0 THEN
								SET @_DelimiterData := CONCAT('{
												 "UserLoginPassword": "',$_Password,'"
												,"ProfileID": "',$_ProfileID,'"		
												,"UserName": "',$_Username,'"	
												,"Delimiter": "SP"						
												,"TransactBy": "1"						
												,"Flag": "2"
											    }');
								CALL sp_userlogin(
											   @UserLoginID		
											  ,@_DelimiterData 	
								);
								IF @UserLoginID	 != 0 THEN
									SET @_UserGroupID =( 
												SELECT 
													`UserGroupID` 
												FROM `M_UserGroup`
												WHERE  `UserGroupCode` = 'EXP'
											);
									
									SET @_DelimiterData := CONCAT('{
													 "EffectiveDate": "',DATE(NOW()),'"
													,"UserGroupID": "',@_UserGroupID,'"
													,"UserLoginID": "',@UserLoginID,'"
													,"Delimiter": "SP"						
													,"TransactBy": "',$_TransactBy	,'"						
													,"Flag": "1"
												    }');
									CALL sp_usergroupmember(
												   @UserGroupMemberID		
												  ,@_DelimiterData 	
									);
									IF @UserGroupMemberID != 0 THEN
										SET $_ErrorMsg    := 'Success on insert.';
										IF $_Delimeter = 'SP' THEN 
										      SET $_ErrorNumber := 100;        -- return  para sa SP
										ELSE						
										      SET $_ErrorNumber := 103;						
										END IF;						
									ELSE
										signal SQLSTATE '45000' SET message_text = 'Error on sp_usergroupmember insert';
									END IF;									
								ELSE
									signal SQLSTATE '45000' SET message_text = 'Error on userlogin insert';		
								END IF;
							ELSE
								signal SQLSTATE '45000' SET message_text = 'Error on Experts insert'; 
							END IF;
						ELSE 
							signal SQLSTATE '45000' SET message_text = 'Error on License insert'; 
						END IF;				
					ELSE
						signal SQLSTATE '45000' SET message_text = 'Error on profile insert';     						
					END IF;	
					
				END IF;
			END IF;				
		END; -- end of flag 1		
	     WHEN 2 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : CHEFFIES SIGN UP
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						 "FirstName": "Jundel"
						,"MiddleName": ""
						,"LastName": "Zoilo"
						,"ExtName": ""
						,"Birthdate": "1981-07-09"
						,"GenderID": "4"
						,"Address": "Santiago San Francisco"
						,"ContactNo": "09989129540"
						,"Pic": ""
						,"Email": "zarnalen@gmail.com"
						,"Password": "arna-arna"
						,"TransactBy": "2" 
						,"Flag":"2"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_2';	
			SET $_ProfileFirstName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.FirstName")));
			SET $_ProfileMiddleName		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MiddleName")));			
			SET $_ProfileLastName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LastName")));			
			SET $_ProfileExtName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExtName")));			
			SET $_ProfileBirthdate 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Birthdate")));
			SET $_ReferenceGenderID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.GenderID")));
			SET $_ProfileAddress 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Address")));	
			SET $_ProfileContactNo 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ContactNo")));
			SET $_ProfilePic 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Pic")));
			SET $_ProfileEmail 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Email")));		
			SET $_Password 			:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Password")));	
			SET @_ReligionType 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReligionType")));			
			
			IF $_ProfileFirstName 		= 'NULL' OR $_ProfileFirstName		= '' THEN SET $_ProfileFirstName    	:= NULL; END IF;			
			IF $_ProfileMiddleName 		= 'NULL' OR $_ProfileMiddleName		= '' THEN SET $_ProfileMiddleName     	:= NULL; END IF;
			IF $_ProfileLastName 		= 'NULL' OR $_ProfileLastName		= '' THEN SET $_ProfileLastName     	:= NULL; END IF;
			IF $_ProfileExtName 		= 'NULL' OR $_ProfileExtName		= '' THEN SET $_ProfileExtName     	:= NULL; END IF;									
			IF $_ProfileBirthdate 		= 'NULL' OR $_ProfileBirthdate		= '' THEN SET $_ProfileBirthdate    	:= NULL; END IF;
			IF $_ReferenceGenderID 		= 'NULL' OR $_ReferenceGenderID		= '' THEN SET $_ReferenceGenderID   	:= NULL; END IF;			
			IF $_Password 			= 'NULL' OR $_Password			= '' THEN SET $_Password 		:= NULL; END IF;				
			IF $_ProfileAddress		= 'NULL' OR $_ProfileAddress		= '' THEN SET $_ProfileAddress 		:= NULL; END IF;				
			IF $_ProfileContactNo		= 'NULL' OR $_ProfileContactNo		= '' THEN SET $_ProfileContactNo 	:= NULL; END IF;				
			IF $_ProfilePic			= 'NULL' OR $_ProfilePic		= '' THEN SET $_ProfilePic 		:= NULL; END IF;				
			IF $_ProfileEmail		= 'NULL' OR $_ProfileEmail		= '' THEN SET $_ProfileEmail 		:= NULL; END IF;		
			IF @_ReligionType 		IS NULL OR @_ReligionType		= '' THEN SET @_ReligionType  		:= 'NULL'; END IF;	
			
			IF EXISTS(
				SELECT ProfileID
				FROM M_Profile 
				WHERE 
					ProfileFirstName = $_ProfileFirstName 
					AND ProfileLastName = $_ProfileLastName 
					AND ProfileBirthdate = $_ProfileBirthdate
			) THEN
				SET $_ProfileID = (
					SELECT ProfileID
					FROM M_Profile 
					WHERE 
						ProfileFirstName = $_ProfileFirstName 
						AND ProfileLastName = $_ProfileLastName 
						AND ProfileBirthdate = $_ProfileBirthdate 		
				);
				SET $_ErrorMsg    := 'Profile already exist';
				IF $_Delimeter = 'SP' THEN 
				      SET $_ErrorNumber := 100;        -- return  para sa SP
				ELSE						
				      SET $_ErrorNumber := 106;						
				END IF;			
			ELSE	
				IF $_ProfileFirstName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'FirstName is required.';	
				ELSEIF $_ProfileLastName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'LastName is required.';					
				ELSEIF $_ProfileBirthdate IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Birthdate is required.';	
				ELSEIF $_ProfileEmail IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Email is required.';	
				ELSEIF $_Password IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Password is required.';	
			        ELSEIF $_TransactBy IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';			
				ELSE 
				
					SET $_ProfileID  := (SELECT IFNULL(MAX(`ProfileID`), 0) + 1 FROM `M_Profile`);
					
					SET $_Username := $_ProfileEmail;
					
					INSERT INTO `M_Profile`(
						 `ProfileID`
						,`ProfileFirstName`
						,`ProfileMiddleName`
						,`ProfileLastName`
						,`ProfileExtName`
						,`ProfileBirthdate`
						,`ReferenceGenderID`
						,`ProfileAddress`
						,`ProfileContactNo`
						,`ProfilePic`
						,`ProfileEmail`
						,`AddedbyUserLogInID`
					) VALUES (
						 $_ProfileID
						,$_ProfileFirstName
						,$_ProfileMiddleName
						,$_ProfileLastName
						,$_ProfileExtName
						,$_ProfileBirthdate
						,$_ReferenceGenderID
						,$_ProfileAddress
						,$_ProfileContactNo
						,$_ProfilePic
						,$_ProfileEmail						
						,$_TransactBy
					);	
					
					IF ROW_COUNT() > 0 THEN
						-- insert license
						SET @_DelimiterData := CONCAT('{
										 "ReligionType": "',@_ReligionType,'"
										,"Delimiter": "SP"						
										,"TransactBy": "1"						
										,"Flag": "1"
									    }');
						CALL sp_religion(
									   @ReligionID		
									  ,@_DelimiterData 	
						);
						
						
						IF @ReligionID	 != 0 THEN
							-- insert userlogin
							SET @_DelimiterData := CONCAT('{
											 "UserLoginPassword": "',$_Password,'"
											,"ProfileID": "',$_ProfileID,'"		
											,"UserName": "',$_Username,'"	
											,"Delimiter": "SP"						
											,"TransactBy": "1"						
											,"Flag": "2"
										    }');
							CALL sp_userlogin(
										   @UserLoginID		
										  ,@_DelimiterData 	
							);
							IF @UserLoginID	 != 0 THEN
								SET @_UserGroupID =( 
											SELECT 
												`UserGroupID` 
											FROM `M_UserGroup`
											WHERE  `UserGroupCode` = 'CHF'
										);
								
								SET @_DelimiterData := CONCAT('{
												 "EffectiveDate": "',DATE(NOW()),'"
												,"UserGroupID": "',@_UserGroupID,'"
												,"UserLoginID": "',@UserLoginID,'"
												,"Delimiter": "SP"						
												,"TransactBy": "',$_TransactBy	,'"					
												,"Flag": "1"
											    }');
								CALL sp_usergroupmember(
											   @UserGroupMemberID		
											  ,@_DelimiterData 	
								);
								IF @UserGroupMemberID != 0 THEN
									SET $_ErrorMsg    := 'Success on insert.';
									IF $_Delimeter = 'SP' THEN 
									      SET $_ErrorNumber := 100;        -- return  para sa SP
									ELSE						
									      SET $_ErrorNumber := 103;						
									END IF;						
								ELSE
									signal SQLSTATE '45000' SET message_text = 'Error on sp_usergroupmember insert';
								END IF;									
							ELSE
								signal SQLSTATE '45000' SET message_text = 'Error on userlogin insert';		
							END IF;
						ELSE 
							signal SQLSTATE '45000' SET message_text = 'Error on Religion insert'; 
						END IF;				
					ELSE
						signal SQLSTATE '45000' SET message_text = 'Error on profile insert';     						
					END IF;	
					
				END IF;
			END IF;				
		END; -- end of flag 2	
	     WHEN 3 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : profile settings for cheffies and experts
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						"TransactBy": "2" 
						,"Flag":"3"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_3';	
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'Userlogin is required';	         
			ELSE
				SET @_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				
				IF EXISTS(SELECT `CheffiesID` FROM `M_Cheffies` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					SELECT 
						A.`ProfileID`
						,CONCAT(B.`ProfileFirstName`, B.`ProfileLastName`,' ',IFNULL(B.`ProfileExtName`,'')) AS 'Name'
						,B.`ProfilePic`				AS 'ProfilePic'
						,CASE WHEN D.`SubscriptionID` IS NULL THEN '' ELSE 'Premium' END   AS 'Subscription'
						,C.`UserLoginName`			AS 'UserName'
						,C.`UserLoginPassword`			AS 'Password'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `M_Cheffies` A
					INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
					INNER JOIN `M_UserLogin` C ON A.`ProfileID` = C.`ProfileID`
					LEFT JOIN `T_Subscription` D ON A.`CheffiesID` = D.`CheffiesID` AND D.`ReferenceSubscriptionStatusID` 
					WHERE C.`ProfileID` = @_ProfileID
					AND A.`ReferenceTableStatusID` = 1;
				ELSEIF EXISTS(SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					
					SELECT CONCAT(`ProfileFirstName`,' ',`ProfileLastName`) AS Fullname
						,C.`LicenseType` 			AS Expertise
						,A.`ProfileID`
						,A.`ProfilePic`				AS 'ProfilePic'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `M_Profile` A
					JOIN `MT_Experts` B ON B.`ProfileID` = A.`ProfileID`
					JOIN `M_License` C ON C.`LicenseID` = B.`LicenseID`
					WHERE B.`ReferenceExpertsStatusID` = 6
					AND A.`ProfileID` = @_ProfileID;	 
				ELSE
					signal SQLSTATE '45000' SET message_text = 'Profile does not exist';
				END IF;
			
			END IF;
		END; -- end flag 3
	     WHEN 4 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : Update profile
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						 "FirstName": "Jundel"
						,"MiddleName": ""
						,"LastName": "Zoilo"
						,"ExtName": ""
						,"Birthdate": "1981-07-09"
						,"GenderID": "4"
						,"Address": "Santiago San Francisco"
						,"ContactNo": "09989129540"
						,"Pic": ""
						,"Email": "zarnalen@gmail.com"
						,"Password": "arna-arna"
						,"ProfileID": "arna-arna"
						,"TransactBy": "2" 
						,"Flag":"4"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_4';	
			SET $_ProfileID 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));
			SET $_ProfileFirstName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.FirstName")));
			SET $_ProfileMiddleName		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MiddleName")));			
			SET $_ProfileLastName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LastName")));			
			SET $_ProfileExtName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExtName")));			
			SET $_ProfileBirthdate 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Birthdate")));
			SET $_ReferenceGenderID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.GenderID")));
			SET $_ProfileAddress 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Address")));	
			SET $_ProfileContactNo 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ContactNo")));
			SET $_ProfilePic 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Pic")));
			SET $_ProfileEmail 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Email")));		
			SET $_Password 			:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Password")));	
			SET @_LicenseType 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseType")));	
			SET @_Certificates 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Certificates")));			
			
			IF $_ProfileID 			= 'NULL' OR $_ProfileID			= '' THEN SET $_ProfileID    		:= NULL; END IF;
			IF $_ProfileFirstName 		= 'NULL' OR $_ProfileFirstName		= '' THEN SET $_ProfileFirstName    	:= NULL; END IF;			
			IF $_ProfileMiddleName 		= 'NULL' OR $_ProfileMiddleName		= '' THEN SET $_ProfileMiddleName     	:= NULL; END IF;
			IF $_ProfileLastName 		= 'NULL' OR $_ProfileLastName		= '' THEN SET $_ProfileLastName     	:= NULL; END IF;
			IF $_ProfileExtName 		= 'NULL' OR $_ProfileExtName		= '' THEN SET $_ProfileExtName     	:= NULL; END IF;									
			IF $_ProfileBirthdate 		= 'NULL' OR $_ProfileBirthdate		= '' THEN SET $_ProfileBirthdate    	:= NULL; END IF;
			IF $_ReferenceGenderID 		= 'NULL' OR $_ReferenceGenderID		= '' THEN SET $_ReferenceGenderID   	:= NULL; END IF;			
			IF $_Password 			= 'NULL' OR $_Password			= '' THEN SET $_Password 		:= NULL; END IF;				
			IF $_ProfileAddress		= 'NULL' OR $_ProfileAddress		= '' THEN SET $_ProfileAddress 		:= NULL; END IF;				
			IF $_ProfileContactNo		= 'NULL' OR $_ProfileContactNo		= '' THEN SET $_ProfileContactNo 	:= NULL; END IF;				
			IF $_ProfilePic			= 'NULL' OR $_ProfilePic		= '' THEN SET $_ProfilePic 		:= NULL; END IF;				
			IF $_ProfileEmail		= 'NULL' OR $_ProfileEmail		= '' THEN SET $_ProfileEmail 		:= NULL; END IF;		
			IF @_LicenseType 		IS NULL OR @_LicenseType		= '' THEN SET @_LicenseType  		:= 'NULL'; END IF;	
			IF @_Certificates 		IS NULL OR @_Certificates		= '' THEN SET @_Certificates  		:= 'NULL'; END IF;									
		
			IF $_ProfileID  IS NULL THEN SET $_ProfileID = fn_login($_TransactBy,NULL,NULL,2); END IF;
			IF EXISTS(
				SELECT ProfileID
				FROM M_Profile 
				WHERE 
					ProfileFirstName = $_ProfileFirstName 
					AND ProfileLastName = $_ProfileLastName 
					AND ProfileBirthdate = $_ProfileBirthdate
					AND ProfileID NOT IN ( $_ProfileID)
			) THEN
				SET $_ProfileID = (
					SELECT ProfileID
					FROM M_Profile 
					WHERE 
						ProfileFirstName = $_ProfileFirstName 
						AND ProfileLastName = $_ProfileLastName 
						AND ProfileBirthdate = $_ProfileBirthdate 
						AND ProfileID NOT IN ( $_ProfileID)		
				);
				SET $_ErrorMsg    := 'Profile already exist';
				IF $_Delimeter = 'SP' THEN 
				      SET $_ErrorNumber := 100;        -- return  para sa SP
				ELSE						
				      SET $_ErrorNumber := 106;						
				END IF;			
			ELSE	
				IF $_ProfileFirstName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'FirstName is required.';	
				ELSEIF $_ProfileLastName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'LastName is required.';					
				ELSEIF $_ProfileBirthdate IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Birthdate is required.';
				ELSEIF $_TransactBy IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';					
				ELSE 
				
					UPDATE `M_Profile`
					SET	 `ProfileFirstName` = IFNULL($_ProfileFirstName,ProfileFirstName)
						,`ProfileMiddleName` = $_ProfileMiddleName
						,`ProfileLastName` = IFNULL($_ProfileLastName,ProfileLastName)
						,`ProfileExtName` = $_ProfileExtName
						,`ProfileBirthdate` = IFNULL($_ProfileBirthdate,ProfileBirthdate)
						,`ReferenceGenderID` = IFNULL($_ReferenceGenderID,ReferenceGenderID)
						,`ProfileAddress` = IFNULL($_ProfileAddress,ProfileAddress)
						,`ProfileContactNo` = IFNULL($_ProfileContactNo,ProfileContactNo)
						,`ProfilePic` = IFNULL($_ProfilePic,ProfilePic)
						,`UpdatedbyUserLoginID` = $_TransactBy
						,`DateUpdated` = NOW()
					WHERE ProfileID = $_ProfileID;
					IF ROW_COUNT() > 0 THEN
						SET $_ErrorMsg    := 'Success on Update.';
						IF $_Delimeter = 'SP' THEN 
						      SET $_ErrorNumber := 100;        -- return  para sa SP
						ELSE						
						      SET $_ErrorNumber := 103;						
						END IF;										
					ELSE
						signal SQLSTATE '45000' SET message_text = 'Error on profile update';     						
					END IF;	
					
				END IF;
			END IF;				
		END; -- end of flag 4			
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'Flag is required.';	         
	END CASE;  
	
	/*CATCH PARA SA MGA RETURNS START*/
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_ProfileID;
	     WHEN 101   THEN -- error return for SP
	        SET autocommit         := 3;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      3       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
	        BEGIN
			SET autocommit := 1;
			
			SELECT 
				 `ProfileID`
				,`ProfileFirstName`
				,`ProfileMiddleName`
				,`ProfileLastName`
				,`ProfileExtName`
				,`ProfileBirthdate`
				,`ReferenceGenderID`
				,`ReferenceTableStatusID`					
				,'1' 			AS 'IsSuccess'
				,$_ErrorMsg 		AS 'Result' 
				,$_View 		AS 'View'
			FROM `M_Profile`    
			WHERE
				 `ProfileID` = $_ProfileID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     WHEN 106  THEN
	        BEGIN
			SET autocommit := 1;
			
			SELECT 
				 `ProfileID`
				,`ProfileFirstName`
				,`ProfileMiddleName`
				,`ProfileLastName`
				,`ProfileExtName`
				,`ProfileBirthdate`
				,`ReferenceGenderID`
				,`ReferenceTableStatusID`					
				,2 			AS 'IsSuccess'
				,$_ErrorMsg 		AS 'Result' 
				,$_View 		AS 'View'
			FROM `M_Profile`    
			WHERE
				 `ProfileID` = $_ProfileID;	        
		END;		
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
