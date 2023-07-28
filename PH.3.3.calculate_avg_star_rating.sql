CREATE OR REPLACE PROCEDURE calculate_avg_star_rating(p_ruberid IN NUMBER) AS
  v_avg_star_rating DECIMAL(5,2);
BEGIN
  SELECT AVG(StarRating)
  INTO v_avg_star_rating
  FROM FEEDBACKS
  WHERE OrderID IN (
    SELECT OrderID
    FROM ORDERS
    WHERE RUberID = p_ruberid
  );

  DBMS_OUTPUT.PUT_LINE('Average Star Rating for Restaurant ' || p_ruberid || ' is : ' || v_avg_star_rating);
END;
/
execute calculate_avg_star_rating(1);
