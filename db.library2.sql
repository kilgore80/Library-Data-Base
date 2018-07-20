CREATE DATABASE db_library5;

--USE MASTER 
--GO
--DROP DATABASE db_library5
--GO
--CREATE DATABASE db_library5
--GO
--USE db_library5

USE db_library5;

	CREATE TABLE tbl_book (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (1100,1),
		book_title VARCHAR(100) NOT NULL,
		book_pn INT NOT NULL CONSTRAINT fk_publisher_pn FOREIGN KEY REFERENCES tbl_publisher(publisher_pn)ON UPDATE CASCADE ON DELETE CASCADE   
);

	CREATE TABLE tbl_authors (
		authors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		authors_book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_book(book_id)ON UPDATE CASCADE ON DELETE CASCADE,
		authors_name VARCHAR(60)
);

	CREATE TABLE tbl_publisher (
		publisher_pn INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		publisher_name VARCHAR(60) NOT NULL,
		publisher_address VARCHAR(100) NOT NULL,
		publisher_phone VARCHAR(20) NOT NULL
);
	
	CREATE TABLE tbl_loans (
		loans_id INT PRIMARY KEY NOT NULL IDENTITY (2000,1),
		loans_bid INT NOT NULL CONSTRAINT fk_book2_id FOREIGN KEY REFERENCES tbl_book(book_id)ON UPDATE CASCADE ON DELETE CASCADE,
		loans_branch INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		loans_cardno INT NOT NULL CONSTRAINT fk_borrower_cardno FOREIGN KEY REFERENCES tbl_borrower(borrower_cardno)ON UPDATE CASCADE ON DELETE CASCADE,
		loans_dateo VARCHAR(25) NOT NULL,
		loans_dated VARCHAR(25) NOT NULL
);

SELECT * FROM tbl_loans;

	CREATE TABLE tbl_copies (
		copies_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		copies_bid INT NOT NULL CONSTRAINT fk_book3_id FOREIGN KEY REFERENCES tbl_book(book_id)ON UPDATE CASCADE ON DELETE CASCADE,
		copies_branch INT NOT NULL CONSTRAINT fk_branch2_id FOREIGN KEY REFERENCES tbl_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		copies_no_copies INT NOT NULL
); 

SELECT * FROM tbl_copies;

	CREATE TABLE tbl_borrower (
		borrower_cardno INT PRIMARY KEY NOT NULL IDENTITY (1300,1),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(75) NOT NULL,
		borrower_phone VARCHAR(25) NOT NULL
);

	CREATE TABLE tbl_branch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branch_name VARCHAR(50) NOT NULL,
		branch_address VARCHAR(75) NOT NULL

); 
	INSERT INTO tbl_book
		(book_title, book_pn)
		VALUES
		('Daniel Owns a Car', 102),
		('Whos That!', 103),
		('The Stand', 104),
		('Four Past Midnight', 104),
		('The Herring', 101),
		('The Lost Tribe', 103),
		('Golden Bear', 101),
		('New Biology', 100),
		('Joes House', 102),
		('When I was a Child', 104),
		('Dogs vs Cats', 100),
		('Purple Pig', 103),
		('Dinosaurs Are Real', 104),
		('Why the Long Face', 103),
		('The Death', 102),
		('Tire Burner', 100),
		('I Rutger', 102),
		('Debbies Gun', 101),
		('Americas Secrets', 103),
		('Blueberry Creek', 100),
		('Europe: The Story of Charles Baker', 102),
		('Vanpire Holliday', 103),
		('Chocolate and Cheese ', 100),
		('Beers with Ted', 101),
		('Baseballs Hero', 104),
		('Monkey and the Dragon', 102)
;

SELECT * FROM tbl_book;

	INSERT INTO tbl_authors
		(authors_book_id, authors_name)
		VALUES
		(1100, 'Jason Evey'),
		(1101, 'Jennifer Babbcock'),
		(1102, 'Stephen King'),
		(1103, 'Stephen King'),
		(1104, 'Ray Goldstein'),
		(1105, 'Deb Lawson'),
		(1106, 'Chuck Swanson'),
		(1107, 'Sleep McGee'),
		(1108, 'Luara Weaver'),
		(1109, 'Christie Dawson'),
		(1110, 'Adam Gentle'),
		(1111, 'Paul Wright'),
		(1112, 'Lance Genovie'),
		(1113, 'Tucker Smith'),
		(1114, 'Wendy Gibson'),
		(1115, 'Daniel Ortiz'),
		(1116, 'Eric Lammb'),
		(1117, 'Jennifer Nunez'),
		(1118, 'Jeff Daniels'),
		(1119, 'Sepi Tajapour'),
		(1120, 'Luke Jackson'),
		(1121, 'Glenn Johnson'),
		(1122, 'Nate Johnson'),
		(1123, 'Ted and Mary Willis'),
		(1124, 'Jimmy Do'),
		(1125, 'Angela Smith')
;
SELECT * FROM tbl_authors;

	INSERT INTO tbl_publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES
		('Samantha Cook', '3615 W 16TH AVE 56321 New York, NY', '652-412-3589'),
		('Doug Stanhope', '2514 NE 137TH ST 97230 Portland, OR', '785-326-5487'),
		('Jennifer Lowe', '231 S Park AVE 56214 New York, NY', '254-326-4587'),
		('Lewis Ortiz', '214 Redic ST 32514 Chicago, IL', '541-320-6218'),
		('Liz Russo', '874 J ST 87547 Miami, FL', '458-789-6231')
;
SELECT * FROM tbl_publisher;

	INSERT INTO tbl_loans
		(loans_bid, loans_branch, loans_cardno, loans_dateo, loans_dated)
		VALUES
        (1101, 2, 1300, '7/01/18', '7/14/18'),
		(1105, 2, 1300, '7/01/18', '7/14/18'),
		(1109, 2, 1300, '7/01/18', '7/14/18'),
		(1112, 2, 1300, '7/01/18', '7/14/18'),
		(1118, 2, 1300, '7/01/18', '7/14/18'),
		(1122, 2, 1300, '7/01/18', '7/14/18'),
		(1100, 2, 1300, '7/01/18', '7/14/18'),
		(1101, 1, 1301, '6/27/18', '7/11/18'),
		(1106, 1, 1301, '6/27/18', '7/11/18'),
		(1109, 1, 1301, '6/27/18', '7/11/18'),
		(1120, 1, 1301, '6/27/18', '7/11/18'),
		(1107, 3, 1302, '7/5/18', '7/19/18'),
		(1108, 3, 1302, '7/5/18', '7/19/18'),
		(1111, 3, 1302, '7/5/18', '7/19/18'),
		(1113, 3, 1302, '7/5/18', '7/19/18'),
		(1118, 3, 1302, '7/5/18', '7/19/18'),
		(1120, 3, 1302, '7/5/18', '7/19/18'),
		(1124, 3, 1302, '7/5/18', '7/19/18'),
		(1102, 6, 1303, '7/2/18', '7/15/18'),
		(1109, 6, 1303, '7/2/18', '7/15/18'),
		(1115, 6, 1303, '7/2/18', '7/15/18'),
		(1116, 6, 1303, '7/2/18', '7/15/18'),
		(1121, 6, 1303, '7/2/18', '7/15/18'),
		(1122, 6, 1303, '7/2/18', '7/15/18'),
		(1103, 5, 1304, '6/27/18', '7/11/18'),
		(1106, 5, 1304, '6/27/18', '7/11/18'),
		(1111, 5, 1304, '6/27/18', '7/11/18'),
		(1115, 5, 1304, '6/27/18', '7/11/18'),
		(1117, 5, 1304, '6/27/18', '7/11/18'),
		(1122, 5, 1304, '6/27/18', '7/11/18'),
		(1100, 5, 1304, '6/27/18', '7/11/18'),
		(1101, 4, 1305, '6/30/18', '7/13/18'),
		(1108, 4, 1305, '6/30/18', '7/13/18'),
		(1115, 4, 1305, '6/30/18', '7/13/18'),
		(1109, 1, 1306, '7/03/18', '7/18/18'),
		(1116, 1, 1306, '7/03/18', '7/18/18'),
		(1120, 1, 1306, '7/03/18', '7/18/18'),
		(1118, 3, 1307, '6/30/18', '7/13/18'),
		(1110, 2, 1308, '7/07/18', '7/21/18'),
		(1116, 2, 1308, '7/07/18', '7/21/18'),
		(1116, 1, 1309, '7/03/18', '7/18/18'),
		(1110, 3, 1310, '7/08/18', '7/22/18'),
		(1125, 3, 1310, '7/08/18', '7/22/18'),
		(1100, 3, 1310, '7/08/18', '7/22/18'),
		(1122, 6, 1311, '6/30/18', '7/13/18'),
		(1101, 4, 1312, '7/06/18', '7/20/18'),
		(1112, 4, 1312, '7/06/18', '7/20/18'),
		(1119, 4, 1312, '7/06/18', '7/20/18'),
		(1109, 6, 1313, '7/2/18', '7/15/18'),
		(1112, 6, 1313, '7/2/18', '7/15/18'),
		(1120, 5, 1314, '7/01/18', '7/14/18'),
		(1122, 5, 1314, '7/01/18', '7/14/18')
		
SELECT * FROM tbl_loans;	
		 
;
INSERT INTO tbl_copies
		(copies_bid, copies_branch, copies_no_copies)
		VALUES
		(1102, 5, 4)
;

	INSERT INTO tbl_copies
		(copies_bid, copies_branch, copies_no_copies)
		VALUES
		(1101, 1, 5),
		(1101, 2, 4),
		(1101, 3, 4),
		(1101, 4, 6),
		(1102, 1, 3),
		(1102, 6, 7),
		(1103, 5, 10),
		(1104, 5, 6),
		(1105, 1, 3),
		(1105, 2, 4),
		(1105, 4, 5),
		(1106, 1, 4),
		(1106, 2, 8),
		(1106, 4, 3),
		(1106, 5, 5),
		(1107, 3, 3),
		(1107, 4, 4),
		(1107, 5, 4),
		(1108, 2, 3),
		(1108, 3, 7),
		(1108, 4, 4),
		(1109, 1, 4),
		(1109, 2, 2),
		(1109, 6, 4),
		(1110, 1, 3),
		(1110, 2, 3),
		(1110, 3, 5),
		(1110, 5, 3),
		(1111, 1, 5),
		(1111, 2, 3),
		(1111, 3, 4),
		(1111, 5, 3),
		(1112, 1, 3),
		(1112, 2, 4),
		(1112, 4, 2),
		(1112, 6, 3),
		(1113, 2, 3),
		(1113, 3, 4),
		(1113, 4, 6),
		(1113, 5, 3),
		(1114, 3, 4),
		(1114, 4, 3),
		(1114, 5, 4),
		(1114, 6, 3),
		(1115, 1, 3),
		(1115, 3, 3),
		(1115, 4, 5),
		(1115, 5, 4),
		(1115, 6, 3),
		(1116, 1, 3),
		(1116, 2, 3),
		(1116, 5, 3),
		(1116, 6, 3),
		(1117, 1, 4),
		(1117, 2, 3),
		(1117, 3, 7),
		(1117, 4, 3),
		(1117, 5, 3),
		(1117, 6, 5),
		(1118, 1, 3),
		(1118, 2, 3),
		(1118, 3, 3),
		(1118, 5, 4),
		(1118, 6, 4),
		(1119, 1, 4),
		(1119, 3, 3),
		(1119, 4, 4),
		(1119, 5, 3),
		(1119, 6, 4),
		(1120, 1, 2),
		(1120, 3, 2),
		(1120, 4, 2),
		(1120, 5, 2),
		(1121, 1, 3),
		(1121, 3, 3),
		(1121, 4, 4),
		(1121, 6, 3),
		(1122, 1, 4),
		(1122, 2, 3),
		(1122, 5, 4),
		(1122, 6, 4),
		(1123, 1, 4), 
		(1123, 2, 5),
		(1123, 3, 3),
		(1123, 4, 3),
		(1124, 2, 3),
		(1124, 3, 3),
		(1124, 4, 3),
		(1125, 1, 3),
		(1125, 2, 3),
		(1125, 3, 3),
		(1125, 4, 4),
		(1100, 2, 4),
		(1100, 3, 3),
		(1100, 4, 3),
		(1100, 5, 3)
;

	INSERT INTO tbl_borrower
		(borrower_name, borrower_address, borrower_phone)
		VALUES
		('Omar Little', '321 N Jarret ST 97230 Portland, OR', '503-231-2142'),
		('Ted Daniels', '4201 NW 23rd ST 97121 Portland, OR', '503-365-2852'),
		('Shelly Tio', '8796 SW Oak ST 97453 Portland, OR', '503-879-4521'),
		('Daniel Polar', '296 NE 8th ST 97211 Portland, OR', '503-363-2987'),
		('Kipp Yu', '8745 NE 82nd ST 97235 Portland, OR', '503-478-0310'),
		('Jennifer Soul', '654 NW 20th AVE 97111 Portland, OR', '503-947-6542'),
		('Johnny Bunk', '785 N Scio ST 97212 Portland, OR', '503-859-9942'),
		('Gale McDennis', '221 SE Stark 97525 Portland, OR', '503-331-2182'),
		('Daniel Lewis', '555 SW Pine 97568 Portland, OR', '503-631-5242'),
		('Megan Wright', '7586 NE 78th 97230 Portland, OR', '503-258-7582'),
		('Jan Pham', '787 N Failing ST 97450 Portland, OR', '503-415-7854'),
		('Jason Cook', '7078 NE 76th AVE Portland, OR', '503-785-9898'),
		('Del Frum', '361 SW Ty ST 97458 Portland, OR', '503-798-3572'),
		('Paula Smith', '9621 NW Townes 97214 Portland, OR', '503-868-6982'),
		('Izzy Kain', '9874 SW Lang ST 97230 Portland, OR', '503-676-9523')
;
SELECT * FROM tbl_borrower;

	INSERT INTO tbl_branch
		(branch_name, branch_address)
		VALUES
		('Sharpstown', '2314 NW 36th AVE 94578 Portland, OR'),
		('Gregory Heights', '23654 NE 164th AVE 97230 Portland, OR'),
		('Danville', '3687 SE Stark ST 97654 Portland, OR'),
		('Klam', '458 SW Oak ST 98745 Portland, OR'),
		('Central', '1358 NW Souza PL 45879 Portland, OR'),
		('Popso', '3619 NE 198th AVE 97365 Portland, OR')
;
