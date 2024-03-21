DECLARE
	student_no Students.st_no%TYPE NOT NULL := &1;
	max_student_no Students.st_no%TYPE;
	CURSOR cur IS SELECT st_no FROM Students WHERE st_no = student_no;
	not_found EXCEPTION;
BEGIN
	OPEN cur;
	FETCH cur INTO max_student_no;
	IF cur%NOTFOUND THEN
		RAISE not_found;
	END IF;
	DELETE FROM Students
	WHERE st_no = student_no;
	COMMIT;
	dbms_output.put_line('Success : Student Deleted');
EXCEPTION
	WHEN not_found THEN
	dbms_output.put_line('Error : Student Not Found');
END;
/