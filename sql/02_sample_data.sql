-- =========================================================
-- Sample Data Insertions for Library Management System
-- =========================================================

-- 1. Student Table
INSERT INTO Student (Name, Email, Phone_No, Department, Year) VALUES
('Ananya Sharma', 'ananya.s@univ.edu', '9876543210', 'CSE', '3rd Year'),
('Rahul Verma', 'rahul.v@univ.edu', '9876543211', 'ECE', '2nd Year'),
('Priya Nair', 'priya.n@univ.edu', '9876543212', 'IT', '4th Year'),
('Karan Patel', 'karan.p@univ.edu', '9876543213', 'EEE', '1st Year');

-- 2. Author Table
INSERT INTO Author (Author_Name, Email, Country) VALUES
('E. F. Codd', 'efcodd@db.org', 'USA'),
('Abraham Silberschatz', 'silberschatz@cs.yale.edu', 'USA'),
('Robert C. Martin', 'unclebob@cleancoder.com', 'USA'),
('James Gosling', 'jgosling@java.net', 'Canada');

-- 3. Publisher Table
INSERT INTO Publisher (Publisher_Name, Address, Phone_No, Email) VALUES
('McGraw-Hill', 'New York, USA', '1800223123', 'contact@mcgrawhill.com'),
('Pearson Education', 'London, UK', '1800456789', 'info@pearson.com'),
('O\'Reilly Media', 'California, USA', '1800999888', 'support@oreilly.com');

-- 4. Category Table
INSERT INTO Category (Category_Name, Description) VALUES
('Database Systems', 'Books related to relational databases, SQL, and data modeling'),
('Software Engineering', 'Books covering software architecture, design patterns, and clean code'),
('Programming Languages', 'Books covering Object-Oriented programming, Java, Python, and C++');

-- 5. Library Table
INSERT INTO Library (Library_Name, Location, Contact_No, Email) VALUES
('Central Engineering Library', 'Main Campus, Block A', '040-12345678', 'library@univ.edu');

-- 6. Shelf Table
INSERT INTO Shelf (Shelf_Number, Location, Category_ID, Capacity) VALUES
('S-101', 'Ground Floor, Row 1', 1, 50),
('S-102', 'Ground Floor, Row 2', 2, 50),
('S-103', 'First Floor, Row 1', 3, 40);

-- 7. Librarian Table
INSERT INTO Librarian (Name, Email, Phone_No, Username, Password) VALUES
('Srinivas Rao', 'srinivas.l@univ.edu', '9123456780', 'admin_srinivas', 'pass1234'),
('Kavitha Reddy', 'kavitha.l@univ.edu', '9123456781', 'admin_kavitha', 'pass5678');

-- 8. Book Table
INSERT INTO Book (Title, ISBN, Author_ID, Publisher_ID, Category_ID, Price, Quantity) VALUES
('Database System Concepts', '978-0078022159', 2, 1, 1, 650.00, 10),
('Clean Code', '978-0132350884', 3, 2, 2, 550.00, 8),
('The Java Programming Language', '978-0321349804', 4, 2, 3, 480.00, 5),
('Relational Model for Database Management', '978-0201141924', 1, 2, 1, 720.00, 3);

-- 9. Book_Copy Table
INSERT INTO Book_Copy (Book_ID, Library_ID, Shelf_ID, Status, Purchase_Date) VALUES
(1, 1, 1, 'Available', '2023-01-15'),
(1, 1, 1, 'Issued', '2023-01-15'),
(2, 1, 2, 'Available', '2023-02-10'),
(3, 1, 3, 'Available', '2023-03-05');

-- 10. Issue Table (Issue_Borrow)
INSERT INTO Issue (Member_ID, Book_ID, Librarian_ID, Issue_Date, Due_Date) VALUES
(1, 1, 1, '2024-10-01', '2024-10-15'),
(2, 2, 2, '2024-10-05', '2024-10-19'),
(3, 3, 1, '2024-10-10', '2024-10-24');

-- 11. Return_Book Table
INSERT INTO Return_Book (Issue_ID, Return_Date, Fine_Amount, Librarian_ID) VALUES
(1, '2024-10-18', 30.00, 1),
(2, '2024-10-19', 0.00, 2);

-- 12. Fine Table
INSERT INTO Fine (Member_ID, Issue_ID, Fine_Amount, Fine_Date, Payment_Status) VALUES
(1, 1, 30.00, '2024-10-18', 'Paid');

-- 13. Reservation Table
INSERT INTO Reservation (Member_ID, Book_ID, Reservation_Date, Status) VALUES
(4, 1, '2024-10-12', 'Pending');

-- 14. Book_Review Table
INSERT INTO Book_Review (Member_ID, Book_ID, Rating, Review_Text, Review_Date) VALUES
(1, 1, 5, 'Excellent textbook for database fundamentals and SQL concepts.', '2024-10-20'),
(2, 2, 5, 'Must read for clean programming principles and design.', '2024-10-21');

-- 15. Fine_Payment Table
INSERT INTO Fine_Payment (Fine_ID, Member_ID, Amount_Paid, Payment_Date, Payment_Method, Payment_Status) VALUES
(1, 1, 30.00, '2024-10-20', 'UPI', 'Success');

## 1. SELECT * FROM Student;

| Member_ID | Name          | Email              | Phone_No   | Department | Year     |
| --------- | ------------- | ------------------ | ---------- | ---------- | -------- |
| 1         | Ananya Sharma | ananya.s\@univ.edu | 9876543210 | CSE        | 3rd Year |
| 2         | Rahul Verma   | rahul.v\@univ.edu  | 9876543211 | ECE        | 2nd Year |
| 3         | Priya Nair    | priya.n\@univ.edu  | 9876543212 | IT         | 4th Year |
| 4         | Karan Patel   | karan.p\@univ.edu  | 9876543213 | EEE        | 1st Year |

## 2. SELECT * FROM Author;

| Author_ID | Author_Name          | Email                     | Country |
| --------- | -------------------- | ------------------------- | ------- |
| 1         | E. F. Codd           | efcodd\@db.org            | USA     |
| 2         | Abraham Silberschatz | silberschatz\@cs.yale.edu | USA     |
| 3         | Robert C. Martin     | unclebob\@cleancoder.com  | USA     |
| 4         | James Gosling        | jgosling\@java.net        | Canada  |

## 3. SELECT * FROM Publisher;

| Publisher_ID | Publisher_Name    | Address         | Phone_No   | Email                   |
| ------------ | ----------------- | --------------- | ---------- | ----------------------- |
| 1            | McGraw-Hill       | New York, USA   | 1800223123 | contact\@mcgrawhill.com |
| 2            | Pearson Education | London, UK      | 1800456789 | info\@pearson.com       |
| 3            | O'Reilly Media    | California, USA | 1800999888 | support\@oreilly.com    |

## 4. SELECT * FROM Category;

| Category_ID | Category_Name         | Description                                                           |
| ----------- | --------------------- | --------------------------------------------------------------------- |
| 1           | Database Systems      | Books related to relational databases, SQL, and data modeling         |
| 2           | Software Engineering  | Books covering software architecture, design patterns, and clean code |
| 3           | Programming Languages | Books covering Object-Oriented programming, Java, Python, and C++     |

## 5. SELECT * FROM Library;

| Library_ID | Library_Name                | Location             | Contact_No   | Email             |
| ---------- | --------------------------- | -------------------- | ------------ | ----------------- |
| 1          | Central Engineering Library | Main Campus, Block A | 040-12345678 | library\@univ.edu |

## 6. SELECT * FROM  Shelf

| Shelf_ID | Shelf_Number | Location            | Category_ID | Capacity |
| -------- | ------------ | ------------------- | ----------- | -------- |
| 1        | S-101        | Ground Floor, Row 1 | 1           | 50       |
| 2        | S-102        | Ground Floor, Row 2 | 2           | 50       |
| 3        | S-103        | First Floor, Row 1  | 3           | 40       |

## 7. SELECT * FROM Librarian;

| Librarian_ID | Name          | Email                | Phone_No   | Username       | Password |
| ------------ | ------------- | -------------------- | ---------- | -------------- | -------- |
| 1            | Srinivas Rao  | srinivas.l\@univ.edu | 9123456780 | admin_srinivas | pass1234 |
| 2            | Kavitha Reddy | kavitha.l\@univ.edu  | 9123456781 | admin_kavitha  | pass5678 |

## 8. SELECT * FROM Book;

| Book_ID | Title                                    | ISBN           | Author_ID | Publisher_ID | Category_ID | Price  | Quantity |
| ------- | ---------------------------------------- | -------------- | --------- | ------------ | ----------- | ------ | -------- |
| 1       | Database System Concepts                 | 978-0078022159 | 2         | 1            | 1           | 650.00 | 10       |
| 2       | Clean Code                               | 978-0132350884 | 3         | 2            | 2           | 550.00 | 8        |
| 3       | The Java Programming Language            | 978-0321349804 | 4         | 2            | 3           | 480.00 | 5        |
| 4       | Relational Model for Database Management | 978-0201141924 | 1         | 2            | 1           | 720.00 | 3        |

## 9. SELECT * FROM  Book_Copy;

| Copy_ID | Book_ID | Library_ID | Shelf_ID | Status    | Purchase_Date |
| ------- | ------- | ---------- | -------- | --------- | ------------- |
| 1       | 1       | 1          | 1        | Available | 2023-01-15    |
| 2       | 1       | 1          | 1        | Issued    | 2023-01-15    |
| 3       | 2       | 1          | 2        | Available | 2023-02-10    |
| 4       | 3       | 1          | 3        | Available | 2023-03-05    |

## 10. SELECT * FROM Issue;

| Issue_ID | Member_ID | Book_ID | Librarian_ID | Issue_Date | Due_Date   |
| -------- | --------- | ------- | ------------ | ---------- | ---------- |
| 1        | 1         | 1       | 1            | 2024-10-01 | 2024-10-15 |
| 2        | 2         | 2       | 2            | 2024-10-05 | 2024-10-19 |
| 3        | 3         | 3       | 1            | 2024-10-10 | 2024-10-24 |

## 11. SELECT * FROM Return_Book;

| Return_ID | Issue_ID | Return_Date | Fine_Amount | Librarian_ID |
| --------- | -------- | ----------- | ----------- | ------------ |
| 1         | 1        | 2024-10-18  | 30.00       | 1            |
| 2         | 2        | 2024-10-19  | 0.00        | 2            |

## 12. SELECT * FROM Fine;

| Fine_ID | Member_ID | Issue_ID | Fine_Amount | Fine_Date  | Payment_Status |
| ------- | --------- | -------- | ----------- | ---------- | -------------- |
| 1       | 1         | 1        | 30.00       | 2024-10-18 | Paid           |

## 13. SELECT * FROM Reservation;

| Reservation_ID | Member_ID | Book_ID | Reservation_Date | Status  |
| -------------- | --------- | ------- | ---------------- | ------- |
| 1              | 4         | 1       | 2024-10-12       | Pending |

## 14. SELECT * FROM Book_Review;

| Review_ID | Member_ID | Book_ID | Rating | Review_Text                                                    | Review_Date |
| --------- | --------- | ------- | ------ | -------------------------------------------------------------- | ----------- |
| 1         | 1         | 1       | 5      | Excellent textbook for database fundamentals and SQL concepts. | 2024-10-20  |
| 2         | 2         | 2       | 5      | Must read for clean programming principles and design.         | 2024-10-21  |

## 15. SELECT * FROM Fine_Payment;

| Payment_ID | Fine_ID | Member_ID | Amount_Paid | Payment_Date | Payment_Method | Payment_Status |
| ---------- | ------- | --------- | ----------- | ------------ | -------------- | -------------- |
| 1          | 1       | 1         | 30.00       | 2024-10-20   | UPI            | Success        |

