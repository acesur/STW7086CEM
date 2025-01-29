CREATE TABLE Users (
    userId VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    emailAddress VARCHAR(100)
);

CREATE TABLE Genre (
    genreCode VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50)
);

CREATE TABLE Book (
    bookId VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    genreCode VARCHAR(10),
    price DECIMAL(5, 2),
    FOREIGN KEY (genreCode) REFERENCES Genre(genreCode)
);

CREATE TABLE Purchase (
    userId VARCHAR(20),
    bookId VARCHAR(10),
    purchaseDate DATE,
    PRIMARY KEY (userId, bookId),
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (bookId) REFERENCES Book(bookId)
);


INSERT INTO Users (userId, name, emailAddress) VALUES ('alice01', 'Alice, A', 'alice@gmail.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('bob17', 'Bob, B', 'bob@hotmail.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('charlie5', 'Charlie, C', 'charlie@yahoo.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('dave19', 'Dave, D', 'dave@gmail.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('eve20', 'Eve, E', 'eve@hotmail.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('frank30', 'Frank, F', 'frank@gmail.com');


INSERT INTO Genre (genreCode, title) VALUES ('GN01', 'Fiction');
INSERT INTO Genre (genreCode, title) VALUES ('GN02', 'Non-Fiction');
INSERT INTO Genre (genreCode, title) VALUES ('GN03', 'Philosophy');


INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B001', 'The Great Gatsby', 'GN01', 5.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B002', 'To Kill a Mockingbird', 'GN01', 6.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B003', 'A Brief History of Time', 'GN02', 7.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B004', 'The Art of War', 'GN03', 4.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B005', 'The Catcher in the Rye', 'GN01', 5.49);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B006', 'Sapiens', 'GN02', 8.49);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B007', '1984', 'GN01', 6.49);

INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('alice01', 'B002', DATE '2022-05-05');
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('dave19', 'B005', DATE '2023-05-10');
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('bob17', 'B004', DATE '2022-05-12');
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('eve20', 'B001', DATE '2023-05-15');
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('frank30', 'B003', DATE '2023-08-20');
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('alice01', 'B006', DATE '2023-08-25');
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('charlie5', 'B007', DATE '2023-09-02');

SELECT bookId, title, genreCode
FROM Book
ORDER BY title;

SELECT COUNT(DISTINCT p.userId) AS user_count
FROM Purchase p
JOIN Book b ON p.bookId = b.bookId
WHERE b.genreCode = 'GN01';


SELECT g.title AS genre_title, COUNT(p.bookId) AS purchase_count
FROM Genre g
JOIN Book b ON g.genreCode = b.genreCode
LEFT JOIN Purchase p ON b.bookId = p.bookId
GROUP BY g.title;

SELECT g.title AS genre_title
FROM Genre g
JOIN Book b ON g.genreCode = b.genreCode
JOIN Purchase p ON b.bookId = p.bookId
GROUP BY g.title
HAVING COUNT(p.bookId) > 1;

