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

/* Procedure structure for procedure `sp_payment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_payment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payment`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN 
	DECLARE $_PaymentID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_PaymentTypeID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ExpertsID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_CheffiesID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_PaymentDetail			TEXT  DEFAULT NULL;
	DECLARE $_PaymentDate			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_NotificationID		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferencePaymentStatusID	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReceiptID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_SubscriptionID		VARCHAR(50)  DEFAULT NULL;
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
						
				CALL sp_payment(
					@ReturnIsSuccess		
					,'{
						 "PaymentTypeID": "1"	
						,"CheffiesID": "1"
						,"Delimiter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'payment_1'; 		
			SET $_PaymentTypeID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.PaymentTypeID")));
			SET $_CheffiesID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.CheffiesID")));
			-- SET $_PaymentDetail := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.PaymentDetail")));
			-- SET $_PaymentDate := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.PaymentDate")));
			
			IF $_PaymentTypeID 	= 'NULL' OR $_PaymentTypeID	= '' THEN SET $_PaymentTypeID	:= NULL; END IF;	
			IF $_CheffiesID	= 'NULL' OR $_CheffiesID	= '' THEN SET $_CheffiesID	:= NULL; END IF;	
			-- IF $_PaymentDetail	= 'NULL' OR $_PaymentDetail	= '' THEN SET $_PaymentDetail	:= NULL; END IF;	
			-- IF $_PaymentDate	= 'NULL' OR $_PaymentDate	= '' THEN SET $_PaymentDate	:= NULL; END IF;	
			
			IF $_PaymentTypeID IS NULL  THEN
				signal SQLSTATE '45000' SET message_text = 'PaymentTypeID is required.';												
			ELSEIF $_CheffiesID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'CheffiesID is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_PaymentID		:= (SELECT IFNULL(MAX(`PaymentID`), 0) + 1 FROM `T_Payment`);
				
				INSERT INTO `T_Payment`(
					 `PaymentID`
					,`PaymentTypeID`
					,`CheffiesID`
					,`PaymentDetail`
					,`PaymentDate`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_PaymentID
					,$_PaymentTypeID
					,$_CheffiesID
					,CONCAT('Paid ',DATE_FORMAT(CAST(NOW() AS DATE),'%b %e, %Y') ) -- $_PaymentDetail
					,DATE(now())
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
				
					-- insert recipt
					SET $_ReceiptID		:= (SELECT IFNULL(MAX(`ReceiptID`), 0) + 1 FROM `T_Receipt`);
					
					INSERT INTO `T_Receipt`(
						 `ReceiptID`
						,`PaymentID`
						,`CheffiesID`
						,`ReceiptDetails`
						,`ReceiptDate`
						,`AddedbyUserLoginID`
					)VALUE(
						 $_ReceiptID
						,$_PaymentID
						,$_CheffiesID
						,CONCAT('Paid ',DATE_FORMAT(CAST(NOW() AS DATE),'%b %e, %Y') )
						,DATE(NOW())
						,$_TransactBy	
					);
					IF ROW_COUNT() > 0 THEN 	
						-- insert subscription
						SET $_SubscriptionID	:= (SELECT IFNULL(MAX(`SubscriptionID`), 0) + 1 FROM `T_Subscription`);
					
						INSERT INTO `T_Subscription`(
							 `SubscriptionID`
							,`CheffiesID`
							,`CheffiesName`
							,`PaymentDate`
							,`SubscriptionEndDate`
							,`AddedbyUserLoginID`
						)VALUE(
							 $_SubscriptionID
							,$_CheffiesID
							,`fn_profile`($_CheffiesID,NULL,1)
							,DATE(NOW())
							,DATE_ADD(DATE(NOW()), INTERVAL +1 MONTH)
							,$_TransactBy	
						);
						IF ROW_COUNT() > 0 THEN 
							-- insert notification
							SET $_NotificationID	:= (SELECT IFNULL(MAX(`NotificationID`), 0) + 1 FROM `T_Notification`);
						
							INSERT INTO `T_Notification`(
								 `NotificationID`
								,`ProfileID`
								,`NotificationText`
								,`NotificationDate`
								,`AddedbyUserLoginID`
							)VALUE(
								 $_NotificationID
								,`fn_login`($_TransactBy ,NULL,null,2)
								,'You have paid successfully.'
								,DATE(NOW())
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
								signal SQLSTATE '45000' SET message_text = 'No notification is inserted.';
							END IF;
						ELSE
							signal SQLSTATE '45000' SET message_text = 'No subscription is inserted.';
						END IF;
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No Receipt is inserted.';
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Payments is inserted.';	
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
		SET $ReturnIsSuccess   := $_PaymentID;
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
				 A.`PaymentID`
				,A.`PaymentTypeID`
				,A.`CheffiesID`
				,A.`PaymentDetail`
				,A.`PaymentDate`
				,B.`ReferenceLongDescription` 		AS 'Status'				
				,A.`ReferencePaymentStatusID`		AS 'StatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Payment` A
				JOIN M_Reference B ON B.ReferenceID = A.`ReferencePaymentStatusID`
			WHERE
				 A.`PaymentID` = $_PaymentID;	        
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
