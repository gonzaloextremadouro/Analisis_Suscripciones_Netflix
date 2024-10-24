-- realizamos las uniones de las tablas
-- omitimos las columnas 'sign_up_method', 'payment_method' y 'no_of_devices' ya que no son relevantes para el análisis de ventas

SELECT 
	trans.user_id,
    trans.subscription_start_date, 
    trans.subscription_end_date, 
    trans.last_payment_date, 
    trans.subscription_plan, 
	ROUND(trans.subscription_price, 2) as subscription_price,
    demo.age, 
    demo.gender, 
    geo.country
FROM
	subs_transaction_data trans
INNER JOIN
	subs_demo demo ON trans.user_id = demo.id
INNER JOIN
	subs_geo geo ON geo.user_id = trans.user_id