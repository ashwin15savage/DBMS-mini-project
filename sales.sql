CREATE OR REPLACE PROCEDURE viewItem(ItemID IN VARCHAR2)
IS
  ordername VARCHAR2(4);
  city VARCHAR2(50);
  orderId NUMBER;
  State VARCHAR2(10);
  Amount NUMBER(10,2);
  Accid NUMBER(10,2);
  Address VARCHAR2(50);
  
BEGIN
  
  SELECT COUNT(*) 
  FROM orders
  WHERE orderid LIKE AccID;
  
  SELECT COUNT(*) 
  FROM orders
  WHERE AccId LIKE OrderID;
  
  IF Amount > 100 THEN
    SELECT ordername, state, avalability, Amount, address
 
    FROM book
    WHERE bookid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('ordename ' || OrderID || AccId);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('OrderId ' || AccId);
    DBMS_OUTPUT.PUT_LINE('city ' || address);
    DBMS_OUTPUT.PUT_LINE('city ' || aux);
    DBMS_OUTPUT.PUT_LINE('Amount: ' || Cost);
    
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  ELSIF NetTotal > 0 THEN
    SELECT title, year, state, avalability, debycost, lostcost, address
    
    FROM order_items
    WHERE orderProductId LIKE pricebookentryId;
  
    DBMS_OUTPUT.PUT_LINE('VIDEO ' || ItemID ||  INFO);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TITLE: ' || Title);
    DBMS_OUTPUT.PUT_LINE('YEAR: ' || Year);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || State);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || Abala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || Cost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || LostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || Address);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  OrderProductID VARCHAR2(10);
BEGIN
  OrderProductID := &Item_ID;
  viewItem(ItemID);
END;



--3--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE customerAccount(custoID IN customer.customerid%TYPE)
IS
  pricebookId NUMBER;
  productId NUMBER;
  bookname VARCHAR(6);
  ListPrice number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM customer
  WHERE customerid LIKE custoID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The product is ' || bookname);  
  IF (rented > 0) THEN
    SELECT price_books.itemid 
    FROM price_books,price_books_entry
    WHERE price_books.id = price_books_entry.id
    AND price_books_entry.id LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem ||  rented);
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no orders'); 
  END IF;
  
  SELECT pricebookId 
  FROM price_books_entry
  WHERE Accid LIKE OrderID;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;

SET SERVEROUTPUT ON;
DECLARE
  custoID customer.customerid%TYPE;
BEGIN
  
  customerAcount(AccID);
END;


--EMPLOYEE--
CREATE OR REPLACE PROCEDURE price_books(PriceBookEntryID IN price_books.pricebookId%TYPE)
IS
  pricebookId NUMBER;
  productId NUMBER;
  bookname VARCHAR(6);
  ListPrice number := 0;
BEGIN
  SELECT pricebookId 
  FROM price_books_entry
  WHERE Accid LIKE OrderID;
  
  SELECT COUNT(*) 
  FROM price_books
  WHERE price_books.pricebookid LIKE orderId;
  
  DBMS_OUTPUT.PUT_LINE('The user Item is ' || productId);  
  IF (item > 0) THEN
    SELECT price_books.pricebookid  INTO Item
    FROM price_books,price_books_entry
    WHERE Price_Book.id = price_books.pricebookid
    AND card.cardid LIKE price_books.pricebookid;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || Item || ' bought');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no orders'); 
  END IF;
  
  SELECT fines INTO price_books
  FROM card
  WHERE Orderprodid LIKE orderId;
  
  DBMS_OUTPUT.PUT_LINE('The user ordered items ' || product);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;
