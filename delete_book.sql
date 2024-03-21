DECLARE
	book_no Books.b_no%TYPE NOT NULL := &1;
	max_book_no Books.b_no%TYPE;
	CURSOR cur IS SELECT b_no FROM Books WHERE b_no = book_no;
	not_found EXCEPTION;
BEGIN
	OPEN cur;
	FETCH cur INTO max_book_no;
	IF cur%NOTFOUND THEN
		RAISE not_found;
	END IF;
	DELETE FROM Books
	WHERE b_no = book_no;
	COMMIT;
	dbms_output.put_line('Success : Book Deleted');
EXCEPTION
	WHEN not_found THEN
	dbms_output.put_line('Error : Book Not Found');
END;
/