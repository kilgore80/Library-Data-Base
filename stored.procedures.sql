USE db_library5;
-- Stored Procedures--

--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?--

CREATE PROCEDURE procedure_one @Book NVARCHAR(40), @Branch NVARCHAR(25) 
AS
SELECT
	a1.copies_no_copies as 'Number of Copies', a2.branch_name as 'Branch Name', a3.book_title as 'Book Title'
	FROM tbl_copies a1
	INNER JOIN tbl_branch a2 ON a2.branch_id = a1.copies_branch
	INNER JOIN tbl_book a3 ON a3.book_id = a1.copies_bid
	WHERE book_title = @Book AND branch_name = @Branch
	GO

EXEC procedure_one @Book = 'The Lost Tribe', @Branch = 'Sharpstown'


--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?--

CREATE PROCEDURE procedure_two @Book VARCHAR(30)
AS
SELECT
	a1.copies_no_copies as 'Number of Copies', a2.branch_name as 'Branch Name', a3.book_title as 'Title'
	FROM tbl_copies a1
	INNER JOIN tbl_branch a2 ON a2.branch_id = a1.copies_branch
	INNER JOIN tbl_book a3 ON a3.book_id = a1.copies_bid
	WHERE book_title = @Book
GO

EXEC procedure_two @Book = 'The Lost Tribe'
 ;


--3.) Retrieve the names of all borrowers who do not have any books checked out.--

-- There are no borrowers who DONT have any books checked out.  I did not do this on purpose. 


CREATE PROCEDURE procedure_three
AS
SELECT
	COUNT(*) as 'Books Checked Out',
	a2.borrower_name as 'Name'
	FROM tbl_loans a1
	INNER JOIN tbl_borrower a2 ON a2.borrower_cardno = a1.loans_cardno
	GROUP BY a2.borrower_name 
	HAVING COUNT(*) < 0
	GO

EXEC procedure_three 


--4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,--
-- retrieve the book title, the borrower's name, and the borrower's address.--

CREATE PROCEDURE procedure_four @DueDate VARCHAR(15), @BranchName VARCHAR(20)
AS
SELECT
	a1.loans_dated as 'Date Due:', a2.borrower_name as'Name:',a2.borrower_address as'Address:', a3.book_title as 'Title:', a4.branch_name as 'Branch:'
	FROM tbl_loans a1
	INNER JOIN tbl_borrower a2 ON a2.borrower_cardno = a1.loans_cardno
	INNER JOIN tbl_book a3 ON a3.book_id = a1.loans_bid
	INNER JOIN tbl_branch a4 ON a4.branch_id = a1.loans_branch
	WHERE loans_dated = @DueDate AND branch_name = @BranchName
	GO
	 
EXEC procedure_four @DueDate = '7/18/18', @BranchName = 'Sharpstown'


--5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.--

CREATE PROCEDURE procedure_five @BranchName VARCHAR(20)
AS
SELECT
	a1.loans_dateo as 'Checked Out', a2.branch_name as 'Branch Name'
	FROM tbl_loans a1
	INNER JOIN tbl_branch a2 ON a2.branch_id = a1.loans_branch
	INNER JOIN tbl_copies a3 ON a3.copies_id = a1.loans_branch
	WHERE branch_name = @BranchName
	GO

EXEC procedure_five @BranchName = 'Danville'
;


--6.) Retrieve the names, addresses, and the number of books checked out for all--
--borrowers who have more than five books checked out.--

CREATE PROCEDURE procedure_six 
AS
SELECT 
	COUNT(*) as 'Books Checked Out',
	a2.borrower_name as 'Name', 
	a2.borrower_address as 'Address'
	FROM tbl_loans a1
	INNER JOIN tbl_borrower a2 ON a2.borrower_cardno = a1.loans_cardno
	GROUP BY a2.borrower_name ,a2.borrower_address
	HAVING COUNT(*) > 5
	GO

--7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and
-- the number of copies owned by the library branch whose name is "Central".

CREATE PROCEDURE procedure_7 @Author VARCHAR(25), @Branch VARCHAR(20) 
AS
SELECT 
	a1.book_title as 'Book Title',
	a2.authors_name as 'Authors Name',
	a3.copies_no_copies as 'Number of Copies',
	a4.branch_name as 'Branch'
	FROM tbl_book a1
	RIGHT JOIN tbl_authors a2 ON a2.authors_book_id = a1.book_id
	LEFT JOIN tbl_copies a3 ON a3.copies_bid = a1.book_id
	INNER JOIN tbl_branch a4 ON a4.branch_id = a3.copies_branch
	WHERE authors_name = @Author AND branch_name = @Branch 
GO

EXEC procedure_7 @Author = 'Stephen King', @Branch = 'Central'