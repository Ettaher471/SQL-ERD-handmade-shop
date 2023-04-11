use handmade_store;


-- F1
-- explain
-- explain
-- explain
select concat(c.first_name,c.last_name) AS client_Name,i.invoice_id,i.issued_date,p.Product_Name
		 from invoice i 
		 join client c on c.client_id= i.client_id 
         join product_order po on po.invoice_id=i.invoice_id
         join product p on p.Product_id=po.Product_id
         Where i.issued_date between '2021-12-12' AND CURDATE()  
         ;
-- We used an index on the table invoice on the column issued date
-- We also used an index on the table invoice on the column client_ID  :
-- This increased the filtered percertage and reduced the rows used;
-- The time of the execution is 0.
     
-- F2
-- explain
select c.client_id,concat(c.first_name,c.last_name) AS client_Name,  concat(sum(total_value),"€") As total_Purchase
from invoice i
join client c on i.client_id=c.client_id
group by c.client_id
order by sum(i.total_value) desc   
limit 3;

-- The querry was executed very fast 0.00 sec 
-- The good thing no partitions and there are  available key columns
-- Also using inner joins using LIMIT and having  small key length

-- F3
-- explain
select (select(CONCAT((select min(issued_date) from invoice as x)," ",CURDATE() ))) as PeriodOfSales,
	   concat ((select sum(total_value)  from invoice),'€')as 'Total_sales(euros)',
       concat((select(select sum(total_value) from invoice )/
       (select (DATEDIFF(now(),'2020-10-18'))/365) as n_year),'€') as YearlyAverage,
	   concat((select(select sum(total_value) from invoice )/
       (select (DATEDIFF(now(),'2020-10-18'))/30) as n_Month),'€')as MonthlyAverage; 
       
-- The querry is fast 0.00 sec
-- There was no partitions; using SELECT; 100% filtration across tables

       
-- F4
-- explain
SELECT count(1),sum(i.total_value) as 'Total per area',l.area from invoice i
 	   join client c on c.client_id=i.client_id
       join location l on l.location_id=c.location_id
       group by l.area
       
       order by 'Total per area';
-- The added index in the client table on the location_ID made the number of rows seen less 
-- There was no partitions and a  100% filtration across tables
       
-- F5
-- explain
select l.Area,r.Product_id,P.Product_Name,r.Rating from review r
       join client c on  r.client_id=c.client_id
       join location l on l.location_id=c.location_id
	   join product p on p.product_id=r.Product_id
       ;
-- The querry is already fast 
-- We added an index in the location table on area column since the search is per area 

#Other indexes were added by predecting the possible querries and the possible search paterns 
#Other indexes were added by predecting the possible querries and the possible search paterns 






