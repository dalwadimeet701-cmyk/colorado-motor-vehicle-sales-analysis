select * from data

select sum(sales) as total_sales
from data

--total sales over year
select year, sum(sales) as sales
from data
group by year
order by year

-- total sales over quarter

select quarter, sum(sales) as sales
from data
group by quarter
order by quarter

-- top 10 county in sales
select county, sum(sales) as total_sales
from data
group by county
order by total_sales desc
limit 10

-- best quarter over years

select year, quarter, total_sales
from (
    select year, quarter, sum(sales) as total_sales,
           row_number() over (PARTITION by year order by sum(sales) desc) rn
    FROM data
    group by year, quarter
) t
where rn = 1;

-- County-wise sales trend
select year, county, sum(sales) as yearly_sales
from data
group BY year, county
order BY county, year;

-- rank counties by sales within each year

select year, county,sum(sales) as total_sales,
	rank() over (partition by year order by sum(sales) desc) as rank
	from data
	group by year,county
	order by year asc


	
	







