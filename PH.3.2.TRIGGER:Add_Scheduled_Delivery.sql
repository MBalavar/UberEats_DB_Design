CREATE OR REPLACE TRIGGER Add_Scheduled_Delivery
AFTER INSERT ON ORDERS
FOR EACH ROW
WHEN (NEW.DeliveryOption = 'Deliver Later')
declare
    n number;
    BEGIN
	select max(SCHEDULED_Id)+1 into n from  SCHEDULEDDELIVERY;
    INSERT INTO SCHEDULEDDELIVERY (SCHEDULED_Id, DeliveryDate,  ORDERID)
   VALUES (n, :NEW.ESTIMATEDDELTIME, :NEW.ORDERID);
END;
/





------ TO TRY THE TRIGGER --------
select * from SCHEDULEDDELIVERY;

delete from orders where orderID=3

INSERT INTO ORDERS (OrderID, DeliveryOption, paymentMethod, DeliveryAddress, PromoCode, SpecialInstruction,  
Statusid, EstimatedDelTime, IsCancelled, OrderDate, PickupAddress, EstimatedPickupTime, RUberID, POPTIONID, AddID, CartID)  
VALUES (4, 'Deliver Later', 'Credit Card', '1 Maritime way, Newnham, Launceston', 456, 'Leave at Door',  
3,(timestamp '2023-05-28 15:15:15'), 'N', to_date('2023-05-28','YYYY,MM,DD'), 'Pickup Address 1', (timestamp '2023-05-29 14:15:15'), 1, 1, 1, 1); 

select * from SCHEDULEDDELIVERY;