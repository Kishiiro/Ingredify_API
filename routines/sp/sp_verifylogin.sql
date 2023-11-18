DELIMITER $$

USE `pantry_8222023_1024pm`$$

DROP PROCEDURE IF EXISTS `sp_verifylogin`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verifylogin`(
           OUT $ReturnIsSuccess		BIGINT  -- For SP Calling
	  ,$JSON			LONGTEXT
)
BEGIN
DECLARE $_UserID 	   		INT DEFAULT 0;
DECLARE $_UserLogIP        		VARCHAR(500) DEFAULT NULL;
DECLARE $_UserLogLocalIP       		VARCHAR(500) DEFAULT NULL;
DECLARE $_UserLogHost        		VARCHAR(500) DEFAULT NULL;
DECLARE $_UserLogin 	 	  	VARCHAR(50) DEFAULT NULL;
DECLARE $_UserPassword 	  	  	VARCHAR(50) DEFAULT NULL;
DECLARE $_Flag 	 	  	  	VARCHAR(50);
DECLARE $_Delimeter 	  	  	VARCHAR(50) DEFAULT NULL;
DECLARE $_DelimiterData		  	LONGTEXT;
DECLARE $_View 	 	  	  	VARCHAR(50);
DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
DECLARE $_ErrorNumber	 	  	INT; 	
DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
  SET @full_error = @text;
  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
  ROLLBACK;
END;
	SET autocommit := 0;
	SET max_sp_recursion_depth := 255;
	
	SET $_Delimeter  := JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimeter"));	
	SET $_Flag 	 := JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag"));	
	
	
	CASE $_Flag
	    WHEN 1 THEN 
		BEGIN
			/*
				Author          : Armando Garing Ii	
				Table Accessed  : 
				Description     : for pos login
				DateCreated     : April 23 2021
				Time 		: 1:00PM
			
				Module Used:
				select fn_login(1,'demo','DYNqwerty',1)
				CALL sp_verifylogin(
							   @ReturnIsSuccess		
							  ,'{
								 "UserLogin": "zunakis@gmail.com"
								,"UserPassword": "DYNqwerty"
								,"UserLogIP": "1.1.1.1"
								,"TransactBy": "1"
								,"Flag": "1"
							    }' 	
				);
				
								
				
			*/
			SET $_View 		:= 'verifylogin_1';
			SET $_UserLogin		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogin")));
			SET $_UserPassword	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserPassword")));
			SET $_UserLogIP   	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogIP")));
			SET $_UserLogHost 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogHost")));
			SET $_UserLogLocalIP 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogLocalIP")));																			
	
			IF $_UserLogin IS NULL OR $_UserLogin = 'NULL' OR $_UserLogin = '' THEN
				signal SQLSTATE '45000' SET message_text = 'Username is required.';	
			ELSEIF $_UserPassword IS NULL OR $_UserPassword = 'NULL' OR $_UserPassword = '' THEN
				signal SQLSTATE '45000' SET message_text = 'Password is required.';					
			ELSE 
				SET @_UserLogin := TRIM($_UserLogin);
				SET @_Password := fn_passwordgenerator(TRIM($_UserPassword));			
				SET $_UserID := (SELECT 
							`UserLoginID` 
						FROM `M_UserLogin` 
						WHERE 
							    UserLoginName     	   = @_UserLogin
							AND UserLoginPassword 	   = @_Password
							AND ReferenceTableStatusID = 1 -- active
							LIMIT 1);
				
				SET @_ProfileID = (SELECT `ProfileID` FROM `M_UserLogin` WHERE `UserLoginID` = $_UserID);
				SET @_ExpertID = (SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID);
				SET @_ExpertStatusID = (SELECT `ReferenceExpertsStatusID` FROM `MT_Experts` WHERE `ExpertsID` = @_ExpertID);
				
				IF @_ExpertID IS NOT NULL AND @_ExpertStatusID = 5 THEN -- verified
					signal SQLSTATE '45000' SET message_text = 'Please wait as our admin is still verifying your certificate.';										
				ELSEIF fn_login($_UserID,$_UserLogin,$_UserPassword,1) = 'Y' THEN
								
					SET autocommit := 1;
					SET @_GroupIDs := (SELECT fn_usergroup($_UserID ,NULL,1));
					
					SELECT
						 
						 `ProfileID`
						,`ProfileFirstName`
						,`ProfileLastName`
						,`ProfileMiddleName`
						,`ProfileExtName`
						,`ProfileBirthdate`
						,`ProfilePic` AS 'ProfilePicUrl'
						,`UserLoginID`
						,`UserLoginName`
						,`ModuleController`
						,'1' 			AS 'IsSuccess'
						,'Success' 		AS 'Result'				
					FROM (
						SELECT  DISTINCT
								 F.`ProfileID`
								,F.`ProfileFirstName`
								,F.`ProfileLastName`
								,F.`ProfileMiddleName`
								,F.`ProfileExtName`
								,F.`ProfileBirthdate`
								,F.`ProfilePic`
								,C.`UserLoginID`	
								,C.`UserLoginName`		
								,I.`ModuleController`
						FROM M_UserRights		A
							JOIN  M_UserLogin 		C ON C.`UserLoginID` 	= A.`UserLoginID`
							JOIN  M_Profile 		F ON F.ProfileID	= C.ProfileID
							JOIN  M_UserModule 		I ON I.`ModuleID`	= A.ModuleID     
						WHERE	
									C.`UserLoginName` 		= @_UserLogin
								AND 	C.`UserLoginPassword`  		= @_Password
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active														
				
							
						UNION ALL
							
						SELECT  DISTINCT
								 F.`ProfileID`
								,F.`ProfileFirstName`
								,F.`ProfileLastName`
								,F.`ProfileMiddleName`
								,F.`ProfileExtName`
								,F.`ProfileBirthdate`
								,F.`ProfilePic`
								,C.`UserLoginID`	
								,C.`UserLoginName`		
								,I.`ModuleController`
				
						FROM M_UserRights			A
							JOIN  M_UserGroup 		G ON G.UserGroupID 		= A.UserGroupID
							JOIN  M_UserGroupMember 	H ON H.UserGroupID		= G.UserGroupID
							JOIN  M_UserLogin 		C ON C.UserLoginID 		= H.`UserLoginID`
							JOIN  M_Profile 		F ON F.ProfileID		= C.ProfileID
							JOIN  M_UserModule 		I ON I.`ModuleID` 		= A.ModuleID AND I.ModuleController IS NOT NULL
						WHERE
								FIND_IN_SET(A.UserGroupID, @_GroupIDs)
								AND	C.`UserLoginName` 		= @_UserLogin
								AND 	C.`UserLoginPassword`  		= @_Password
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	G.`ReferenceTableStatusID` 	= 1 -- active
								AND 	H.`ReferenceTableStatusID` 	= 1 -- active				
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active				
							
					) AS Login LIMIT 1;				
									
				ELSE
					SELECT 
						 '0'		  AS 'IsSuccess'
						,'user not found' AS 'Result';						
				END IF;				
			END IF;
		END; -- end sa $Flag 1			    
	    ELSE
		signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	END CASE; 
	
	
		
 
END$$

DELIMITER ;