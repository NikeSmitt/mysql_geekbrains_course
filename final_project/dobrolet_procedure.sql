DROP PROCEDURE IF EXISTS show_flight_hours_for_employee_id;


DELIMITER // 

CREATE PROCEDURE show_flight_hours_for_employee_id(emp_id BIGINT UNSIGNED)
	BEGIN
		SELECT 
			crew_member_id id,
			CONCAT(e2.f_name, ' ', e2.l_name) name,
			SEC_TO_TIME(SUM(TIME_TO_SEC(f2.landing_time) - TIME_TO_SEC(f2.take_off_time))) total
		FROM flight_crew_for_flights fcff
		JOIN employees e2 ON e2.id = fcff.crew_member_id
		JOIN flights f2 ON f2.id = fcff.flight_id
		WHERE crew_member_id = emp_id AND f2.cancelled != 1
		GROUP BY crew_member_id
	;
END //
DELIMITER ;

CALL show_flight_hours_for_employee_id(37);