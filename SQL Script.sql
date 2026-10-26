#1- Total Sales:
Select SUM(total_bill) As Total_Sales From bakery_dataset;

#2- Total Transactions:
SELECT COUNT(DISTINCT Transaction_id) AS Total_Transactions FROM bakery_dataset;
 
#3- Total Quantity Sold:
SELECT SUM(quantity) AS Total_Quantity_Sold FROM bakery_dataset;

#4- Average Transaction Value:
SELECT AVG(total_bill) AS Average_Transaction_Value FROM bakery_dataset;

#5- Daily Sales Trend:
Select date, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By date
Order By date;

#6- Monthly Sales Trend:
Select month(STR_TO_DATE(date, '%m/%d/%Y')) As Month_Number, monthname(STR_TO_DATE(date, '%m/%d/%Y')) As Month_Name,
Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By month(STR_TO_DATE(date, '%m/%d/%Y')),
	     monthname(STR_TO_DATE(date, '%m/%d/%Y'))
Order By month_number;

#7- Sales by Day of Week:
Select day_of_week, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By day_of_week;

#8- Weekend vs Weekday Sales:
SELECT weekend, Sum(total_bill) AS Total_Sales FROM bakery_dataset Group By weekend;

#9- Sales by Product:
Select product, Sum(Total_bill) As Total_Sales From bakery_dataset Group By product;

#10- Top 10 Products by Sales:
Select product, Sum(Total_bill) As Total_Sales From bakery_dataset 
Group By product
Order By Total_Sales DESC Limit 10;

#11- Sales by Category:
Select category, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By category;

#12- Quantity Sold by Product:
Select product, Sum(Quantity) As Quantity_Sold From bakery_dataset 
Group By product;

#13- Total Profit:
Select SUM(profit) As Total_Profit From bakery_dataset;

#14- Profit Margin %:
SELECT (SUM(profit) / SUM(total_bill))* 100 AS Profit_Margin_Percentage FROM bakery_dataset;

#15- Profit by Product and Category:
SELECT product, category, Sum(profit) AS Total_Profit From bakery_dataset
Group By product, category
Order By Total_Profit DESC;

#16- Loss-Making Products:
Select product, Round(Sum(total_bill), 2) As Total_Sales,
Round(Sum(profit), 2) As Total_Profit From bakery_dataset
Group By product
Having Sum(profit) < 0
Order By Total_Profit;

#17- Average Discount %:
SELECT AVG(discount_percentage) AS Avg_Discount FROM bakery_dataset;

#18- Discount Amount by Product:
Select product, Sum(discount_amount) As Total_Discount From bakery_dataset
Group By product;

#19- Sales with vs without Promotion:
Select promotion_Applied, SUM(Total_bill) As Total_Sales From bakery_dataset
Group By promotion_Applied;

#20- Unique Customers:
Select Count(Distinct customer_id) AS Unique_Customer From bakery_dataset;

#21- Sales by Customer Segment:
Select customer_segment, Sum(total_bill) As Total_Sales From bakery_dataset
Group By customer_segment
Order By Total_Sales DESC;

#22- Loyalty vs Non-Loyalty Sales:
Select loyalty_member, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By loyalty_member;

#23- Average Customer Rating:
SELECT AVG(customer_rating) As Avg_Customre_Rating From bakery_dataset;

#24- Sales by Payment Method:
Select payment_method, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By payment_method;

#25- Sales by Store:
Select store_ID, SUM(total_bill) As Total_Sales From bakery_dataset
Group By store_ID;

#26- Sales by Employee:
Select employee_ID, SUM(total_bill) As Total_Sales From bakery_dataset
Group By employee_ID
Order By Total_Sales DESC;

#27- Total Units Produced:
SELECT SUM(units_produced) AS Total_Units_Produced FROM bakery_dataset;

#28- Total Units Sold:
SELECT SUM(units_sold) AS Total_Unit_Sold From bakery_dataset;

#29- Unsold Units:
SELECT SUM(unsold_units) AS Unsold_Units FROM bakery_dataset;

#30- Waste Cost:
SELECT SUM(waste_cost) AS Waste_Cost FROM bakery_dataset;

#31- Waste Cost by Product:
Select product, Round(Sum(waste_cost), 2) As Total_Waste From bakery_dataset
Group By product
Order By Total_Waste DESC;

#32- Expiry Risk by Product:
Select product, expiry_risk, Sum(unsold_units) As Unsold_Units From bakery_dataset
Group By product, expiry_risk
Order By field(expiry_risk, 'High', 'Medium', 'Low'), Unsold_Units DESC;

#33- Sales by Hour:
Select hour(time) As Sales_Hour, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By Sales_Hour;

#34- Festival vs Non-Festival Sales:
SELECT festival, Round(Sum(total_bill), 2) As Total_Sales, Sum(quantity) As quantity_Sold From bakery_dataset
Group By festival
Order By Total_Sales DESC;

#35- Sales by Season:
Select season, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By season;

#36- Sales by Weather Condition:
Select weather, Round(Sum(total_bill), 2) As Total_Sales From bakery_dataset
Group By weather;
