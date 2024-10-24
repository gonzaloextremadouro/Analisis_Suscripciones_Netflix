-- chequeamos si existen duplicados

SELECT 
	user_id, 
	subscription_plan, 
	subscription_price,
	subscription_start_date, 
	subscription_end_date, 
	last_payment_date,
	COUNT(*) AS dups
FROM 
	subs_transaction_data
GROUP BY 
	user_id, 
	subscription_plan, 
	subscription_price,
	subscription_start_date, 
	subscription_end_date, 
	last_payment_date
HAVING
	COUNT(*) > 1

SELECT 
	user_id,
	country,
	COUNT(*)
FROM 
	subs_geo
GROUP BY 
	user_id,
	country
HAVING
	COUNT(*) > 1

SELECT 
	id,
	age,
	gender,
	sign_up_method,
	payment_method,
	no_of_devices
FROM 
	subs_demo
GROUP BY
	id,
	age,
	gender,
	sign_up_method,
	payment_method,
	no_of_devices
HAVING
	COUNT(*) > 1

-- chequeamos la integridad de valores en columnas críticas

SELECT DISTINCT 
	subscription_plan
FROM 
	subs_transaction_data

SELECT DISTINCT
	country
FROM 
	subs_geo

SELECT DISTINCT
	gender
FROM
	subs_demo

-- chequeamos la presencia de valores nulos

SELECT 
	COUNT(*) AS null_user_ids 
FROM 
	subs_transaction_data 
WHERE 
	user_id IS NULL

SELECT 
	COUNT(*) AS null_countries 
FROM 
	subs_geo 
WHERE 
	country IS NULL

SELECT 
	COUNT(*) AS null_genders 
FROM 
	subs_demo 
WHERE 
	gender IS NULL

-- chequeamos si hay algún error en las columnas de las fechas de suscripción

SELECT 
    COUNT(*) AS invalid_dates 
FROM 
    subs_transaction_data 
WHERE 
    subscription_start_date > subscription_end_date