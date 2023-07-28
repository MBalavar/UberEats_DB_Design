CREATE OR REPLACE TRIGGER Update_Promo_Delivered
AFTER UPDATE OF Statusname ON STATUS
FOR EACH ROW
DECLARE
BEGIN
   IF :NEW.Statusname = 'Delivered' THEN
      UPDATE PROMO
      SET Status = 'Redeemed'
      WHERE PromoCode IN (SELECT PromoCode FROM ORDERS WHERE Statusid = :NEW.Statusid);
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      RAISE;
END;
/
 
------ TO TRY THE TRIGGER --------
update status set statusname='Delivered';