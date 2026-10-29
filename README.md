# 📚 Library Management System — Database Management System Project

A comprehensive **Relational Database Management System (RDBMS)** designed to automate core library operations, including book cataloging, member registration, circulation tracking, fine settlements, reservations, and analytics [1, 4].

---

## 📌 Table of Contents
- [Project Overview](#-project-overview)
- [Key Features](#-key-features)
- [Database Schema (15 Tables)](#-database-schema-15-tables)
- [Advanced SQL Automations & Features](#-advanced-sql-automations--features)
- [Database Setup & Execution](#-database-setup--execution)
- [Repository Structure](#-repository-structure)
- [Project Team](#-project-team)

---

## 📖 Project Overview
The primary purpose of this project is to eliminate manual library record-keeping by implementing a structured MySQL database [1, 4]. The database handles transactions between library members, librarians, and physical assets while ensuring data integrity, security, and scalability [1, 5, 6].

---




## ✨ Key Features
- **User & Member Management:** Tracks member details (department, academic year) and manages role-based access for students and librarians [2, 7, 8].
- **Resource Cataloging:** Stores book metadata, categories, shelves, publishers, and individual physical copy statuses (available, issued, damaged, lost) [9-12].
- **Circulation Processing:** Records issue and return operations along with due dates and issuing librarian details [12, 13].
- **Fine & Payment Tracking:** Calculates overdue fines, records payment methods, and tracks payment statuses [13, 14].
- **Reservations & Reviews:** Allows members to reserve checked-out books and post book ratings and feedback [14, 15].

---

## 🗄️ Database Schema (15 Tables)
The system is built upon **15 interconnected tables** linked through primary keys (PK) and foreign keys (FK) [1, 2]:

1. **`Student`** — Stores library member credentials, contact info, department, and academic year [2, 7].
2. **`Author`** — Contains author profiles and origin countries [2, 7].
3. **`Publisher`** — Maintains publisher contact and address details [2, 9].
4. **`Category`** — Classifies books into distinct genres/topics [2, 9].
5. **`Library`** — Holds general library branch information [2, 10].
6. **`Shelf`** — Maps physical storage locations, categories, and capacities [2, 10].
7. **`Librarian`** — Manages administrator credentials and authentication details [2, 16].
8. **`Book`** — Stores core book metadata (ISBN, price, total quantity, category, publisher) [2, 11, 16].
9. **`Book_Copy`** — Tracks individual physical copies, shelf assignments, and physical availability statuses [2, 11, 12].
10. **`Issue_Borrow` (`Issue`)** — Records loan transactions, member assignments, issue dates, and due dates [2, 12].
11. **`Return_Book` (`Return`)** — Logs return transactions, return dates, and calculated fine amounts [2, 13].
12. **`Fine`** — Logs overdue fines generated per issue transaction [2, 13].
13. **`Reservation`** — Tracks pending, completed, or canceled book reservations [2, 15].
14. **`Book_Review`** — Captures member ratings and feedback text [2, 14, 15].
15. **`Fine_Payment`** — Records fine settlement transactions, payment methods, and statuses [2, 14].

---

## ⚡ Advanced SQL Automations & Features
This project showcases practical DBMS concepts using MySQL [1, 17]:
- **Automated Triggers:** Implements a database trigger to automatically decrement book inventory (`Quantity`) upon book issuance [18].
- **Stored Procedures:** Features procedural logic to retrieve all publications by a specific author [18].
- **Database Views:** Integrates custom views to consolidate active loan details across members, books, and issue dates [19].
- **Analytical Queries:** Utilizes aggregate functions, nested subqueries (`ANY`, `ALL`), set operators (`UNION`), and conditional logic for operational reporting [3, 18, 19].

---

## 🛠️ Database Setup & Execution

### **Prerequisites**
- MySQL Server 8.0+ or MySQL Workbench installed.

### **Steps to Run**
1. **Clone the Repository:**
   ```bash
   git clone "Library_Management_System_Project](https://github.com/ramavaishnavi55-glitch/Library_Management_System_Project.git"
   cd Library-Management-System-DBMS


## Repository Structure
.
├── README.md                 # Project Overview & Setup Instructions
├── sql/
│   ├── 01_schema.sql         # Table definitions (DDL)
│   ├── 02_sample_data.sql    # Sample data insertions (DML)
│   └── 03_queries.sql        # Triggers, Procedures, Views & Analytical Queries
├── docs/
│   ├── ER_Diagram.png        # Entity-Relationship Diagram
│   └── Documentation.docx    # Full DBMS Project Report
└── LICENSE                   # License terms

## Project Team

S.No |   Member Name  |        Roll Number
1    |  G. Indu Shivani |      25WH1A6665
2    | A. Niharika      |      25WH1A6672
3    | G. Sharanya      |      25WH1A6679
4    | B. Bhavya Sri    |      25WH1A6686
5    |  C. Deepika      |      25WH1A6693
6    | N. Manasa        |      25WH1A66A0
7    | N. Poojitha      |      25WH1A66A7
8    | S. Raghavi       |      25WH1A66B5
9    | A. Rama Vaishnavi|      25WH1A66C2
10   | Varshitha        |      26WH5A6608
