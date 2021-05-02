SELECT Accountowner,count(*) as 'website_count' from accounts 
GROUP by Website;

SELECT Accountname,Accountowner from accounts where Tasksinvolved='Yes'
 and Eventsinvolved='No';

SELECT Caseorigin,count(*) from  cases group by Caseorigin limit 1 ;

select Casestatus,count(*)*100.0/(select count(Casestatus) from cases) 
percentage from cases where
 Casestatus='On Hold';


SELECt Id,Contactowner,Leadsource,Mobile,count(*) 
from contacts group by Leadsource;


select leads.Industry,leads.Company,ConvertedOpportunityID from leads
inner join contacts on leads.Id=contacts.Id
where leads.Converted='Yes' 
GROUP by ConvertedOpportunityID;


SELECT LeadSource,count(*) from leads  group by
 LeadSource HAVING count(*) >= all(select count(*) 
from leads GROUP by LeadSource);


SELECT OpportunityName,ExpectedRevenue from opportunities o
 join leads l on o.Id=l.ConvertedOpportunityId and o.Probability='100'
 group by o.Id ;



select OpportunityName,Amount from opportunities 
where amount>(select avg(Amount) FROM opportunities)
 order by Amount desc;


select b.OrderProductID,a.OrderName,a.Account_ID,b.Nettotal 
from orders a , order_items b where a.OrderID = b.OrderID and
 a.Status='Delivered' and  Nettotal>5000
 order by Nettotal desc;



SELECT a.Ordername,a.orderowner from orders a,order_items b 
where a.orderId=b.orderId and b.orderid in
(select b.orderid where PriceBookEntryID=30000000 and Quantity=7);



select OrderID from orders where OrderID=any
(SELECT orderid from order_items where OrderProductID=any
(select OrderProductID from order_items WHERE PriceBookEntryID=
any(SELECT PriceBookEntryID from price_book_entry where pricebookId=
any(SELECT pricebookid from price_books where pricebookname
='Differential Price Book - Business2'))));



SELECT a.ProductID ,a.ProductName from price_book_entry 
a inner join Products b on a.ProductID=b.productid 
group by ProductID HAVING count(*)>10;



SELECT b.ProductName,b.productowner from 
price_book_entry a,products b where a.productid=b.productid
 group by ProductName having count(*)>5 ;



SELECT b.ProductName,b.productowner,b.productmanufacturer,cost 
from price_book_entry a,products b where a.productid=b.productid and 
cost>(SELECT avg(cost) from products ) order by cost desc;

















