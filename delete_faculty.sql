DECLARE
	faculty_no Faculty.f_no%TYPE NOT NULL := &1;
	max_faculty_no Faculty.f_no%TYPE;
	CURSOR cur IS SELECT f_no FROM Faculty WHERE f_no = Faculty_no;
	not_found EXCEPTION;
BEGIN
	OPEN cur;
	FETCH cur INTO max_faculty_no;
	IF cur%NOTFOUND THEN
		RAISE not_found;
	END IF;
	DELETE FROM Faculty
	WHERE f_no = Faculty_no;
	COMMIT;
	dbms_output.put_line('Success : Faculty Deleted');
EXCEPTION
	WHEN not_found THEN
	dbms_output.put_line('Error : Faculty Not Found');
END;
/