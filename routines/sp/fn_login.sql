DELIMITER $$

USE `pantry`$$

DROP FUNCTION IF EXISTS `fn_login`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_login`($UserID			BIGINT,	
	$UserLogin		VARCHAR(100),
	$UserPassword		VARCHAR(200),
	$Flag			INT
) RETURNS VARCHAR(500) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
  
  DECLARE $_Result VARCHAR(500);
  
  CASE 
	WHEN $Flag = 1 THEN
             BEGIN
			/*
				Author          : 
				Table Accessed  : 
				Description     : verify login profile
				DateCreated     : 
				Time 		: 8:43 PM
				
				Testing  : 
				select fn_login(1,null,1)
			*/     
			
			SET @_GroupIDs := (SELECT fn_usergroup($UserID ,NULL,1));   
			IF EXISTS(
					SELECT
						 `ProfileID`
					FROM (
						SELECT  DISTINCT
								 F.`ProfileID`
						FROM M_UserRights A
							JOIN  M_UserLogin C ON C.`UserLoginID` 	= A.`UserLoginID`
							JOIN  M_Profile F ON F.ProfileID	= C.ProfileID
							JOIN  M_UserModule I ON I.`ModuleID`	= A.ModuleID     
						WHERE	
									C.`UserLoginName` 		= TRIM($UserLogin)
								AND 	C.`UserLoginPassword`  		= fn_passwordgenerator(TRIM($UserPassword))														
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active				
							
						UNION ALL
							
						SELECT  DISTINCT
								 F.`ProfileID`
						FROM M_UserRights A
							JOIN  M_UserGroup 		G ON G.UserGroupID 		= A.UserGroupID
							JOIN  M_UserGroupMember 	H ON H.UserGroupID		= G.UserGroupID
							JOIN  M_UserLogin 		C ON C.UserLoginID 		= H.`UserLoginID`
							JOIN  M_Profile 		F ON F.ProfileID		= C.ProfileID
							JOIN  M_UserModule 		I ON I.`ModuleID` 		= A.ModuleID AND I.ModuleController IS NOT NULL
						WHERE
								FIND_IN_SET(A.UserGroupID, @_GroupIDs)
								AND	C.`UserLoginName` 		= TRIM($UserLogin)
								AND 	C.`UserLoginPassword`  		= fn_passwordgenerator(TRIM($UserPassword))														
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	G.`ReferenceTableStatusID` 	= 1 -- active
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active				
					) AS Login LIMIT 1			
			) THEN
			   
				SET $_Result := 'Y';
			ELSE
				SET $_Result := 'N';
			END IF;
			
             END; -- end sa flag 1            
 	WHEN $Flag = 2 THEN
             BEGIN
			/*
				Author          : 
				Table Accessed  : 
				Description     : get the profileid
				DateCreated     : 
				Time 		: 8:43 PM
				
				Testing  : 
				select fn_login(1,null,2)
			*/     
		SET $_Result = (SELECT `ProfileID` FROM `M_UserLogin` WHERE `UserLoginID`= $UserID);
			
             END; -- end sa flag 2            
            
  END CASE;
		  	
  RETURN $_Result;
END$$

DELIMITER ;