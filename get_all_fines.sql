DECLARE
	student_name Students.st_name%TYPE;
	amount pending_fines.amount%TYPE;
BEGIN
	FOR record IN (SELECT * FROM pending_fines)
	LOOP
		SELECT st_name INTO student_name FROM Students
		WHERE st_no = record.st_no;
		dbms_output.put_line(''||student_name||' '||record.amount);
	END LOOP;
END;
/