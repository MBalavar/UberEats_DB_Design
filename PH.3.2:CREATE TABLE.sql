CREATE TABLE RESTAURANT (    
    RUberID INTEGER NOT NULL, 
    REmail VARCHAR(80) NOT NULL, 
    Passwd VARCHAR(255) NOT NULL, 
    Mobilenumber VARCHAR(20) NOT NULL, 
    RName VARCHAR(255) NOT NULL, 
    Address VARCHAR(255) NOT NULL,  
    Numlocations INTEGER NOT NULL, 
    ContractStatus VARCHAR(20) NOT NULL,
    Constraint  R_prime PRIMARY KEY (RUberID)  
);    

  

CREATE TABLE R_WPAYMENT (
    RPayID INTEGER NOT NULL,
    PayDate DATE NOT NULL, 
    Pay DECIMAL(10,2) NOT NULL, 
    Uberfees DECIMAL(10,2) NOT NULL, 
    RUberID INTEGER NOT NULL,
    Constraint R_WPAYMENT_Prime PRIMARY KEY (RPayID), 
    Constraint  R_Foreign FOREIGN KEY (RUberID) REFERENCES RESTAURANT(RUberID)    

);    

  

CREATE TABLE MENU ( 
    MenuID INTEGER NOT NULL,  
    RUberID INTEGER NOT NULL,  
    Menuname VARCHAR2(255) NOT NULL, 
    Descriptions VARCHAR2(255) NOT NULL, 
    Menuhour VARCHAR(30) NOT NULL,
    CategoryName VARCHAR2(255) NOT NULL, 
    Constraint Menu_Prime PRIMARY KEY (MenuID, RUberID), 
    Constraint Menu_R_Foreign FOREIGN KEY (RUberID) REFERENCES RESTAURANT(RUberID)   

);  


CREATE TABLE CATEGORIES (
    RUberID INTEGER NOT NULL,
    CategoryName VARCHAR(255) NOT NULL, 
    Constraint Categories_Prime PRIMARY KEY (RUberID, CategoryName),
    Constraint CATEGORIES_R_Foreign FOREIGN KEY (RUberID) REFERENCES RESTAURANT(RUberID)    

);    

  

CREATE TABLE AVAILABILITY (
    DayofWeek VARCHAR(255) NOT NULL,
    Constraint Availability_Prime PRIMARY KEY (DayofWeek) 
);    

  

CREATE TABLE CUSTOMISATION ( 
    CustomisationID INTEGER NOT NULL,     
    RUberID INTEGER NOT NULL,  
    Limit_number INTEGER NOT NULL,  
    details VARCHAR2(255) NOT NULL, 
    Constraint Customisation_Prime PRIMARY KEY (CustomisationID,RUberID), 
    Constraint CUSTOMISATION_R_Foreign FOREIGN KEY (RUberID) REFERENCES RESTAURANT(RUberID)    
);     

  

CREATE TABLE MENUITEMS ( 
    MenuItemName VARCHAR2(255) NOT NULL, 
    MenuID INTEGER NOT NULL, 
    RUberID INTEGER NOT NULL,
    Descriptions LONG NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Taxrate DECIMAL(5,2) NOT NULL,  
    DietaryPref VARCHAR2(255), 
    IsAvailable CHAR(1) NOT NULL, 
    ImageAvailable BLOB, 
    CustomisationID INTEGER NOT NULL,
    Constraint MenuItem_Prime PRIMARY KEY (MenuItemName, MenuID, RUberID), 
    Constraint MENUITEMS_M_Foreign FOREIGN KEY (MenuID, RUberID) REFERENCES MENU(MenuID,RUberID),
    Constraint MENUITEMS_C_Foreign FOREIGN KEY (CustomisationID, RUberID) REFERENCES CUSTOMISATION(CustomisationID, RUberID)    

);    

  

CREATE TABLE CUSTOMOPTION ( 
    CustName VARCHAR(255) NOT NULL, 
    CustomisationID INTEGER NOT NULL, 
    Option_Cost DECIMAL(10,2) NOT NULL,
    RUberID INTEGER NOT NULL, 
    Constraint CustomOption_Prime PRIMARY KEY (CustName, CustomisationID),
    Constraint CUSTOMOPTION_C_Foreign FOREIGN KEY (CustomisationID, RUberID) REFERENCES CUSTOMISATION(CustomisationID, RUberID) 

);    

  

CREATE TABLE CUSTOMER ( 
    UserID INTEGER NOT NULL,  
    Passwd VARCHAR2(255),  
    first_name VARCHAR2(100),  
    last_name VARCHAR2(100),  
    customer_Language VARCHAR2(50), 
    MobileNumber VARCHAR2(20), 
    Email VARCHAR2(255),  
    constraint Customer_prime PRIMARY KEY (UserID)    

);    

  

CREATE TABLE CART (
    CartID INTEGER NOT NULL, 
    UserID INTEGER NOT NULL,
    Constraint Cart_Prime PRIMARY KEY (CartID), 
    Constraint CART_U_Foreign FOREIGN KEY (UserID) REFERENCES CUSTOMER(UserID)    

);    

  

CREATE TABLE PAYOPTION (  
    POptionID INTEGER NOT NULL, 
    Pay_details VARCHAR2(255), 
    Pay_Type VARCHAR2(50), 
    ExpiryDate DATE,
    isPrimary CHAR(1), 
    UserID INTEGER, 
    Constraint PayOption_prime primary key (POptionID), 
    Constraint PAYOPTION_C_foreign FOREIGN KEY (UserID) REFERENCES CUSTOMER(UserID)    

);    

  

create table DELADDRESS (  
    AddID INTEGER not null, 
    UserID INTEGER NOT NULL,
    Address Varchar2(255) not null,
    constraint DelAddress_prime primary key (AddID), 
    Constraint DelAddress_C_foreign foreign key (UserID) REFERENCES CUSTOMER(UserID)   

);   

CREATE TABLE STATUS (    
    StatusID INTEGER NOT NULL,    
    StatusName VARCHAR2(50),    
    CONSTRAINT STATUS_Prime primary key (StatusID)    

    );  

CREATE TABLE ORDERS ( 
   OrderID INTEGER NOT NULL,  
   DeliveryOption VARCHAR2(255) NOT NULL, 
   paymentMethod VARCHAR2(255) NOT NULL, 
   DeliveryAddress VARCHAR2(255) NOT NULL, 
   PromoCode VARCHAR2(255), 
   SpecialInstruction VARCHAR2(255),    
   StatusID NUMBER(22) NOT NULL, 
   EstimatedDelTime TIMESTAMP NOT NULL,  
   IsCancelled CHAR(1),  
   OrderDate DATE NOT NULL, 
   PickupAddress VARCHAR2(255) NOT NULL,
   EstimatedPickupTime TIMESTAMP NOT NULL, 
   RUberID INTEGER NOT NULL, 
   POPTIONID INTEGER NOT NULL,
   AddID INTEGER NOT NULL, 
   CartID INTEGER NOT NULL,
   Constraint Order_Prime PRIMARY KEY (OrderID),
   Constraint ORDERS_R_Foreign FOREIGN KEY (RUberID) REFERENCES RESTAURANT(RUberID), 
   Constraint ORDERS_P_Foreign FOREIGN KEY (POptionID) REFERENCES PAYOPTION(POptionID),    
   Constraint ORDERS_D_Foreign FOREIGN KEY (AddID) REFERENCES DELADDRESS(AddID),    
   Constraint ORDERS_C_Foreign FOREIGN KEY (CartID) REFERENCES CART(CartID),    
    Constraint ORDERS_S_Foreign FOREIGN KEY (StatusID) REFERENCES status(StatusID)
);    

  

CREATE TABLE DELIVERYPERSON (    
    UberDID INTEGER NOT NULL,  
    first_name VARCHAR2(100), 
    last_name VARCHAR2(100),    
    Email VARCHAR2(255) NOT NULL, 
    Phone VARCHAR2(20) NOT NULL,  
    Address VARCHAR2(255), 
    IDProof_details VARCHAR2(255) , 
    IDProofType VARCHAR2(50) NOT NULL,
    BackgroundCheck CHAR(1) NOT NULL, 
    AccountStatus VARCHAR2(50), 
    CONSTRAINT DeliveryPerson_prime PRIMARY KEY (UberDID)    

);    

  

CREATE TABLE D_WPAYMENTD ( 
    PayID INTEGER NOT NULL, 
    PayDate DATE NOT NULL, 
    Pay DECIMAL(10,2),
    UberDID INTEGER NOT NULL, 
    constraint d_Payment_prime primary key (PayID), 
    constraint D_WPAYMENTD_D_foreign FOREIGN KEY (UberDID) REFERENCES DELIVERYPERSON(UberDID)    
);    

  

CREATE TABLE MARKETINGCOMM (
    Commid INTEGER not null, 
    MC_details VARCHAR2(255), 
    RUberID INTEGER, 
    UserID INTEGER, 
    constraint MarkettingComm_prime primary key (Commid),
    constraint MARKETINGCOMM_R_foreig FOREIGN KEY (RUberID) REFERENCES RESTAURANT(RUberID), 
    constraint MARKETINGCOMM_C_foreign FOREIGN KEY  (UserID) REFERENCES CUSTOMER(UserID)    

);    

  

CREATE TABLE AVAILABLE ( 
    RUberID INTEGER NOT NULL,
    MenuID INTEGER NOT NULL, 
    DayofWeek VARCHAR2(255) NOT NULL, 
    constraint Availavbe_prime  PRIMARY KEY (RUberID, MenuID, DayofWeek),
    constraint Menu_foreign FOREIGN KEY (RUberID, MenuID) REFERENCES MENU(RUberID, MenuID), 
    constraint Availability_foreign FOREIGN KEY (DayofWeek) REFERENCES AVAILABILITY(DayofWeek)
);    

  

CREATE TABLE SELECTS (    
    MenuItemName VARCHAR2(100) NOT NULL,    
    MenuID INTEGER NOT NULL,    
    RUberID INTEGER NOT NULL,    
     CartID INTEGER NOT NULL,   
    constraint selects_prime PRIMARY KEY (MenuItemName, MenuID, RUberID, CartID), 
    constraint SELECTS_M_foreign FOREIGN KEY (MenuItemName, MenuID, RUberID) REFERENCES MENUITEMS(MenuItemName, MenuID, RUberID), 
    constraint SELECTS_C_foreign FOREIGN KEY (CartID) REFERENCES CART(CartID)    

);    

  

CREATE TABLE SELECTED (    
    CartID INTEGER NOT NULL,    
    CustomisationID INTEGER NOT NULL,    
    CustName VARCHAR2(255) NOT NULL,    
    RUberID INTEGER NOT NULL,    
    MenuItemName VARCHAR2(100),    
    MenuID INTEGER,    
    constraint selected_prime PRIMARY KEY (CartID, CustomisationID, CustName),    
    constraint SELECTED_CA_foreign FOREIGN KEY (CartID) REFERENCES CART(CartID),    
    constraint SELECTED_CU_foreign  FOREIGN KEY (CustomisationID, CustName) REFERENCES CUSTOMOPTION(CustomisationID, CustName),    
    constraint SELECTED_M_foreign FOREIGN KEY (MenuItemName, MenuID, RUberID) REFERENCES MENUITEMS (MenuItemName, MenuID, RUberID)   

);    

  

  

  

CREATE TABLE HAS (    
    OrderID INTEGER NOT NULL,    
    Statusid INTEGER NOT NULL,    
    HAS_Date DATE,    
    ByWhom VARCHAR2(100),    
    Comments VARCHAR2(255),    
    constraint HAS_prime PRIMARY KEY (OrderID, Statusid),    
    constraint HAS_O_foreign FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),    
    constraint HAS_S_foreign FOREIGN KEY (Statusid) REFERENCES STATUS(Statusid)    

);    

  

CREATE TABLE GETSORDER (    
    UberDID INTEGER NOT NULL,    
    ORDERID INTEGER NOT NULL,    
    Action VARCHAR2(50),    
    constraint GetsOrder_prime PRIMARY KEY (UberDID, ORDERID),  
    constraint DeliveryPerson_foreign FOREIGN KEY (UberDID) REFERENCES DELIVERYPERSON(UberDID),    
    constraint Ordersforeign FOREIGN KEY (ORDERID) REFERENCES ORDERS(ORDERID)    

);    

  

CREATE TABLE CALLS (    
    UserID INTEGER NOT NULL,    
    UberDID INTEGER NOT NULL,    
    call_begin timestamp,    
    call_finish timestamp, 
    constraint Calls_prime PRIMARY KEY (UserID, UberDID),   
    constraint CALLS_C_foreign FOREIGN KEY (UserID) REFERENCES CUSTOMER(UserID),    
    constraint CALLS_D_foreign FOREIGN KEY (UberDID) REFERENCES DELIVERYPERSON(UberDID)    

);    

  

CREATE TABLE INCLUDES(    
    OrderID INTEGER NOT NULL,    
    ReceiptID INTEGER NOT NULL,  
    constraint Includes_prime PRIMARY KEY (ORDERID, ReceiptID),    
    constraint Includes_O_foreign FOREIGN KEY (OrderID ) REFERENCES ORDERS(OrderID )    


);    

  

CREATE TABLE GIVESPROMO (    
    OrderID  INTEGER NOT NULL,    
    PromoCode VARCHAR2(50) NOT NULL,    
    constraint GivesPromo_prime PRIMARY KEY (OrderID , PromoCode),    
    constraint GIVESPROMO_O_prime FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)    

);   

  

create table RECIPT (   
    ReceiptID INTEGER NOT NULL,   
    MenuCost DECIMAL(10,2) NOT NULL,   
    DeliveryFee DECIMAL(10,2) NOT NULL,   
    ServiceFee DECIMAL(10,2) NOT NULL,   
    Otherfees DECIMAL(10,2) NOT NULL,   
    Discount DECIMAL(5,2) NOT NULL,   
    constraint RECIPT_prime primary key (ReceiptID)   


    );   

  

create table SCHEDULEDDELIVERY(   
    SCHEDULED_Id INTEGER NOT NULL,   
    DeliveryDate TIMESTAMP NOT NULL,   
    OrderID INTEGER NOT NULL,   
    constraint SCHEDULEDDELIVERY_prime primary key (SCHEDULED_Id),  
    constraint SCHEDULEDDELIVERY_O_foreign foreign key (OrderID) references ORDERS(OrderID)   

    );   

  

create table FEEDBACKS (   
    FeedbackID INTEGER NOT NULL,   
    StarRating INTEGER NOT NULL,   
    Comments LONG ,   
    ForWhom Varchar2(255),   
    ByWhom Varchar2(255),   
    OrderID INTEGER NOT NULL,   
    constraint FEEDBACKS_prime primary key (FeedbackID),   
    constraint FEEDBACKS_O_foreign foreign key (OrderID) references ORDERS (OrderID)   
 
    );       

  

create table PROMO (   
    PromoCode INTEGER NOT NULL,   
    Status  VARCHAR2(50) NOT NULL,   
    Discount DECIMAL(5,2) NOT NULL,   
    UserID INTEGER NOT NULL,   
    constraint PROMO_prime primary key (PromoCode),     
    constraint PROMO_C_foreign FOREIGN key (UserID) references Customer(UserID)   

    );   

     