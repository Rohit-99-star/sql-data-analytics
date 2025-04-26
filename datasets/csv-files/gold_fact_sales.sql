create view gold.fact_sales
as
select sls_ord_num as order_number,
pr.product_key,   ---- use surrogate keys of dimension tables instead of the columns in it to connect dimesnion and facts
cu.customer_key,
sd.sls_order_dt as order_date,
sd.sls_ship_dt shipping_date,
sd.sls_due_dt as due_date,
sd.sls_sales as sales,
sd.sls_quantity as quantity,
sd.sls_price as price
 from Silver.crm_sales_details sd left join
 gold.dim_products pr on sd.sls_prd_key = pr.product_number
 left join  gold.dim_customers cu on sls_cust_id = cu.customer_id ;