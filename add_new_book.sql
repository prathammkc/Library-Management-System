DECLARE
	book_no Books.b_no%TYPE;
	book_name VARCHAR2(60) NOT NULL := &1;
	author_name VARCHAR2(15) := &2;
	book_stock NUMBER(2) := &3;
BEGIN
	SELECT MAX(b_no) INTO book_no FROM Books;

	INSERT INTO Books
	VALUES(
		book_no + 1,
		book_name,
		author_name,
		book_stock
	);
	COMMIT;

	dbms_output.put_line('Success : Book added to library');
END;
/