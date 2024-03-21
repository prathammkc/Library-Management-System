DECLARE
	faculty_no Faculty.f_no%TYPE;
	faculty_name VARCHAR2(15) NOT NULL := &1;
	faculty_dept Faculty.f_dept%TYPE := &2;
	faculty_desg Faculty.f_desg%TYPE := &3;
BEGIN
	SELECT MAX(f_no) INTO faculty_no FROM Faculty;
	INSERT INTO Faculty
	VALUES(
		faculty_no + 1,
		faculty_name,
		faculty_dept,
		faculty_desg
	);
	COMMIT;
	dbms_output.put_line('Success : Faculty added to library');
END;
/