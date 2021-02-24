SELECT
	ap.id, 
	reg_num, 
	pt.model,
	pas_cap_first, 
	pas_cap_travel
	FROM airline_planes ap
	JOIN plane_types pt ON ap.plane_type_id = pt.id ;


	

SELECT
	COUNT(*) cnt, 
	pt.flight_id,
	apt.town AS 'Departure',
	apt2.town AS 'Arrival'
FROM pax_tickets pt
JOIN scheduled_flights sf ON pt.flight_id = sf.id
JOIN airports apt ON sf.departure_airport_id = apt.id
JOIN airports apt2 ON sf.arrival_airport_id = apt2.id
GROUP BY pt.flight_id 
ORDER BY cnt DESC
;


SELECT 
	COUNT(*) cnt,
	pt.pax_id,
	CONCAT(pax.f_name, ' ', pax.l_name) 
FROM pax_tickets pt
JOIN passangers pax ON pax.id = pt.pax_id
GROUP BY pt.pax_id
ORDER BY cnt DESC
;
	 

SELECT * 
FROM flights f;