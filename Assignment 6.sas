libname Orion "/home/u61762417/my_shared_file_links/jhshows0/STA5067/SAS Data/orion";

Title "2007 Sales Force Sales Statistics";
Title2 "For Employees with 200.00 or More in Sales";
proc sql; 

	select 
	country, 
	first_name,
	last_name,
	sum(Total_retail_price) as Value_sold,
	Count(*) as orders,
	calculated value_sold/calculated orders as avg_orders  
	
from orion.order_fact as a, Orion.sales as b
 
where a.Employee_Id=b.Employee_Id 

group by a.employee_Id

having 
		value_sold > 200.00

order by 1,4 desc, 5 desc

;
quit;

/*Part B */

Title "2007 Sales Force Sales Statistics";
Title2 "For Employees with 200.00 or More in Sales";
proc sql;
	select 
	country,
	max(value_sold) as Max_value_sold format=comma10.2,
	max(orders) as Max_orders format= comma10.2,
	Max(avg_orders) as Max_avg format=comma10.2,
	min(avg_orders) as Min_avg format=comma10.2
	
from (select 
	country, 
	first_name,
	last_name,
	sum(Total_retail_price) as Value_sold,
	Count(*) as orders,
	calculated value_sold/calculated orders as avg_orders  
	
from orion.order_fact as a, Orion.sales as b
 
where a.Employee_Id=b.Employee_Id and year(order_date)=2007

group by a.employee_id

having 
		value_sold > 200.00)
 
group by 1

;
quit;


/* Question 2 */

Title "2007 Sales Force Sales Statistics for Employees with 200.00 or more in Sales";
proc sql; 

create table Deprt_total as

select 
		department,
		sum(salary) as salary format comma10.2
		
from orion.employee_addresses as a,
	orion.employee_payroll as b, 
	orion.employee_organization as c

where a.employee_Id=b.employee_Id and c.employee_Id=a.employee_Id

group by 1

 ;
 quit
; 

/*Part b */

Title "2007 Sales Force Sales Statistics";
Title2 "For employees with 200.00 or more in sales";
proc sql; 

create table employ as
select 
		a.Employee_id,
		employee_name,
		Department
		
from orion.employee_addresses as a, 
	orion.employee_organization as b

where a.employee_Id=b.employee_Id 

group by 1

order by 2
; 
quit;


Proc sql; 

select
	
		total.Department,
		name.Employee_name, 
		total.Salary format comma10.2
	
	from deprt_total as total,
	employ as name
	
where total.department=name.department

group by 1,3
; 
quit;




/*Question 3 */
Title '2007 Total Sales Figures';
proc sql;
select 

		distinct catx(' ', scan(a.employee_name,2),scan(a.employee_name,1)) as Manager,
		catx(' ', scan(d.employee_name,2),scan(d.employee_name,1)) as employee,
		total_sales format=comma10.2
	
from (select 
		
		manager_Id,
		employee_name,
		sum(total_retail_price) as total_sales format=comma10.2
		
from orion.employee_addresses as a, 
	orion.order_fact as b,
	orion.employee_organization as c

where a.employee_Id=b.employee_Id and c.employee_Id=a.employee_Id and year(order_date)=2007

group by b.employee_id)
 
as d, orion.employee_addresses as a 

where d.Manager_id=a.employee_Id

order by country, 1 desc,3 desc
; 
quit;

		
				

