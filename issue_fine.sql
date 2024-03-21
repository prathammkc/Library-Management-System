DECLARE
	student_no Students.st_no%TYPE := &1;
	fined_amount pending_fines.amount%TYPE := &2;
	max_student_no Students.st_no%TYPE;
	CURSOR sCur IS SELECT st_no FROM Students WHERE st_no = student_no;
	student_not_found EXCEPTION;
BEGIN
	OPEN sCur;
	FETCH sCur INTO max_student_no;
	IF sCur%NOTFOUND THEN
		RAISE student_not_found;
	END IF;
	INSERT INTO pending_fines
	VALUES(
		student_no,
		fined_amount
	);
	COMMIT;
	dbms_output.put_line('Success : Fine Issued');
EXCEPTION
	WHEN student_not_found THEN
	dbms_output.put_line('Error : Student Not Found');
END;
/