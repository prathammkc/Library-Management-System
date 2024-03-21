DECLARE
	book_no Books.b_no%TYPE := &1;
	student_no Students.st_no%TYPE := &2;
	max_book_no Books.b_no%TYPE;
	CURSOR bCur IS SELECT b_no FROM Books WHERE b_no = book_no;
	max_student_no Students.st_no%TYPE;
	CURSOR sCur IS SELECT st_no FROM Students WHERE st_no = student_no;
	book_not_found EXCEPTION;
	student_not_found EXCEPTION;
BEGIN
	OPEN bCur;
	OPEN sCur;
	FETCH bCur INTO max_book_no;
	FETCH sCur INTO max_student_no;
	IF bCur%NOTFOUND THEN
		RAISE book_not_found;
	END IF;
	IF sCur%NOTFOUND THEN
		RAISE student_not_found;
	END IF;
	UPDATE Books
	SET b_stock = b_stock - 1 WHERE b_no = book_no;
	INSERT INTO books_issued
	VALUES(
		book_no,
		student_no
	);
	COMMIT;
	dbms_output.put_line('Success : Book Issued');
EXCEPTION
	WHEN book_not_found THEN
	dbms_output.put_line('Error : Book Not Found');
	WHEN student_not_found THEN
	dbms_output.put_line('Error : Student Not Found');
END;
/