SELECT TOP (1000) [Item Fat Content]
      ,[Item Identifier]
      ,[Item Type]
      ,[Outlet Establishment Year]
      ,[Outlet Identifier]
      ,[Outlet Location Type]
      ,[Outlet Size]
      ,[Outlet Type]
      ,[Item Visibility]
      ,[Item Weight]
      ,[Sales]
      ,[Rating]
  FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']

1)----TOTAL SALES....
Select Round(sum([sales]),2)as Total_Sales
 FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$'];
--This query calculates the total sales by using the SUM function on the Sales column.
--Rounds the result to two decimal places using ROUND, and gives the result the alias Total_Sales.

2)---NUMBER OF ITEMS...
SELECT
    COUNT(*)AS No_of_Sales
    FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$'];
--This query uses COUNT(*) to count the total number of records in the BlinkIT Grocery Data table.
--gives the output column the alias No_of_Items.

3)---AVERAGE SALES....
SELECT 
Round(avg([sales]),2) as Avg_Sales
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$'];
--This query calculates the average sales using the AVG function.
--Rounds the result to two decimal places using ROUND, and assigns the result the alias Avg_Sales.

4)--TOTAL SALES BY OUTLETESTABLISHMENT YEAR....
SELECT [Outlet Establishment Year],
Round(sum([Sales]),2) as Total_Sales
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
group by [Outlet Establishment Year]
order by [Outlet Establishment Year];
--I use GROUP BY to create groups based on the establishment year, SUM to calculate sales for each group.
--ROUND to two decimal places, and ORDER BY to sort the years in ascending order.

5)--NUMBER OF OUTLET SIZE...
select
  CASE
        WHEN [Outlet Size] = 'Small' THEN 'Small'
        WHEN [Outlet Size] = 'Medium' THEN 'Medium'
        WHEN [Outlet Size] = 'High' THEN 'High'
    END AS Outlet_Size,
    count(*) as No_of_Items
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
group by[Outlet Size]
order by No_of_Items desc;
--count how many records/items are present for each Outlet Size and show the largest number first.

6)--SELECT BY OUTLET LOCATION TYPES....
SELECT 
    CASE
        WHEN [Outlet Location Type] = 'Tier 1' THEN 'Tier 1'
        WHEN [Outlet Location Type] = 'Tier 2' THEN 'Tier 2'
        WHEN [Outlet Location Type] = 'Tier 3' THEN 'Tier 3'
    END AS Tier,
    ROUND(SUM([Sales]), 2) AS Total_Sales
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
GROUP BY [Outlet Location Type]
ORDER BY Total_Sales DESC;
--Calculate the total sales for Tier 1, Tier 2, and Tier 3 outlets, and display them from the highest sales to the lowest sales.
7)---NUMBER OF ITEMS BY ITEMS TYPES....
select
    [Item Type],
    count(*) as No_of_Items
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
group by [Item Type]
order by No_of_Items desc;
--I grouped the grocery data by Item Type and used COUNT to determine the number of records for each category.
--sorted the categories in descending order to identify the Item Types with the highest number of records.

8)---FAT CONTENT ANALYSIS....
select 
   [Item Fat Content],
   count(*) as No_of_Items
   FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
   group by[Item Fat Content];
 --This query means counting how many items/records are there for each Item Fat Content category.


9) ---FAT CONTENT BY OUTLET LOCATION...
 Select
   [Outlet Location Type],
   [Item Fat Content],
   count(*) as No_of_Items
   FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
   group by[Outlet Location Type],
           [Item Fat Content]

   order by [Outlet Location Type];
--This query is used to count the number of items for each combination of Outlet Location Type and Item Fat Content.

10)---- FIND BEST PERFORMING OUTLET....
select [Outlet Identifier],
sum(Sales) as Total_Sales
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
group by [Outlet Identifier]
order by Total_Sales DESC;
---Find the total sales for each outlet and arrange the outlets from highest total sales to lowest total sales

11)---  AVERAGE SALES BY ITEM TYPE...
SELECT 
    [Item Type],
    AVG(Sales) AS Average_Sales
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
GROUP BY [Item Type]
ORDER BY Average_Sales DESC;
--This query calculates the average sales for each item type using AVG().
--groups the records by item type using GROUP BY, and sorts the results in descending order using ORDER BY.

12)--- FIND AVERAGE RATED ITEMS.....
select
    [Item Type],
    Avg(Rating) as Average_Rating
    FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
    group by[Item Type]
    Having AVG(Rating) > 4
    order by Average_Rating DESC;
    --This query groups the data by item type, calculates the average rating for each item type.
    --Having AVG(Rating)>4 means calculating the average rating for each item type, keep only those item types whose average 
     greater than 4.
    --sorts the results in descending order of average rating.
---OUTLET PERFORMANCE ANALYSIS....
select [Outlet Type],
count(*) as Number_of_Items,
sum(sales) as Total_Sales,
AVG(Sales) as Average_Sales,
AVG(Rating) as Average_Rating
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
group by [Outlet Type]
order by Total_Sales DESC;
--For each outlet type, count the number of items, calculate total sales, calculate average sales.
--calculate average rating, and then arrange the outlet types from highest total sales to lowest.

14)--   LOW FAT VS REGULAR FAT
Select [Item Fat Content],
sum(Sales) as Total_Sales,
round(AVG(Sales),2) as  AVERAGE_Sales
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
group by [Item Fat Content];
--Group the items according to their fat content and calculate the total sales and average sales.
--each fat-content category, with the average rounded to 2 decimal places.

15)---  COMPLETE BUSINESS ANALYSIS QUERY....
SELECT 
    [Outlet Type],
    COUNT([Item Identifier]) AS Total_Items,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(AVG(Sales), 2) AS Average_Sales,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM [DATAANALYIST].[dbo].['BlinkIT Grocery Data$']
GROUP BY [Outlet Type]
ORDER BY Total_Sales DESC;
--For each outlet type, count the number of items, calculate total sales, calculate average sales, and calculate average rating.
--Finally, arrange the outlet types from highest total sales to lowest.





