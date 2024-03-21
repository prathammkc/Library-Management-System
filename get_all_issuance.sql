DECLARE
	student_name Students.st_name%TYPE;
	book_name Books.b_name%TYPE;
BEGIN
	FOR record IN (SELECT * FROM books_issued)
	LOOP
		SELECT st_name INTO student_name FROM Students
		WHERE st_no = record.st_no;
		SELECT b_name INTO book_name FROM Books
		WHERE b_no = record.b_no;
		dbms_output.put_line(''||student_name||' '||book_name);
	END LOOP;
END;
/
