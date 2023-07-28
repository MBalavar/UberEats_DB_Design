CREATE OR REPLACE FUNCTION get_delivery_person_details(order_id IN orders.orderid%TYPE) RETURN VARCHAR2 AS
  delivery_person_details VARCHAR2(255);
BEGIN
  SELECT dp.first_name || ' ' || dp.last_name || ', Email: ' || dp.Email || ', Phone: ' || dp.Phone
  INTO delivery_person_details
  FROM GETSORDER go
  JOIN DELIVERYPERSON dp ON go.UberDID = dp.UberDID
  WHERE go.ORDERID = order_id;
  
  RETURN delivery_person_details;
END;
/


set serveroutput on;


-----Execution Block------

DECLARE
v_details varchar2(255);
begin
v_details:= get_delivery_person_details(1);
dbms_output.put_line(v_orderid);
end;
/