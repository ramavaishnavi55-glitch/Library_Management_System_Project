### Database Schema Tables

#### 1. Student
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Member_ID` | **PK** | Unique ID assigned to each library member. |
| `Name` | | Full name of the member. |
| `Email` | | Email address of the member. |
| `Phone_No` | | Contact number of the member. |
| `Department` | | Department or branch of study. |
| `Year` | | Current academic year. |

#### 2. Author
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Author_ID` | **PK** | Unique ID assigned to each author. |
| `Author_Name` | | Full name of the author. |
| `Email` | | Email address of the author. |
| `Country` | | Country of origin. |

#### 3. Publisher
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Publisher_ID` | **PK** | Unique ID assigned to each publisher. |
| `Publisher_Name` | | Name of the publishing company. |
| `Address` | | Physical address of the publisher. |
| `Phone_No` | | Contact phone number. |
| `Email` | | Official email address. |

#### 4. Category
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Category_ID` | **PK** | Unique ID assigned to each category. |
| `Category_Name` | | Name of the category/genre. |
| `Description` | | Brief explanation of the category. |

#### 5. Library
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Library_ID` | **PK** | Unique ID assigned to the library branch. |
| `Library_Name` | | Name of the library. |
| `Location` | | Physical location/address. |
| `Contact_No` | | Official contact number. |
| `Email` | | Official email address. |

#### 6. Shelf
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Shelf_ID` | **PK** | Unique ID assigned to each shelf. |
| `Shelf_Number` | | Shelf identification number. |
| `Location` | | Physical location of the shelf inside the library. |
| `Category_ID` | **FK** | Links to the book category assigned to the shelf. |
| `Capacity` | | Maximum number of books the shelf can hold. |

#### 7. Librarian
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Librarian_ID` | **PK** | Unique ID assigned to each librarian. |
| `Name` | | Full name of the librarian. |
| `Email` | | Contact email address. |
| `Phone_No` | | Contact phone number. |
| `Username` | | System login username. |
| `Password` | | System authentication password. |

#### 8. Book
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Book_ID` | **PK** | Unique ID assigned to each title. |
| `Title` | | Title of the book. |
| `ISBN` | | International Standard Book Number. |
| `Author_ID` | **FK** | Links to the book author. |
| `Publisher_ID` | **FK** | Links to the publisher. |
| `Category_ID` | **FK** | Links to the category. |
| `Price` | | Price of the book. |
| `Quantity` | | Total available copies in stock. |

#### 9. Book_Copy
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Copy_ID` | **PK** | Unique ID assigned to each physical copy. |
| `Book_ID` | **FK** | Links to the parent book title. |
| `Library_ID` | **FK** | Links to the library branch. |
| `Shelf_ID` | **FK** | Links to the assigned shelf location. |
| `Status` | | Availability status (`Available`, `Issued`, `Damaged`, `Lost`). |
| `Purchase_Date` | | Date the copy was acquired. |

#### 10. Issue
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Issue_ID` | **PK** | Unique transaction ID. |
| `Member_ID` | **FK** | Links to the borrowing student member. |
| `Book_ID` | **FK** | Links to the issued book. |
| `Librarian_ID` | **FK** | Links to the issuing librarian. |
| `Issue_Date` | | Date the book was borrowed. |
| `Due_Date` | | Scheduled return deadline. |

#### 11. Return_Book
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Return_ID` | **PK** | Unique return transaction ID. |
| `Issue_ID` | **FK** | Links to the original loan record. |
| `Return_Date` | | Actual date the book was returned. |
| `Fine_Amount` | | Late return penalty fee (ifThe reason table formatting disappears when you paste it into GitHub is that GitHub's `README.md` editor requires **raw Markdown text** (using pipe `|` characters) rather than visual/rich tables copied from a PDF or webpage.

#### 12. Fine
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Fine_ID` | **PK** | A unique ID assigned to each fine. |
| `Member_ID` | **FK** | Identifies the member who has been charged the fine. |
| `Issue_ID` | **FK** | Identifies the book issue for which the fine was generated. |
| `Fine_Amount` | | The amount of fine charged to the member. |
| `Fine_Date` | | The date on which the fine was generated. |
| `Payment_Status` | | Indicates whether the fine has been paid or is still pending. |

#### 13. Reservation
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Reservation_ID` | **PK** | A unique ID assigned to each reservation. |
| `Member_ID` | **FK** | Identifies the member who reserved the book. |
| `Book_ID` | **FK** | Identifies the book being reserved. |
| `Reservation_Date` | | The date on which the reservation was made. |
| `Status` | | Indicates whether the reservation is pending, completed, or cancelled. |

#### 14. Book_Review
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Review_ID` | **PK** | A unique ID assigned to each review. |
| `Member_ID` | **FK** | Identifies the member who submitted the review. |
| `Book_ID` | **FK** | Identifies the book being reviewed. |
| `Rating` | | Represents the rating given to the book by the member. |
| `Review_Text` | | Contains the comments or feedback provided by the member. |
| `Review_Date` | | The date on which the review was submitted. |

#### 15. Fine_Payment
| Attribute | Key | Description |
| :--- | :--- | :--- |
| `Payment_ID` | **PK** | A unique ID assigned to each fine payment. |
| `Fine_ID` | **FK** | Identifies the fine being paid. |
| `Member_ID` | **FK** | Identifies the member making the payment. |
| `Amount_Paid` | | The amount paid by the member. |
| `Payment_Date` | | The date on which the payment was made. |
| `Payment_Method` | | Indicates the method used to pay the fine. |
| `Payment_Status` | | Indicates whether the payment was successful or pending. |


-- =========================================================
-- Library Management System Database Schema
-- =========================================================

CREATE TABLE Student (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone_No VARCHAR(15),
    Department VARCHAR(50),
    Year VARCHAR(10)
);

CREATE TABLE Author (
    Author_ID INT PRIMARY KEY AUTO_INCREMENT,
    Author_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Publisher (
    Publisher_ID INT PRIMARY KEY AUTO_INCREMENT,
    Publisher_Name VARCHAR(100) NOT NULL,
    Address TEXT,
    Phone_No VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(50) NOT NULL,
    Description TEXT
);

CREATE TABLE Library (
    Library_ID INT PRIMARY KEY AUTO_INCREMENT,
    Library_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Contact_No VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Shelf (
    Shelf_ID INT PRIMARY KEY AUTO_INCREMENT,
    Shelf_Number VARCHAR(20) NOT NULL,
    Location VARCHAR(100),
    Category_ID INT,
    Capacity INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

CREATE TABLE Librarian (
    Librarian_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone_No VARCHAR(15),
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL
);

CREATE TABLE Book (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Author_ID INT,
    Publisher_ID INT,
    Category_ID INT,
    Price DECIMAL(10,2),
    Quantity INT DEFAULT 0,
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

CREATE TABLE Book_Copy (
    Copy_ID INT PRIMARY KEY AUTO_INCREMENT,
    Book_ID INT,
    Library_ID INT,
    Shelf_ID INT,
    Status VARCHAR(20) DEFAULT 'Available',
    Purchase_Date DATE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Library_ID) REFERENCES Library(Library_ID),
    FOREIGN KEY (Shelf_ID) REFERENCES Shelf(Shelf_ID)
);

CREATE TABLE Issue (
    Issue_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT,
    Book_ID INT,
    Librarian_ID INT,
    Issue_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    FOREIGN KEY (Member_ID) REFERENCES Student(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Librarian_ID) REFERENCES Librarian(Librarian_ID)
);

CREATE TABLE Return_Book (
    Return_ID INT PRIMARY KEY AUTO_INCREMENT,
    Issue_ID INT,
    Return_Date DATE NOT NULL,
    Fine_Amount DECIMAL(10,2) DEFAULT 0.00,
    Librarian_ID INT,
    FOREIGN KEY (Issue_ID) REFERENCES Issue(Issue_ID),
    FOREIGN KEY (Librarian_ID) REFERENCES Librarian(Librarian_ID)
);

CREATE TABLE Fine (
    Fine_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT,
    Issue_ID INT,
    Fine_Amount DECIMAL(10,2) NOT NULL,
    Fine_Date DATE NOT NULL,
    Payment_Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (Member_ID) REFERENCES Student(Member_ID),
    FOREIGN KEY (Issue_ID) REFERENCES Issue(Issue_ID)
);

CREATE TABLE Reservation (
    Reservation_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT,
    Book_ID INT,
    Reservation_Date DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (Member_ID) REFERENCES Student(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE Book_Review (
    Review_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT,
    Book_ID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review_Text TEXT,
    Review_Date DATE,
    FOREIGN KEY (Member_ID) REFERENCES Student(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE Fine_Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Fine_ID INT,
    Member_ID INT,
    Amount_Paid DECIMAL(10,2) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Method VARCHAR(30),
    Payment_Status VARCHAR(20) DEFAULT 'Success',
    FOREIGN KEY (Fine_ID) REFERENCES Fine(Fine_ID),
    FOREIGN KEY (Member_ID) REFERENCES Student(Member_ID)
);
