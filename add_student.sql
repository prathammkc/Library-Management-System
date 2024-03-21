DECLARE
	student_no Students.st_no%TYPE;
	student_name VARCHAR2(60) NOT NULL := &1;
	student_institute Students.st_institute%TYPE := &2;
	student_type Students.st_type%TYPE := &3;
	student_cno Students.st_cno%TYPE := &4;
BEGIN
	SELECT MAX(st_no) INTO student_no FROM Students;
	INSERT INTO Students
	VALUES(
		student_no + 1,
		student_name,
		student_institute,
		student_type,
		student_cno
	);
	COMMIT;
	dbms_output.put_line('Success : Student added to library');
END;
/