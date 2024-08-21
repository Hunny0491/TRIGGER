
select *  from sales

create table table_report(
	product_id varchar primary key,
	sum_of_sales float,
	sum_of_quantity float,
	sum_of_profit float
)
	select * from table_report

select count (*) from sales where product_id = 'TEC-PH-10004977'
	
	select distinct quantity from sales where product_id = 'TEC-PH-10004977'
	select distinct profit from sales where product_id = 'TEC-PH-10004977'

	update table_report set sum_of_sales = 190 , sum_of_quantity = 8 , sum_of_profit = 25
	
Create or replace function update_table_report()
returns trigger as $$
DECLARE
sumofSales float;
sumofQuantity float;
sumofProfit float;
count_report INT;
begin
select sum(sales), sum(quantity), sum(profit) into sumofSales, sumofQuantity, sumofProfit from sales
where product_id = new.product_id;
select count (*) into count_report from table_report where product_id = new.product_id;
if count_report = 0 then insert into table_report values (new.product_id, sumofSales, sumofQuantity, sumofProfit);
else
update table_report set sum_of_sales = sumofSales, sum_of_quantity = sumofQuantity, sum_of_profit = sumofProfit
where produt_id = new.product_id;
end if;
return new;
end;
$$ language plpgsql


create trigger update_report_trigger
After insert on sales
for each row
execute function update_table_report()
	
select * from sales

select sum(sales), sum(quantity), sum(profit) from sales where product_id = 'TEC-PH-10004977'

--sum(sales) = 5401.7300000000005
--sum(quantity) = 38
--sum(profit) = 860.8371999999999
	
select * from sales order by order_line DESC
    
insert into sales(order_line,order_id,order_date,ship_date,ship_mode,customer_id,product_id,sales,quantity,discount,profit)
values(9998,'CA-2016-152156','2021-05-16','2024-08-21','Standard Class','CG-12520','TEC-PH-10004977',110,6,2,22)

	
select * from sales order by order_line DESC
   


select  sum_of_profit from table_report
where product_id = 'TEC-PH-10004977'

select  sum_of_quantity from table_report
where product_id = 'TEC-PH-10004977'



