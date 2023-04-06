# SQL-Joins

1.   Use an Inner Join
Produce a report containing Employee_Name and calculated years of service (YOS) as of December 31, 2007, by joining orion.Employee_Addresses and orion.Employee_Payroll on Employee_ID. Label the columns and provide appropriate titles as noted below. Limit the report to employees where YOS > 30. Order the output alphabetically by Employee_Name.
The orion.Employee_Addresses table contains the Employee_Name column.
The orion.Employee_Payroll table contains the Employee_Hire_Date column.
Both orion.Employee_Addresses and orion.Employee_Payroll contain columns named Employee_ID.
Use TITLE1 and TITLE2 statements to produce title lines. The first line should read Employees with More than 30 Years of Service.  The second line should read As of December 31, 2007 
Age/years of service calculations can be difficult to render precisely. In this course, you use the following:
     YOS =int(('31DEC2007'd= Employee_Hire_Date)/365.25)

Others might use the INTCK function:
     YOS=intck('year',Employee_Hire_Date,'31DEC2007'd)

Requested output (partial):
 
2.   Use an Outer Join
Join orion.Sales and orion.Employee_Addresses on Employee_ID to create a report showing the names and cities of all Orion Star employees, and if an employee is in Sales, the job title. Present the report in alphabetical order by city, job title, and name.
The orion.Sales table contains a record for every employee in the Sales Department and includes columns Employee_ID and Job_Title.
The orion.Employee_Addresses table contains a record for every employee and includes Employee_ID, Employee_Name, and City.
Requested Output (Partial);
 
3.   Joining Multiple Tables
Create a report showing Orion Star Internet customers residing in the U.S. or Australia who purchased foreign manufactured products, that is, a product that was not manufactured in their country of residence. The report should be titled US and Australian Internet Customers Purchasing Foreign Manufactured Products and should display the customers’ names and the number of foreign purchases made. Present the information so that those with the largest number of purchases appear at the top of the report, and customers who have the same number of purchases are displayed in alphabetical order.
Employee_ID 99999999 is a dummy ID that can be used to identify Internet orders. The data that you need can be found in the listed columns of the following tables:
orion.Product_Dim contains 
Product_ID
Supplier_Country
orion.Order_Fact contains 
Product_ID
Customer_ID
orion.Customer contains
Customer_ID
Country

![image](https://user-images.githubusercontent.com/101452475/230445679-eb06c7b9-7525-4aa7-9cbd-dd8e3d66aeb0.png)
