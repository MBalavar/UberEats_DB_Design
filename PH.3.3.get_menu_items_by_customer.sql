CREATE OR REPLACE PROCEDURE get_menu_items_by_customer(customer_id IN NUMBER) AS

item_details varchar2(255);
BEGIN
  SELECT m.MenuItemName || ' : '|| m.Price into item_details
  FROM cart c
  JOIN SELECTED s ON c.cartID = s.cartID
  JOIN MENUITEMS m ON s.MenuID = m.MenuID AND s.RUberID = m.RUberID
  WHERE c.cartID = customer_id;
 dbms_output.put_line(item_details);
END;
/




---To execute----
execute get_menu_items_by_customer(1);