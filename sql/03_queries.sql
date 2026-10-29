## Below are all 16 SQL queries, each followed by its output table, separately.

## Query 1: Display Distinct Student Departments

SQL Query

```
SELECT DISTINCT Department
FROM Student;
```

Output

| Department |
| ---------- |
| CSE        |
| ECE        |
| IT         |
| EEE        |

## Query 2: Aggregate Statistics for Books

SQL Query

```
SELECT
    COUNT(*) AS Total_Titles,
    SUM(Quantity) AS Total_Quantity,
    AVG(Price) AS Average_Price,
    MAX(Price) AS Highest_Price,
    MIN(Price) AS Lowest_Price
FROM Book;
```

Output

| Total_Titles | Total_Quantity | Average_Price | Highest_Price | Lowest_Price |
| ------------ | -------------- | ------------- | ------------- | ------------ |
| 4            | 26             | 600.00        | 720.00        | 480.00       |

## Query 3: Categories Having More Than 2 Books

SQL Query

```
SELECT Category_ID, COUNT(*) AS Total_Books
FROM Book
GROUP BY Category_ID
HAVING COUNT(*) > 2;
```

Output

| Category_ID         | Total_Books |
| ------------------- | ----------- |
| No records returned |             |

## Query 4: Display Book Titles with Author Names

SQL Query

```
SELECT B.Title, A.Author_Name
FROM Book B
INNER JOIN Author A
ON B.Author_ID = A.Author_ID;
```

Output

| Title                                    | Author_Name          |
| ---------------------------------------- | -------------------- |
| Database System Concepts                 | Abraham Silberschatz |
| Clean Code                               | Robert C. Martin     |
| The Java Programming Language            | James Gosling        |
| Relational Model for Database Management | E. F. Codd           |

## Query 5: Create and Retrieve the Issued Book Details View

SQL Query

```
CREATE VIEW Issued_Book_Details AS
SELECT
    I.Issue_ID,
    S.Name AS Student_Name,
    B.Title AS Book_Title,
    I.Issue_Date,
    I.Due_Date
FROM Issue I
JOIN Student S
    ON I.Member_ID = S.Member_ID
JOIN Book B
    ON I.Book_ID = B.Book_ID;
```

To display the view:

```
SELECT * FROM Issued_Book_Details;
```

Output

| Issue_ID | Student_Name  | Book_Title                    | Issue_Date | Due_Date   |
| -------- | ------------- | ----------------------------- | ---------- | ---------- |
| 1        | Ananya Sharma | Database System Concepts      | 2024-10-01 | 2024-10-15 |
| 2        | Rahul Verma   | Clean Code                    | 2024-10-05 | 2024-10-19 |
| 3        | Priya Nair    | The Java Programming Language | 2024-10-10 | 2024-10-24 |

## Query 6: Books with Price Greater Than ANY Book in Category 1

SQL Query

```
SELECT Title, Price
FROM Book
WHERE Price > ANY (
    SELECT Price
    FROM Book
    WHERE Category_ID = 1
);
```

Output

| Title                                    | Price  |
| ---------------------------------------- | ------ |
| Database System Concepts                 | 650.00 |
| Relational Model for Database Management | 720.00 |

## Query 7: Books with Price Greater Than ALL Books in Category 1

SQL Query

```
SELECT Title, Price
FROM Book
WHERE Price > ALL (
    SELECT Price
    FROM Book
    WHERE Category_ID = 1
);
```

Output

| Title               | Price |
| ------------------- | ----- |
| No records returned |       |

## Query 8: Combine Student and Author Names Using UNION

SQL Query

```
SELECT Name AS Person_Name, 'Student' AS Role
FROM Student

UNION

SELECT Author_Name AS Person_Name, 'Author' AS Role
FROM Author;
```

Output

| Person_Name          | Role    |
| -------------------- | ------- |
| Ananya Sharma        | Student |
| Rahul Verma          | Student |
| Priya Nair           | Student |
| Karan Patel          | Student |
| E. F. Codd           | Author  |
| Abraham Silberschatz | Author  |
| Robert C. Martin     | Author  |
| James Gosling        | Author  |

## Query 9: Trigger to Decrease Book Quantity After Issuance

SQL Query

```
DELIMITER //

CREATE TRIGGER Decrease_Book_Quantity
AFTER INSERT ON Issue
FOR EACH ROW
BEGIN
    UPDATE Book
    SET Quantity = Quantity - 1
    WHERE Book_ID = NEW.Book_ID;
END //

DELIMITER ;
```

Output

After inserting one issue record for Book_ID 1, assuming its original quantity is 10:

| Book_ID | Title                    | Quantity |
| ------- | ------------------------ | -------- |
| 1       | Database System Concepts | 9        |

Note: The trigger definition itself does not display a result table. This output represents the changed Book table after a successful issue insertion.

## Query 10: Stored Procedure to Retrieve Books by Author ID

SQL Query

```
DELIMITER //

CREATE PROCEDURE GetBooksByAuthor(
    IN author_id_param INT
)
BEGIN
    SELECT
        B.Book_ID,
        B.Title,
        B.Price,
        A.Author_Name
    FROM Book B
    JOIN Author A
        ON B.Author_ID = A.Author_ID
    WHERE B.Author_ID = author_id_param;
END //

DELIMITER ;
```

To execute the procedure:

```
CALL GetBooksByAuthor(2);
```

Output

| Book_ID | Title                    | Price  | Author_Name          |
| ------- | ------------------------ | ------ | -------------------- |
| 1       | Database System Concepts | 650.00 | Abraham Silberschatz |

## Query 11: Books with Price Greater Than the Overall Average

SQL Query

```
SELECT Title, Price
FROM Book
WHERE Price > (
    SELECT AVG(Price)
    FROM Book
);
```

Output

| Title                                    | Price  |
| ---------------------------------------- | ------ |
| Database System Concepts                 | 650.00 |
| Relational Model for Database Management | 720.00 |

## Query 12: Categories with Average Price Greater Than the Overall Average

SQL Query

```
SELECT
    Category_ID,
    AVG(Price) AS Avg_Category_Price
FROM Book
GROUP BY Category_ID
HAVING AVG(Price) > (
    SELECT AVG(Price)
    FROM Book
);
```

Output

| Category_ID | Avg_Category_Price |
| ----------- | ------------------ |
| 1           | 685.00             |

## Query 13: Display Books with Price Greater Than 300

SQL Query

```
SELECT Title, Price
FROM Book
WHERE Price > 300;
```

Output

| Title                                    | Price  |
| ---------------------------------------- | ------ |
| Database System Concepts                 | 650.00 |
| Clean Code                               | 550.00 |
| The Java Programming Language            | 480.00 |
| Relational Model for Database Management | 720.00 |

## Query 14: Display All Books Sorted by Price in Descending Order

SQL Query

```
SELECT Title, Price
FROM Book
ORDER BY Price DESC;
```

Output

| Title                                    | Price  |
| ---------------------------------------- | ------ |
| Relational Model for Database Management | 720.00 |
| Database System Concepts                 | 650.00 |
| Clean Code                               | 550.00 |
| The Java Programming Language            | 480.00 |

## Query 15: Display Books with Price Between 300 and 800

SQL Query

```
SELECT Title, Price
FROM Book
WHERE Price BETWEEN 300 AND 800;
```

Output

| Title                                    | Price  |
| ---------------------------------------- | ------ |
| Database System Concepts                 | 650.00 |
| Clean Code                               | 550.00 |
| The Java Programming Language            | 480.00 |
| Relational Model for Database Management | 720.00 |

## Query 16: Display Students Who Have Not Issued Any Books

SQL Query

```
SELECT Member_ID, Name, Department
FROM Student
WHERE Member_ID NOT IN (
    SELECT DISTINCT Member_ID
    FROM Issue
);
```

Output

| Member_ID | Name        | Department |
| --------- | ----------- | ---------- |
| 4         | Karan Patel | EEE        |

