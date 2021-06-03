1.
SELECT Accountowner,count(*) as 'website_count' from accounts 
GROUP by Website;
----
2.
SELECT Accountname,Accountowner from accounts where Tasksinvolved='Yes'
 and Eventsinvolved='No';
----
3.
SELECT Caseorigin,count(*) from  cases group by Caseorigin limit 1 ;
----
4.
select Casestatus,count(*)*100.0/(select count(Casestatus) from cases) 
percentage from cases where
 Casestatus='On Hold';
----
5.

SELECt Id,Contactowner,Leadsource,Mobile,count(*) 
from contacts group by Leadsource;
----
6.

select leads.Industry,leads.Company,ConvertedOpportunityID from leads
inner join contacts on leads.Id=contacts.Id
where leads.Converted='Yes' 
GROUP by ConvertedOpportunityID;

----
7.
SELECT LeadSource,count(*) from leads  group by
 LeadSource HAVING count(*)
 >= all(select count(*) 
from leads GROUP by LeadSource);
----
8.

SELECT OpportunityName,ExpectedRevenue from opportunities o
 join leads l 
 on o.Id=l.ConvertedOpportunityId and o.Probability='100'
 group by o.Id ;

----
9.


select OpportunityName,Amount from opportunities 
where amount>
(select avg(Amount) FROM opportunities)
 order by Amount desc;

----
10.
select b.OrderProductID,a.OrderName,a.Account_ID,b.Nettotal 
from orders a , order_items b where a.OrderID = b.OrderID and
 a.Status='Delivered' and  Nettotal>5000
 order by Nettotal desc;

----
11.
SELECT a.Ordername,a.orderowner from orders a,order_items b 
where a.orderId=b.orderId and b.orderid in
(select b.orderid where
 PriceBookEntryID=30000000 and Quantity=7);

----
12.

select OrderID from orders where OrderID=any
(SELECT orderid from order_items where OrderProductID=any
(select OrderProductID from order_items WHERE 
 PriceBookEntryID=any(SELECT PriceBookEntryID from price_book_entry
where pricebookId=
any(SELECT pricebookid from price_books where pricebookname
='Differential Price Book - Business2'))));

----
13.

SELECT a.ProductID ,a.ProductName from price_book_entry 
a inner join Products b 
on a.ProductID=b.productid 
group by ProductID HAVING count(*)>10;

----
14.

SELECT b.ProductName,b.productowner from 
price_book_entry a,products b
where a.productid=b.productid
 group by ProductName having count(*)>5 ;

----
15.
SELECT b.ProductName,b.productowner,b.productmanufacturer,cost 
from price_book_entry a,products b 
where a.productid=b.productid and 
cost>(SELECT avg(cost) from products ) 
order by cost desc;

----
16.


select OrderID from orders where OrderID=any
(SELECT orderid from order_items where OrderProductID=any
(select OrderProductID from order_items WHERE PriceBookEntryID=
any(SELECT PriceBookEntryID from price_book_entry where
pricebookId=any(SELECT pricebookid from 
price_books where pricebookname='	
Flat Price Book - Business10'))));

-----
17.

select l.Id,l.FullName,l.Company from leads l
join(select LEADID from opportunities where
     amount>20000 and tasksinvolved='yes' and 
     probability=0 order by amount limit 5 )
sub on l.Id=sub.leadid;

-----
18.


SELECT o.orderid,o.ordername,o.order_amount from orders o join
( select p.createddate from price_books p ,price_book_entry
 where active='yes' and p.PriceBookID=price_book_entry.PriceBookID group by 1 )
 sub on  o.Created_Date>sub.CreatedDate order by o.Order_Amount limit 5;


 -----
 19.
 
 
SELECT b.Active,b.cost,b.ProductName,b.productowner from 
price_book_entry a,products b
where a.productid=b.productid 
and cost>500
Order BY Cost ASC;


----- 
20.


SELECT DISTINCT b.Fullname,b.leadowner,b.leadsource from 
contacts a,leads b
where a.leadsource=b.leadsource In 
(SELECT Id FROM leads 
Where LeadSource="Cold Call"
 and Industry="IT Services")
                    
                    
-----
21.


SELECT a.Accountname,a.Accountowner ,a.Tasksinvolved from 
accounts a right join cases b 
on a.Id=b.Id
WHERE Accountowner LIKE "%ew";


----
22.


SELECT a.OrderOwner,b.Quantity,b.Nettotal -(Nettotal /15/100) as TotalPrice from 
orders a ,order_items b
WHERE a.OrderID=b.OrderID AND
Quantity>=10
ORDER by Quantity ASC;


-----
23.

SELECT accounts.Accountname, accounts.Accountowner, accounts.`Account Type`,accounts.Industry,activities.Subject,activities.`Due Date`,activities.Status
FROM accounts
INNER JOIN activities ON accounts.Accountowner=activities.`Activity Owner`;


--------
24.



SELECT accounts.Accountname, accounts.Accountowner, accounts.`Account Type`,accounts.Industry,activities.Subject,activities.`Due Date`,activities.Status
FROM accounts
RIGHT JOIN activities ON accounts.Accountowner=activities.`Activity Owner`;



--------
25.


SELECT accounts.Accountname, accounts.Accountowner, accounts.`Account Type`,accounts.Industry,activities.Subject,activities.`Due Date`,activities.Status
FROM accounts
LEFT JOIN activities ON accounts.Accountowner=activities.`Activity Owner`;

--------
26.

SELECT accounts.Accountname, accounts.Accountowner, accounts.`Account Type`,accounts.Industry,activities.Subject,activities.`Due Date`,activities.Status
FROM accounts
 JOIN activities ON accounts.Accountowner=activities.`Activity Owner`;
 
-









 
 

















