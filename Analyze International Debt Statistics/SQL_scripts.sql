-- num_distinct_countries 
-- Finding the number of distinct countries

SELECT COUNT(DISTINCT(country_name)) as total_distinct_countries
FROM public.international_debt

-- highest_debt_country 
-- Finding the country with the highest debt
SELECT public.international_debt.country_name, SUM(debt) as total_debt
FROM public.international_debt
GROUP BY public.international_debt.country_name
ORDER BY total_debt DESC
LIMIT 1

-- lowest_principal_repayment 
-- Finding the country with the lowest amount of principal repayments
SELECT 
	public.international_debt.country_name, 
	public.international_debt.indicator_name, 
	MIN(debt) as lowest_repayment
FROM public.international_debt
WHERE public.international_debt.indicator_code = 'DT.AMT.DLXF.CD'
GROUP BY (public.international_debt.country_name, public.international_debt.indicator_name)
ORDER BY lowest_repayment
LIMIT 1