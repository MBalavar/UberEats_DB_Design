--Table: RESTAURANT 

INSERT INTO RESTAURANT (RUberID, REmail, Passwd, Mobilenumber, RName, Address, Numlocations, ContractStatus)  

VALUES (1, 'restaurant@example.com', 'password123', '1234567890', 'My Restaurant', '123 Main Street', 3, 'Active'); 

 

--Table: R_WPAYMENT  

INSERT INTO R_WPAYMENT (RPayID, PayDate, Pay, Uberfees, RUberID) VALUES (1, SYSDATE-7, 100.00, 10.00, 1); 

 

--Table: MENU  

INSERT INTO MENU (MenuID, RUberID, Menuname, Descriptions, Menuhour, CategoryName) 

VALUES (1, 1, 'Menu 1', 'Vegeterian Menu', '12pm - 8pm', 'Category Vegeterian'); 

 

--Table: CATEGORIES 

INSERT INTO CATEGORIES (RUberID, CategoryName) VALUES (1, 'Category 1'); 

 

--Table: AVAILABILITY 

INSERT INTO AVAILABILITY (DayofWeek) VALUES ('Monday, Tuesday, Wednesday'); 

 

--Table:CUSTOMISATION  

INSERT INTO CUSTOMISATION (CustomisationID, RUberID, Limit_number, details) 

VALUES (1, 1, 5, 'special sauce'); 

 

--Table: MENUITEMS  

INSERT INTO MENUITEMS (MenuItemName, MenuID, RUberID, Descriptions, Price, Taxrate, DietaryPref, IsAvailable, ImageAvailable, CustomisationID) 

VALUES ('Smashed Avo', 1, 1, 'Smashed Avocado on Toast', 9.99, 0.1, 'Vegan', 'Y', NULL, 1); 

INSERT INTO MENUITEMS (MenuItemName, MenuID, RUberID, Descriptions, Price, Taxrate, DietaryPref, IsAvailable, ImageAvailable, CustomisationID) 

VALUES ('Fried Rice', 1, 1, 'Rice with fried veggies', 10.99, 0.1, 'Vegan', 'Y', NULL, 1);  

--Table: CUSTOMOPTION 

INSERT INTO CUSTOMOPTION (CustName, CustomisationID, Option_Cost, RUberID) VALUES ('GF bread', 1, 2.50, 1); 

 

--Table: CUSTOMER  

INSERT INTO CUSTOMER (UserID, Passwd, first_name, last_name, customer_Language, MobileNumber, Email) 

VALUES (1, 'password456', 'Mo', 'Balavar', 'English', '9876543210', 'customer@example.com'); 

 

--Table: CART 

INSERT INTO CART (CartID, UserID) VALUES (1, 1); 

 

--Table: PAYOPTION 

INSERT INTO PAYOPTION (POptionID, Pay_details, Pay_Type, ExpiryDate, isPrimary, UserID) 

VALUES (1, 'Payment details', 'Credit Card', to_date('2024-01-01', 'YYYY,MM,DD'), 'Y', 1); 

 

--Table: DELADDRESS  

INSERT INTO DELADDRESS (AddID, UserID, Address) 

VALUES (1, 1, '1 Maritime way, Newnham, Launceston, Tasmania, Australia'); 

--Table: STATUS  

INSERT INTO STATUS (StatusID, StatusName) VALUES (1, 'Delivered'); 
INSERT INTO STATUS (StatusID, StatusName) VALUES (3, 'Waiting for Restaurant'');

--Table: ORDERS  

INSERT INTO ORDERS (OrderID, DeliveryOption, paymentMethod, DeliveryAddress, PromoCode, SpecialInstruction,  
Statusid, EstimatedDelTime, IsCancelled, OrderDate, PickupAddress, EstimatedPickupTime, RUberID, POPTIONID, AddID, CartID)  
VALUES (1, 'ASAP', 'Credit Card', '1 Maritime way, Newnham, Launceston', 123, 'Leave at Door',  
1,(timestamp '2023-05-29 15:15:15'), 'N', to_date('2023-05-29','YYYY,MM,DD'), 'Pickup Address 1', (timestamp '2023-05-29 14:15:15'), 1, 1, 1, 1); 

INSERT INTO ORDERS (OrderID, DeliveryOption, paymentMethod, DeliveryAddress, PromoCode, SpecialInstruction,  
Statusid, EstimatedDelTime, IsCancelled, OrderDate, PickupAddress, EstimatedPickupTime, RUberID, POPTIONID, AddID, CartID)  
VALUES (3, 'ASAP', 'Credit Card', '1 Maritime way, Newnham, Launceston', 456, 'Leave at Door',  
3,(timestamp '2023-05-28 15:15:15'), 'N', to_date('2023-05-28','YYYY,MM,DD'), 'Pickup Address 1', (timestamp '2023-05-29 14:15:15'), 1, 1, 1, 1); 




 

--Table: DELIVERYPERSON  

INSERT INTO DELIVERYPERSON (UberDID, first_name, last_name, Email, Phone, 

    Address, IDProof_details, IDProofType, BackgroundCheck, AccountStatus) 

VALUES (1, 'David', 'Pearson', 'delivery@example.com', '1234567890',  

'2 Maritime way, Newnham, Launceston', 'PASSPORT NO:12345678', 'PASSPORT', 'Y', 'Active'); 

 

--Table: D_WPAYMENTD  

INSERT INTO D_WPAYMENTD (PayID, PayDate, Pay, UberDID) VALUES (1, to_date('2023-05-29','YYYY,MM,DD'), 50.00, 1); 

 

--Table: MARKETINGCOMM  

INSERT INTO MARKETINGCOMM (Commid, MC_details, RUberID, UserID) VALUES (1, 'EOFY PROMOTIONS', 1, 1); 

 

 

--Table: AVAILABLE  

INSERT INTO AVAILABLE (RUberID, MenuID, DayofWeek) VALUES (1, 1, 'Monday, Tuesday, Wednesday'); 

 

--Table: SELECTS  

INSERT INTO SELECTS (MenuItemName, MenuID, RUberID, CartID) VALUES ('Smashed Avo', 1, 1, 1); 

 

--Table: SELECTED  

INSERT INTO SELECTED (CartID, CustomisationID, CustName, RUberID, MenuItemName, MenuID) 

VALUES (1, 1, 'GF bread', 1, 'Smashed Avo', 1); 

 



 

--Table: HAS  

INSERT INTO HAS (ORDERID, Statusid, HAS_Date, ByWhom, Comments) 

VALUES (1, 1, to_date('2023-05-29','YYYY,MM,DD'), 'Mo', 'No comment'); 

 

--Table: GETSORDER  

INSERT INTO GETSORDER (UberDID, ORDERID, Action) VALUES (1, 1, 'Accept delivery'); 

 

--Table: CALLS  

INSERT INTO CALLS (UserID, UberDID, call_begin, call_finish) 

VALUES (1, 1, to_timestamp ('2023,05,29 14:14:14', 'YYYY,MM,DD HH24,MI,SS'),to_timestamp ('2023-05-29 14:24:14','YYYY,MM,DD HH24,MI,SS')); 
 

--Table: INCLUDES  

INSERT INTO INCLUDES (ORDERID, ReceiptID) VALUES (1, 1); 
 

--Table: GIVESPROMO  

INSERT INTO GIVESPROMO (ORDERID, PromoCode) VALUES (1, 'Promo 1'); 

 

--Table: RECIPT 

INSERT INTO RECIPT (ReceiptID,MenuCost,DeliveryFee,ServiceFee, Otherfees, Discount) 

VALUES (1,9.99,5.50,1.50,2.00,12.5); 

 
--Table: SCHEDULEDDELIVERY 

INSERT INTO SCHEDULEDDELIVERY( scheduled_id,deliverydate, OrderID) 

VALUES(1, to_timestamp( '2023,06,29 14:14:14', 'YYYY,MM,DD HH24,MI,SS'),1); 

--Table: Feedbacks 

insert into feedbacks(feedbackid,starrating,comments,forwhom,bywhom,OrderID) 

Values(1,4,'The food was great but the delivery took so long, overall happy with service','My Restaurat','Mo Balavar',1); 

insert into feedbacks(feedbackid,starrating,comments,forwhom,bywhom,OrderID) 

Values(2,4,'happy overall','My Restaurat','Mo Balavar',3); 

insert into feedbacks(feedbackid,starrating,comments,forwhom,bywhom,OrderID) 

Values(3,1,'bad service and rude, do not RECOMMEND','My Restaurat','Mo Balavar',3); 


--Table: PROMO 

  insert into promo(promocode,status,Discount,userid)  

  Values(1234,  'Active', 12.5, 1); 