select top 30 * from customer;

---  1) Revenue amount by gender
select gender, SUM(purchase_amount) as revenue
from customer
group by gender

---  2) Which customer spent more than the average amount still using discounts
select customer_id, purchase_amount
from customer
where discount_applied = 'Yes' and purchase_amount>= (select AVG(purchase_amount) from customer)

---  3) Which are the top 5 products with the highest average review rating?
select TOP 5 item_purchased as product, round(AVG(review_rating),2) as Avg_review_rating
from customer
group by item_purchased
order by AVG(review_rating) desc


---  4) Compare the average Purchase Amounts between types of Shipping
select shipping_type, AVG(purchase_amount) as Avg_sale_price
from customer
group by shipping_type
order by AVG(purchase_amount) desc

---  5) Compare the average Purchase Amounts between express and standard Shipping
select shipping_type, AVG(purchase_amount) as Avg_sale_price
from customer
where shipping_type in ('Standard','Express')
group by shipping_type
order by AVG(purchase_amount) desc


---  6) Compare spend of subscribers and non subscribers in relation to the total revenue
select subscription_status,
count(customer_id) as total_customers,
AVG(purchase_amount) as avg_spend,
SUM(purchase_amount) as total_revenue
FROM customer
group by subscription_status
order by total_revenue desc;

---  7) Which 5 products have the highest percentage of purchase with discounts applied?
SELECT TOP 5 item_purchased,
100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/ COUNT(*) as discount_rate
from customer
group by item_purchased
order by discount_rate desc

---  8) Segment customers into New, returning and loyal based on number of previous purchases and show the count of each segment
with customer_type as (
select customer_id, previous_purchases,
CASE 
	WHEN previous_purchases = 1 THEN 'New'
	WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
	ELSE 'Loyal'
	END AS customer_Segment
from customer
)

select customer_segment, count (*) as "Number of Customers"
from customer_type
group by customer_segment;

---  9) Top 3 most purchased products within each Category?
with item_counts as (
select category,
item_purchased,
COUNT(customer_id) as total_orders,
ROW_NUMBER() over(partition by category order by count(customer_id) DESC) as item_rank
from customer
group by category, item_purchased
)

select item_rank, category, item_purchased, total_orders
from item_counts
where item_rank <= 3;

---  10) What is the revenue by age group?
select age_group,
SUM(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue desc;