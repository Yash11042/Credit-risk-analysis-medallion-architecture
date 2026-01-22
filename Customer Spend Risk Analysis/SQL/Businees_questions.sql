# ANSWERING SOME BUSINESS QUESTIONS WITH THE HELP ME DIMENTIONS AND FACT TABLES
use gold; 

#Q1 - WHICH CUSTOMER SEGMENT CONTRIBUTES THE  MOST REVENUE?

select 
        c.segment , 
        sum(t.amount)  as total_
        from fact_transactions t 
        join dim_customer c 
        on t.customer_id = c.customer_id
        group by c.segment
        order by total_ desc;
        
# Q2 - WHICH MERCHANT CARRY HIGHEST RISK EXPOSURE

select m.merchant , 
		sum(t.amount *merchant_risk_score ) as risk_exposure
        from fact_transactions t
        join dim_merchant m 
        on t.merchant = m.merchant
        group by m.merchant
        order by risk_exposure desc;
        
#Q3 - IDENTIFY HIGH RISK CUSTOMERS BASED ON SPENDIFG BEHAVIOURS

WITH customer_risk as (
select customer_id , 
		sum(amount) as total_spent,
        sum(high_value_flag) as high_risk
        from fact_transactions
        group by customer_id
        )
select * from customer_risk
where high_risk >= 2
order by total_spent desc;

#Q4 - MONTH-OVER-MONTH SPENT TREND 

SELECT  t.year , t.month , sum(f.amount) as total_spent 
from  fact_transactions f
join dim_time t 
on t.date = f.date
group by t.month , t.year 
order by total_spent desc;


#Q5 - RANK TOTAL CUSTOMERS BY TOTAL SPENT

select customer_id ,
		sum(amount) as total_spent,
        rank() over (order by sum(amount) desc ) as rnk_
        from fact_transactions
        group by customer_id;
        
#Q6 - IDENTIFY CUSTOMERS WHOSE SPENDING INCREASED OVER TIME

WITH monthly_customer_spent as (
select f.customer_id , 
		t.year,
        t.month,
        sum(f.amount) as monthly_spend
        from fact_transactions f 
        join dim_time t 
        on t.date = f.date
        group by f.customer_id , t.year , t.month
        )
        
        select customer_id , 
				year,
                month,
                monthly_spend,
                lag(monthly_spend) over (partition by customer_id order by year,month) as prev_month_spend
                from monthly_customer_spent;
                
#Q7 - PERCEBTAGE CONTRIBUTION OF EACH CUSTOMER TO TOTAL PORTFOLIO
 
select customer_id , 
		sum(amount) as customer_spent , 
        sum(amount) * 100 / sum(sum(amount)) over () as portfolio_pct
        from fact_transactions
        group by customer_id
        order by portfolio_pct desc;