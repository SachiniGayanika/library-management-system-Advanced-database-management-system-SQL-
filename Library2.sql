USE LibraryDB;

CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY IDENTITY(1,1),
  AuthorName NVARCHAR(100) NOT NULL,
  AuthorBio NVARCHAR(MAX),
  CONSTRAINT CK_AuthorBioLength CHECK(LEN(AuthorBio) <= 1000)
);

CREATE TABLE Publishers (
  PublisherID INT PRIMARY KEY IDENTITY(1,1),
  PublisherName NVARCHAR(100) NOT NULL,
  PublisherAddress NVARCHAR(255),
  CONSTRAINT CK_PublisherNameLength CHECK(LEN(PublisherName) <= 100)
);

CREATE TABLE Books (
  BookID INT PRIMARY KEY IDENTITY(1,1),
  Title NVARCHAR(255) NOT NULL,
  AuthorID INT,
  PublisherID INT,
  ISBN NVARCHAR(13),
  Genre NVARCHAR(50),
  Quantity INT NOT NULL CHECK(Quantity >= 0),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
  FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

CREATE TABLE Members (
  MemberID INT PRIMARY KEY IDENTITY(1,1),
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL,
  Address NVARCHAR(255),
  Phone NVARCHAR(15),
  Email NVARCHAR(100),
  CONSTRAINT CK_Phone CHECK(Phone LIKE '[0-9]%'),
  CONSTRAINT CK_Email CHECK(Email LIKE '%@%.%')
);

CREATE TABLE BorrowedBooks (
  BorrowID INT PRIMARY KEY IDENTITY(1,1),
  MemberID INT NOT NULL,
  BookID INT NOT NULL,
  BorrowDate DATE NOT NULL,
  ReturnDate DATE,
  CONSTRAINT FK_MemberID FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
  CONSTRAINT FK_BookID FOREIGN KEY(BookID) REFERENCES Books(BookID),
  CONSTRAINT CK_ReturnDate CHECK(ReturnDate >= BorrowDate OR ReturnDate IS NULL)
);

INSERT INTO Authors (AuthorName, AuthorBio) VALUES('John Doe', 'Author of various fiction novels.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Jane Smith', 'Experienced non-fiction writer.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Bob Johnson', 'Mystery and thriller author.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Emily White', 'Sci-fi enthusiast and writer.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Michael Brown', 'Historical fiction specialist.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Alice Green', 'Children''s book author.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('David Miller', 'Poet and essayist.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Sarah Turner', 'Fantasy fiction creator.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Chris Evans', 'Science writer and researcher.');
INSERT INTO Authors (AuthorName, AuthorBio) VALUES('Olivia Parker', 'Romance novel expert.');




INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('ABC Publications', '123 Main Street, Cityville');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('XYZ Books', '456 Oak Avenue, Townsville');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Book Haven', '789 Maple Road, Villagetown');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Novel World', '101 Pine Lane, Bookland');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Ink Press', '202 Cedar Street, Readville');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Page Turner Publishing', '303 Elm Street, Booktown');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Bookshelf Publishers', '505 Willow Lane, Storytown');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Best Books Co.', '404 Birch Avenue, Libraryville');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Literary Dreams', '606 Walnut Road, Novelville');
INSERT INTO Publishers (PublisherName, PublisherAddress) VALUES('Paperback Paradise', '707 Spruce Street, Fictiontown');




INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('The Lost Key', 1, 1, '9781234567890', 'Mystery', 50);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Beyond the Horizon', 2, 2, '9782345678901', 'Non-fiction', 30);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Whispers in the Shadows', 3, 3, '9783456789012', 'Thriller', 40);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Galactic Odyssey', 4, 4, '9784567890123', 'Sci-fi', 25);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Echoes of Time', 5, 5, '9785678901234', 'Historical Fiction', 35);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Enchanted Forest', 6, 6, '9786789012345', 'Children''s', 20);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Rhyme and Reason', 7, 7, '9787890123456', 'Poetry', 15);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Realm of Fantasy', 8, 8, '9788901234567', 'Fantasy', 30);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Science Explained', 9, 9, '9789012345678', 'Science', 40);
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, Genre, Quantity) VALUES('Love in Bloom', 10, 10, '9780123456789', 'Romance', 25);


INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Alice', 'Johnson', '123 Oak Street, Cityville', '5551234', 'alice@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Bob', 'Smith', '456 Pine Avenue, Townsville', '5555678', 'bob@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Charlie', 'Williams', '789 Maple Road, Villagetown', '5559012', 'charlie@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('David', 'Brown', '101 Cedar Lane, Bookland', '5553456', 'david@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Emma', 'Jones', '202 Elm Street, Readville', '5557890', 'emma@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Frank', 'Taylor', '303 Birch Avenue, Libraryville', '5552345', 'frank@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Grace', 'Davis', '404 Willow Road, Storytown', '5556789', 'grace@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Henry', 'Martin', '505 Spruce Lane, Novelville', '5550123', 'henry@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Ivy', 'White', '606 Walnut Street, Fictiontown', '5554567', 'ivy@email.com');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email) VALUES('Jack', 'Miller', '707 Cedar Road, Bookville', '5558901', 'jack@email.com');



INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(1, 1, '2024-02-01', '2024-02-15');
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(2, 3, '2024-02-03', '2024-02-17');
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(3, 5, '2024-02-05', NULL);
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(4, 7, '2024-02-07', '2024-02-21');
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(5, 9, '2024-02-09', '2024-02-23');
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(6, 2, '2024-02-11', NULL);
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(7, 4, '2024-02-13', NULL);
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(8, 6, '2024-02-15', '2024-02-28');
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(9, 8, '2024-02-17', NULL);
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate) VALUES(10, 10, '2024-02-19', '2024-03-05');


SELECT AuthorName
FROM Authors
WHERE AuthorID =(
    SELECT TOP 1 AuthorID
	FROM Books
	GROUP BY AuthorID
	ORDER BY COUNT(BookID) DESC
);


SELECT MemberID,FirstName,LastName,Address,Phone,Email
FROM Members
WHERE MemberID IN(
      SELECT DISTINCT MemberID
	  From BorrowedBooks
);



SELECT BookID,MemberID,BorrowDate,ReturnDate
FROM BorrowedBooks
WHERE MemberID IN(
      SELECT DISTINCT MemberID
	  FROM BorrowedBooks
	  WHERE ReturnDate IS NULL
);



SELECT BookID,Title,Quantity
FROM Books
WHERE Quantity >(
     SELECT AVG(Quantity)
	 FROM Books
);


SELECT Title
FROM Books
WHERE PublisherID = (
    SELECT PublisherID
    FROM Publishers
    WHERE PublisherName = 'ABC Publications'
);

SELECT AuthorName
FROM Authors
WHERE AuthorID NOT IN (
    SELECT DISTINCT AuthorID
    FROM Books
    WHERE Genre = 'Fantasy'
);


SELECT DISTINCT AuthorID ,AuthorName
FROM Authors
WHERE AuthorID IN (
    SELECT DISTINCT AuthorID
    FROM Books
    WHERE BookID IN (
        SELECT BookID
        FROM BorrowedBooks
        WHERE MemberID = 2
    )
);



SELECT COUNT(DISTINCT MemberID) AS BorrowingMembersCount
FROM BorrowedBooks
WHERE BookID IN (
    SELECT BookID
    FROM Books
    WHERE PublisherID = (
        SELECT PublisherID
        FROM Publishers
        WHERE PublisherName = 'Ink Press'
    )
);



SELECT Title
FROM Books
WHERE AuthorID = (
    SELECT AuthorID
    FROM Authors
    WHERE AuthorName = 'John Doe'
);


SELECT FirstName, LastName, Address, Phone, Email
FROM Members
WHERE MemberID IN (
    SELECT MemberID
    FROM BorrowedBooks
    WHERE BookID IN (
        SELECT BookID
        FROM Books
        WHERE Quantity > 30
    )
);


SELECT b .Title , a.AuthorName
FROM Books b INNER JOIN Authors a
ON b.AuthorID = a.AuthorID;


SELECT b.Title ,a.AuthorName
FROM Books b INNER JOIN Authors a
ON b.AuthorID = a.AuthorID
WHERE b.Genre ='Mystery';



SELECT b.Title, P.PublisherName
FROM Books b INNER JOIN Publishers P
ON b.PublisherID = P.PublisherID;


SELECT m.FirstName, m.LastName, Books.Title, m.Email
FROM Members m
INNER JOIN BorrowedBooks B ON m.MemberID = B.MemberID
INNER JOIN Books ON B.BookID = Books.BookID;


SELECT Books.Title, m.FirstName, m.LastName
FROM Books Books
INNER JOIN BorrowedBooks B ON Books.BookID = B.BookID
INNER JOIN Members m ON B.MemberID = m.MemberID;



SELECT a.AuthorID,a.AuthorName,b.BookID,b.Title
FROM Authors a LEFT JOIN Books b
ON a.AuthorID = b.AuthorID;



SELECT a.AuthorID,a.AuthorName,b.BookID,b.Title
FROM Authors a LEFT JOIN Books b
ON a.AuthorID = b.AuthorID AND b.Genre = 'Fantasy';


SELECT P.PublisherName, B.Title
FROM Publishers P
LEFT JOIN Books B 
ON P.PublisherID = B.PublisherID;





SELECT b.Title, b.Genre ,A.AuthorName, A.AuthorBio
FROM Books b
LEFT JOIN Authors A ON b.AuthorID = A.AuthorID;




SELECT m.FirstName, m.LastName, Books.Title, m.Email
FROM Members m
LEFT JOIN BorrowedBooks B ON m.MemberID = B.MemberID
LEFT JOIN Books ON B.BookID = Books.BookID;




SELECT a.AuthorID,a.AuthorName,b.BookID,b.Title
FROM Authors a RIGHT JOIN Books b
ON a.AuthorID = b.AuthorID AND b.Genre = 'Mystery';



SELECT a.AuthorID,a.AuthorName,b.BookID,b.Title
FROM Authors a RIGHT JOIN Books b
ON a.AuthorID = b.AuthorID ;


SELECT P.PublisherName, B.Title
FROM Publishers P
RIGHT JOIN Books B 
ON P.PublisherID = B.PublisherID;



SELECT b.Title, b.Genre ,A.AuthorName, A.AuthorBio
FROM Books b
RIGHT JOIN Authors A ON b.AuthorID = A.AuthorID;



SELECT m.FirstName, m.LastName, Books.Title, m.Email
FROM Members m
RIGHT JOIN BorrowedBooks B ON m.MemberID = B.MemberID
RIGHT JOIN Books ON B.BookID = Books.BookID;




SELECT a.AuthorID,a.AuthorName,b.BookID,b.Title
FROM Authors a FULL JOIN Books b
ON a.AuthorID = b.AuthorID AND b.Genre = 'Mystery';

SELECT a.AuthorID,a.AuthorName,b.BookID,b.Title
FROM Authors a FULL JOIN Books b
ON a.AuthorID = b.AuthorID ;


SELECT P.PublisherName, B.Title
FROM Publishers P
FULL JOIN Books B 
ON P.PublisherID = B.PublisherID;


SELECT b.Title, b.Genre ,A.AuthorName, A.AuthorBio
FROM Books b
FULL JOIN Authors A ON b.AuthorID = A.AuthorID;



SELECT m.FirstName, m.LastName, Books.Title, m.Email
FROM Members m
FULL JOIN BorrowedBooks B ON m.MemberID = B.MemberID
FULL JOIN Books ON B.BookID = Books.BookID;



CREATE PROCEDURE GetBooksByGenre
     @Genre NVARCHAR(50)
AS
BEGIN
    SELECT BookID,Title,AuthorID,Genre,Quantity
	FROM Books
	WHERE Genre=@Genre;
END;
EXEC GetBooksByGenre 'Fantasy';


CREATE PROCEDURE InsertNewAuthor
     @AuthorName NVARCHAR(100),
	 @AuthorBi0 NVARCHAR(50)
AS
BEGIN
    INSERT INTO Authors(AuthorName,AuthorBio)
	VALUES(@AuthorName , @AuthorBi0);
END;
EXEC InsertNewAuthor 'A.M Martha','Love';



CREATE PROCEDURE GetBorrowedBooksByMemberID
      @MemberID INT
AS
BEGIN
     SELECT BookID,BorrowDate,ReturnDate
	 FROM BorrowedBooks
	 WHERE MemberID = @MemberID;
END;
EXEC GetBorrowedBooksByMemberID 1;


CREATE PROCEDURE UpdateAddress
      @MemberID INT,
	  @NewAddress NVARCHAR(50)
AS
BEGIN
     UPDATE Members
	 SET Address =@NewAddress
	 WHERE MemberID = @MemberID
END;
EXEC  UpdateAddress 1, '103 Main st,Town';



CREATE PROCEDURE UpdatePublisherAddress
    @PublisherID INT,
    @NewName NVARCHAR(100)
AS
BEGIN
    UPDATE Publishers
    SET PublisherAddress = @NewName
    WHERE PublisherID = @PublisherID;
END;
EXEC UpdatePublisherAddress 1, 'sadun';


CREATE VIEW AuthorView AS
SELECT AuthorName , AuthorBio
FROM Authors;




CREATE VIEW BookView AS
SELECT Title,AuthorID,ISBN,Genre,Quantity
FROM Books;


CREATE VIEW MemberView AS
SELECT FirstName,LastName,Address,Phone,Email
FROM Members;



CREATE VIEW BorrowedBooksView AS
SELECT MemberID,BookID,BorrowDate,ReturnDate
FROM BorrowedBooks;



CREATE VIEW PublisherView AS
SELECT PublisherID, PublisherName, PublisherAddress
FROM Publishers;


 --8--
CREATE LOGIN Admin WITH PASSWORD = 'admin123';

CREATE LOGIN Seller WITH PASSWORD = 'seller123';


--9--
--create users and Associate with Logins
CREATE USER adminUser FOR LOGIN Admin;
CREATE USER sellerUser FOR LOGIN Seller;

--Gant/Deny Permissions
--for adminuser
GRANT SELECT,INSERT,UPDATE,DELETE ON Authors TO adminUser;
GRANT SELECT,INSERT,UPDATE,DELETE ON Publishers TO adminUser;
GRANT SELECT,INSERT,UPDATE,DELETE ON Books TO adminUser;
GRANT SELECT,INSERT,UPDATE,DELETE ON Members TO adminUser;
GRANT SELECT,INSERT,UPDATE,DELETE ON Borrowedbooks TO adminUser;

--for sellerUser
GRANT SELECT ON Authors TO sellerUser;
DENY  SELECT,INSERT,UPDATE,DELETE ON Authors TO sellerUser;

GRANT SELECT ON Publishers TO sellerUser;
DENY  SELECT,INSERT,UPDATE,DELETE ON Publishers TO sellerUser;

GRANT SELECT ON Books TO sellerUser;
DENY  SELECT,INSERT,UPDATE,DELETE ON Books TO sellerUser;

GRANT SELECT ON Members TO sellerUser;
DENY  SELECT,INSERT,UPDATE,DELETE ON Members TO sellerUser;

GRANT SELECT ON Borrowedbooks TO sellerUser;
DENY  SELECT,INSERT,UPDATE,DELETE ON Borrowedbooks TO sellerUser;

--10--
--Create Roles
CREATE ROLE AdminRole;
CREATE ROLE SellerRole;


--Gant/Deny Permissions
--for adminRole
GRANT SELECT,INSERT,UPDATE,DELETE ON Authors TO adminRole;
GRANT SELECT,INSERT,UPDATE,DELETE ON Publishers TO adminRole;
GRANT SELECT,INSERT,UPDATE,DELETE ON Books TO adminRole;
GRANT SELECT,INSERT,UPDATE,DELETE ON Members TO adminRole;
GRANT SELECT,INSERT,UPDATE,DELETE ON Borrowedbooks TO adminRole;



SELECT * FROM Books 
WHERE Quantity > 20;


SELECT Genre, COUNT(*) AS BookCount 
FROM Books 
GROUP BY Genre;

SELECT * FROM Books 
WHERE PublisherID = (SELECT PublisherID FROM Publishers WHERE PublisherName = 'ABC Publications');



SELECT MemberID, COUNT(*) AS BorrowedCount 
FROM BorrowedBooks 
GROUP BY MemberID;


SELECT * FROM Books 
WHERE ISBN = '9783456789012';


SELECT * FROM Books 
ORDER BY Title ASC;


SELECT MemberID, COUNT(*) AS BorrowedCount 
FROM BorrowedBooks 
GROUP BY MemberID 
HAVING COUNT(*) >= 1;

SELECT * FROM Books
WHERE Genre = 'Sci-fi' 
ORDER BY Quantity DESC;



SELECT Genre, AVG(Quantity) AS AvgQuantity 
FROM Books 
GROUP BY Genre;


SELECT * FROM BorrowedBooks 
WHERE BorrowDate > '2024-02-10';


SELECT * FROM Authors 
WHERE LEN(AuthorBio) <= 500;


SELECT AuthorID, COUNT(*) AS BookCount 
FROM Books 
GROUP BY AuthorID 
HAVING COUNT(*) >= 1;


SELECT * FROM BorrowedBooks 
WHERE ReturnDate IS NOT NULL 
ORDER BY ReturnDate ASC;


SELECT Genre, COUNT(*) AS BookCount 
FROM Books 
GROUP BY Genre 
ORDER BY BookCount DESC;


SELECT * FROM Books
WHERE AuthorID = 1 
ORDER BY Title ASC;

SELECT * FROM BorrowedBooks 
WHERE ReturnDate IS NULL;


SELECT * FROM Members 
WHERE Phone LIKE '555%';

SELECT AuthorID, AuthorName FROM Authors WHERE AuthorID IN (SELECT DISTINCT AuthorID 
FROM Books 
WHERE Genre IN ('Fiction', 'Non-fiction') 
GROUP BY AuthorID 
HAVING COUNT(DISTINCT Genre) = 1);


SELECT b.*, a.AuthorName 
FROM Books b INNER JOIN Authors a ON b.AuthorID = a.AuthorID 
ORDER BY a.AuthorName ASC;


SELECT p.PublisherID, p.PublisherName, COUNT(b.BookID) AS PublishedBooks
FROM Publishers p
JOIN Books b ON p.PublisherID = b.PublisherID
GROUP BY p.PublisherID, p.PublisherName
HAVING COUNT(b.BookID) >= 1;




-- Index on AuthorName for frequent search by author name
CREATE NONCLUSTERED INDEX IX_AuthorsName ON Authors(AuthorName);

-- Index on AuthorID for efficient lookups and joins
CREATE NONCLUSTERED INDEX IX_AuthorID ON Authors(AuthorID);



-- Index on PublisherName for frequent search by publisher name
CREATE NONCLUSTERED INDEX IX_PublisherName ON Publishers(PublisherName);

-- Index on PublisherID for efficient lookups and joins
CREATE NONCLUSTERED INDEX IX_PublisherID ON Publishers(PublisherID);




-- Index on Genre for frequent search by book genre
CREATE NONCLUSTERED INDEX IX_Genre ON Books(Genre);

-- Index on AuthorID for efficient joins with the Authors table
CREATE NONCLUSTERED INDEX IX_AuthorID ON Books(AuthorID);



-- Index on Email for frequent search by email
CREATE NONCLUSTERED INDEX IX_Email ON Members(Email);

-- Index on MemberID for efficient lookups and joins
CREATE NONCLUSTERED INDEX IX_MemberID ON Members(MemberID);


-- Index on BorrowDate for frequent search by borrow date
CREATE NONCLUSTERED INDEX IX_BorrowDate ON BorrowedBooks(BorrowDate);

-- Index on BookID for efficient lookups and joins
CREATE NONCLUSTERED INDEX IX_BookID ON BorrowedBooks(BookID);




ALTER TABLE Authors
DROP CONSTRAINT PK__Authors__70DAFC1428E39BC1;

ALTER TABLE Books
DROP CONSTRAINT PK__Books__3DE0C2270C953E14 ;

ALTER TABLE Books
DROP CONSTRAINT FK__Books__AuthorID__5165187F ;

ALTER TABLE Books
DROP CONSTRAINT FK__Books__Publisher__52593CB8 ;

ALTER TABLE BorrowedBooks
DROP CONSTRAINT PK__Borrowed__4295F85F73D7B07E ;


ALTER TABLE BorrowedBooks
DROP CONSTRAINT FK_BookID ;

ALTER TABLE BorrowedBooks
DROP CONSTRAINT FK_MemberID ;

ALTER TABLE Members
DROP CONSTRAINT PK__Members__0CF04B38E2118FFB ;

ALTER TABLE Publishers
DROP CONSTRAINT PK__Publishe__4C657E4B6AA77E7C ;


-- Assuming AuthorID is frequently used in joins and queries
CREATE CLUSTERED INDEX CIX_AuthorID ON Authors(AuthorID);

-- Assuming PublisherID is frequently used in joins and queries
CREATE CLUSTERED INDEX CIX_PublisherID ON Publishers(PublisherID);



-- Assuming BookID is frequently used in joins and queries
CREATE CLUSTERED INDEX CIX_BookID ON Books(BookID);

-- Assuming MemberID is frequently used in joins and queries
CREATE CLUSTERED INDEX CIX_MemberID ON Members(MemberID);


-- Assuming BorrowID is frequently used in joins and queries
CREATE CLUSTERED INDEX CIX_BorrowID ON BorrowedBooks(BorrowID);