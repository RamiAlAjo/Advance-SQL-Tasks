# Advance SQL Tasks (Used Commands)

[//]: # "To Preview The Output Press (Ctrl + k) followed by (v)  "

---

## Task 1: School Database:

#### Step 1. Creating Tables:

```sql
CREATE DATABASE SchoolDB_rami;
USE SchoolDB_rami;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Email VARCHAR(100)
);

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

```

#### Step 2. Inserting Data:

```sql
INSERT INTO Students (StudentID, FirstName, LastName, BirthDate, Email)
VALUES
(1, 'John', 'Doe', '2005-04-23', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '2006-08-15', 'jane.smith@example.com'),
(3, 'Emily', 'Johnson', '2005-12-05', 'emily.j@example.com'),
(4, 'Michael', 'Brown', '2007-01-22', 'michael.b@example.com'),
(5, 'Sarah', 'Davis', '2006-11-30', 'sarah.d@example.com');

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email)
VALUES
(1, 'Robert', 'Williams', 'robert.williams@example.com'),
(2, 'Linda', 'Taylor', 'linda.taylor@example.com'),
(3, 'James', 'Brown', 'james.brown@example.com'),
(4, 'Patricia', 'Johnson', 'patricia.johnson@example.com'),
(5, 'Jennifer', 'Garcia', 'jennifer.garcia@example.com');

INSERT INTO Classes (ClassID, ClassName, TeacherID)
VALUES
(1, 'Math', 1),
(2, 'Science', 2),
(3, 'History', 3),
(4, 'Art', 4),
(5, 'Music', 5);

INSERT INTO Enrollments (EnrollmentID, StudentID, ClassID, EnrollmentDate)
VALUES
(1, 1, 1, '2023-01-10'),
(2, 2, 2, '2023-01-15'),
(3, 3, 3, '2023-01-20'),
(4, 4, 4, '2023-01-25'),
(5, 5, 5, '2023-01-30');
```

### SQL Tasks (Task 1):

1. SQL INSERT INTO Statement

```sql
INSERT INTO Students (StudentID, FirstName, LastName, BirthDate, Email)
VALUES (6, 'Anna', 'White', '2007-03-14', 'anna.white@example.com');
```

2. SQL SELECT Statement

```sql
SELECT Classes.ClassName, Teachers.FirstName, Teachers.LastName
FROM Classes
JOIN Teachers ON Classes.TeacherID = Teachers.TeacherID;
```

3. SQL UPDATE Statement

```sql
UPDATE Teachers
SET Email = 'linda.newemail@example.com'
WHERE TeacherID = 2;
```

4. SQL DELETE Statement

```sql
DELETE FROM Enrollments
WHERE StudentID = 3;
```

---

---

## Task 2: Library Database

#### Step 1. Creating Tables:

```sql
CREATE DATABASE LibraryDB_rami;
USE LibraryDB_rami;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    PublicationDate DATE
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    JoinDate DATE
);

CREATE TABLE BorrowedBooks (
    BorrowID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
```

#### Step 2. Inserting Data:

```sql
INSERT INTO Books (BookID, Title, AuthorID, Genre, Price, PublicationDate)
VALUES
(1, 'The Great Gatsby', 1, 'Fiction', 15.99, '1925-04-10'),
(2, '1984', 2, 'Dystopian', 12.99, '1949-06-08'),
(3, 'To Kill a Mockingbird', 3, 'Fiction', 10.99, '1960-07-11');

INSERT INTO Authors (AuthorID, Name, Country)
VALUES
(1, 'F. Scott Fitzgerald', 'USA'),
(2, 'George Orwell', 'UK'),
(3, 'Harper Lee', 'USA');

INSERT INTO Members (MemberID, FirstName, LastName, Email, JoinDate)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2022-12-15'),
(2, 'Jane', 'Smith', 'jane.smith@library.com', '2023-02-10'),
(3, 'Emily', 'Johnson', 'emily.j@example.com', '2023-03-05'),
(4, 'Michael', 'Brown', 'michael.b@library.com', '2023-04-12'),
(5, 'Sarah', 'Davis', 'sarah.d@example.com', '2023-06-21');

INSERT INTO BorrowedBooks (BorrowID, BookID, MemberID, BorrowDate, ReturnDate)
VALUES
(1, 1, 2, '2023-02-11', '2023-02-18'),
(2, 1, 2, '2023-02-20', '2023-02-27'),
(3, 2, 3, '2023-03-06', '2023-03-13'),
(4, 3, 3, '2023-03-20', '2023-03-27'),
(5, 3, 4, '2023-04-13', '2023-04-20'),
(6, 2, 4, '2023-04-25', '2023-05-02'),
(7, 1, 4, '2023-05-10', '2023-05-17'),
(8, 3, 5, '2023-06-22', '2023-06-29');
```

### SQL Tasks (Task 2):

1. SQL INSERT INTO Statement

```sql
INSERT INTO Books (BookID, Title, AuthorID, Genre, Price, PublicationDate)
VALUES (4, 'The Great Gatsby', 1, 'Fiction', 15.99, '1925-04-10');
```

2. SQL SELECT Statement

```sql
SELECT * FROM Books WHERE AuthorID = 1;
```

3. SQL UPDATE Statement

```sql
UPDATE Books
SET Price = 20.99
WHERE BookID = 2;
```

4. SQL DELETE Statement

```sql
DELETE FROM Books WHERE BookID = 3;
```

5. SQL WHERE Clause

```sql
SELECT * FROM Books WHERE Genre = 'Science Fiction';
```

6. SQL AND, OR, and NOT Operators

```sql
SELECT * FROM Books
WHERE (Genre = 'Fiction' AND Price < 20) OR AuthorID <> 2;
```

7. SQL ORDER BY Keyword

```sql
SELECT * FROM Books
ORDER BY PublicationDate DESC;
```

8. SQL MIN() and MAX() Functions

```sql
SELECT MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM Books;
```

9. SQL COUNT(), AVG(), and SUM() Functions

```sql
SELECT COUNT(*) AS TotalBooks, AVG(Price) AS AvgPrice, SUM(Price) AS TotalPrice FROM Books;
```

10. SQL LIKE Operator

```sql
SELECT * FROM Books WHERE Title LIKE 'The%';
```

11. SQL GROUP BY Statement

```sql
SELECT Genre, COUNT(*) AS Count FROM Books GROUP BY Genre;
```

12. SQL INNER JOIN Keyword

```sql
SELECT Books.Title, Authors.Name
FROM Books
INNER JOIN Authors ON Books.AuthorID = Authors.AuthorID;
```

---

---

## Task 3: library Member Information

### SQL Code(Task 3):

```sql
SELECT Members.FirstName, Members.LastName, Members.Email, COUNT(BorrowedBooks.BorrowID) AS BooksBorrowed
FROM Members
JOIN BorrowedBooks ON Members.MemberID = BorrowedBooks.MemberID
WHERE Members.JoinDate > '2023-01-01'
AND Members.Email NOT LIKE '%@example.com'
GROUP BY Members.MemberID
HAVING COUNT(BorrowedBooks.BorrowID) > 3
ORDER BY Members.LastName ASC;
```

---

---

## Task 4: Additional Tasks Library Management System

Task 1: SQL MIN() and MAX() Functions

```sql
SELECT MIN(Books.Price) AS MinPrice, MAX(Books.Price) AS MaxPrice
FROM Books
JOIN BorrowedBooks ON Books.BookID = BorrowedBooks.BookID
JOIN Members ON BorrowedBooks.MemberID = Members.MemberID
WHERE Members.JoinDate > '2023-01-01';
```

Task 2: SQL COUNT(), AVG(), and SUM() Functions

```sql
SELECT COUNT(Books.BookID) AS TotalBorrowed, AVG(Books.Price) AS AvgPrice, SUM(Books.Price) AS TotalPrice
FROM Books
JOIN BorrowedBooks ON Books.BookID = BorrowedBooks.BookID
JOIN Members ON BorrowedBooks.MemberID = Members.MemberID
WHERE Members.JoinDate > '2023-01-01';
```

Task 3: SQL LIKE Operator

```sql
SELECT * FROM Members WHERE LastName LIKE 'J%';
```

Task 4: SQL GROUP BY Statement

```sql
SELECT Members.FirstName, Members.LastName, COUNT(BorrowedBooks.BookID) AS BooksBorrowed
FROM Members
JOIN BorrowedBooks ON Members.MemberID = BorrowedBooks.MemberID
GROUP BY Members.MemberID;
```

Task 5: SQL INNER JOIN Keyword

```sql
SELECT Members.FirstName, Members.LastName, Books.Title
FROM Members
JOIN BorrowedBooks ON Members.MemberID = BorrowedBooks.MemberID
JOIN Books ON BorrowedBooks.BookID = Books.BookID;
```

---

---
