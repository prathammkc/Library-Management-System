DECLARE
	book_no Books.b_no%TYPE NOT NULL := &1;
	qty Books.b_stock%TYPE NOT NULL := &2;
	max_book_no Books.b_no%TYPE;
	CURSOR cur IS SELECT b_no FROM Books WHERE b_no = book_no;
	not_found EXCEPTION;
BEGIN
	OPEN cur;
	FETCH cur INTO max_book_no;
	IF cur%NOTFOUND THEN
	RAISE not_found;
	END IF;
	UPDATE Books
	SET b_stock = b_stock + qty
	WHERE b_no = book_no;
	COMMIT;
	dbms_output.put_line('Success : Book Quantity added');
EXCEPTION
	WHEN not_found THEN
	dbms_output.put_line('Error : Book Not Found');
END;
/