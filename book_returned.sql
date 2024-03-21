DECLARE
	book_no Books.b_no%TYPE := &1;
	student_no Students.st_no%TYPE := &2;
	record Books_issued.b_no%TYPE;
	CURSOR cur IS SELECT b_no FROM Books_issued WHERE b_no = book_no AND st_no = student_no;
	not_found EXCEPTION;
BEGIN
	OPEN cur;
	FETCH cur INTO record;
	IF cur%NOTFOUND THEN
		RAISE not_found;
	END IF;
	UPDATE Books
	SET b_stock = b_stock + 1 WHERE b_no = book_no;
	DELETE FROM books_issued
	WHERE b_no = book_no AND st_no = student_no;
	COMMIT;
	dbms_output.put_line('Success : Book Returned');
EXCEPTION
	WHEN not_found THEN
	dbms_output.put_line('Error : Record Not Found');
END;
/