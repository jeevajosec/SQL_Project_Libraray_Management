create database Library;
use Library;

Create table Branch(Branch_no int  PRIMARY KEY,  
Manager_Id  int,
Branch_address  varchar(50),
Contact_no bigint);

create table employee(Emp_Id int PRIMARY KEY,  
Emp_name  varchar(20),
Position  varchar(20),
Salary decimal(10,2),
Branch_no int, 
FOREIGN KEY (Branch_no) References Branch(Branch_no)); 

create table books(ISBN varchar(20) PRIMARY KEY, 
Book_title  varchar(100),
Category    varchar(50),
Rental_Price  decimal(10,2),
Status VARCHAR(3) CHECK (Status IN ('yes', 'no')), 
Author  varchar(25),
Publisher varchar(50));

create table customer(Customer_Id int PRIMARY KEY, 
Customer_name  varchar(25),
Customer_address  varchar(50),
Reg_date Date);

create table IssueStatus(Issue_Id int PRIMARY KEY,  
Issued_cust int,
FOREIGN KEY (Issued_cust) references customer(customer_id),  
Issued_book_name varchar(100), 
Issue_date date,
Isbn_book varchar(20),
FOREIGN KEY (Isbn_book) references books(ISBN));

create table ReturnStatus(Return_Id int PRIMARY KEY,  
Return_cust  varchar(25),
Return_book_name  varchar(100),
Return_date  date,
Isbn_book2 varchar(20),
FOREIGN KEY (Isbn_book2)  references books(ISBN)); 



INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St, Springfield, IL', 2175551234),
(2, 102, '456 Oak St, Lincoln, NE', 4025552345),
(3, 103, '789 Pine St, Austin, TX', 5125553456),
(4, 104, '101 Maple St, Denver, CO', 3035554567),
(5, 105, '202 Birch St, Seattle, WA', 2065555678);

select * from Branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'John Smith', 'Manager', 75000.00, 1),
(2, 'Jane Doe', 'Assistant Manager', 55000.00, 1),
(3, 'Jim Brown', 'Cashier', 30000.00, 1),
(4, 'Jill White', 'Sales Associate', 28000.00, 1),
(5, 'Jack Black', 'Cleaner', 25000.00, 1),
(6, 'Emily Davis', 'Manager', 75000.00, 2),
(7, 'Michael Wilson', 'Assistant Manager', 55000.00, 2),
(8, 'Sarah Johnson', 'Cashier', 30000.00, 2),
(9, 'David Lee', 'Sales Associate', 28000.00, 2),
(10, 'Laura Clark', 'Cleaner', 25000.00, 2),
(11, 'Chris Walker', 'Manager', 75000.00, 3),
(12, 'Anna Hall', 'Assistant Manager', 55000.00, 3),
(13, 'Daniel Wright', 'Cashier', 30000.00, 3),
(14, 'Jessica Scott', 'Sales Associate', 28000.00, 3),
(15, 'Mark Lewis', 'Cleaner', 25000.00, 3),
(16, 'Olivia Parker', 'Manager', 75000.00, 4),
(17, 'Henry Cooper', 'Assistant Manager', 55000.00, 4),
(18, 'Emma Turner', 'Cashier', 30000.00, 4),
(19, 'Lucas Morgan', 'Sales Associate', 28000.00, 4),
(20, 'Sophia Cook', 'Cleaner', 25000.00, 4),
(21, 'Liam Murphy', 'Manager', 75000.00, 5),
(22, 'Isabella Hughes', 'Assistant Manager', 55000.00, 5),
(23, 'Mason Rogers', 'Cashier', 30000.00, 5),
(24, 'Ava Reed', 'Sales Associate', 28000.00, 5),
(25, 'Ethan Bell', 'Cleaner', 25000.00, 5);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(26, 'Sophia Miller', 'Manager', 75000.00, 3),
(27, 'Ethan Harris', 'Assistant Manager', 55000.00, 3);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(28, 'Isabella Thompson', 'Manager', 75000.00, 5),
(29, 'James Robinson', 'Cashier', 30000.00, 5),
(30, 'Charlotte Martinez', 'Sales Associate', 28000.00, 5);
update employee set position= 'Cleaner', Salary=25000 where Emp_id=26;
update employee set position= 'Cleaner', Salary=25000 where Emp_id=28;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 10.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-14-118267-4', '1984', 'Dystopian', 9.99, 'yes', 'George Orwell', 'Penguin'),
('978-0-7432-7356-5', 'To Kill a Mockingbird', 'Fiction', 12.99, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-452-28423-4', 'Brave New World', 'Science Fiction', 11.99, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-06-112008-4', 'The Catcher in the Rye', 'Fiction', 8.99, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-307-59465-8', 'The Road', 'Post-apocalyptic', 10.99, 'no', 'Cormac McCarthy', 'Alfred A. Knopf'),
('978-1-5011-3677-1', 'Where the Crawdads Sing', 'Mystery', 14.99, 'no', 'Delia Owens', 'G.P. Putnam\'s Sons'),
('978-0-14-312774-1', 'Educated', 'Memoir', 13.99, 'no', 'Tara Westover', 'Random House'),
('978-1-4767-7988-8', 'The Nightingale', 'Historical Fiction', 15.99, 'no', 'Kristin Hannah', 'St. Martin\'s Press'),
('978-0-06-202403-9', 'The Help', 'Historical Fiction', 12.99, 'no', 'Kathryn Stockett', 'Amy Einhorn Books'),
('978-0-670-03320-4', 'The Book Thief', 'Historical Fiction', 11.99, 'yes', 'Markus Zusak', 'Alfred A. Knopf'),
('978-0-7432-7357-2', 'The Da Vinci Code', 'Mystery', 9.99, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-06-245771-4', 'Becoming', 'Memoir', 16.99, 'yes', 'Michelle Obama', 'Crown'),
('978-0-307-27952-3', 'Gone Girl', 'Thriller', 10.99, 'yes', 'Gillian Flynn', 'Crown Publishing Group'),
('978-1-5011-7671-5', 'The Woman in the Window', 'Thriller', 12.99, 'yes', 'A.J. Finn', 'William Morrow'),
('978-0-670-81302-4', 'The Girl on the Train', 'Thriller', 14.99, 'yes', 'Paula Hawkins', 'Riverhead Books'),
('978-0-316-76980-7', 'Big Little Lies', 'Mystery', 13.99, 'yes', 'Liane Moriarty', 'Penguin'),
('978-0-452-28702-0', 'Pride and Prejudice', 'Classic', 8.99, 'yes', 'Jane Austen', 'Modern Library'),
('978-1-5011-1081-9', 'All the Light We Cannot See', 'Historical Fiction', 16.99, 'no', 'Anthony Doerr', 'Scribner'),
('978-0-06-231500-7', 'The Alchemist', 'Fiction', 9.99, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-7432-7358-9', 'Angels & Demons', 'Mystery', 9.99, 'yes', 'Dan Brown', 'Pocket Books'),
('978-0-385-74354-5', 'The Shining', 'Horror', 11.99, 'yes', 'Stephen King', 'Anchor'),
('978-0-14-243733-9', 'Moby-Dick', 'Classic', 9.99, 'yes', 'Herman Melville', 'Penguin'),
('978-0-06-251140-7', 'Tuesdays with Morrie', 'Memoir', 10.99, 'yes', 'Mitch Albom', 'Doubleday'),
('978-0-375-70301-4', 'The Kite Runner', 'Fiction', 12.99, 'yes', 'Khaled Hosseini', 'Riverhead Books');
update books set Rental_price=28 where ISBN='978-1-5011-7671-5';



INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-0-679-60182-7', 'A People\'s History of the United States', 'History', 14.99, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-14-311688-2', '1776', 'History', 12.99, 'yes', 'David McCullough', 'Penguin Books'),
('978-0-7432-2671-4', 'The Devil in the White City', 'History', 11.99, 'yes', 'Erik Larson', 'Vintage Books'),
('978-0-446-52749-4', 'Unbroken: A World War II Story of Survival, Resilience, and Redemption', 'History', 13.99, 'yes', 'Laura Hillenbrand', 'Random House'),
('978-0-307-38755-7', 'Band of Brothers: E Company, 506th Regiment, 101st Airborne from Normandy to Hitler\'s Eagle\'s Nest', 'History', 15.99, 'yes', 'Stephen E. Ambrose', 'Simon & Schuster'),
('978-0-7432-2645-5', 'Into the Wild', 'Biography', 10.99, 'yes', 'Jon Krakauer', 'Anchor Books');
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Alice Brown', '123 Elm St, Springfield, IL 62701', '2022-01-15'),
(2, 'Bob Smith', '456 Oak St, Lincoln, NE 68508', '2022-02-20'),
(3, 'Charlie Johnson', '789 Pine St, Austin, TX 73301', '2022-03-25'),
(4, 'David White', '101 Maple St, Denver, CO 80202', '2022-04-30'),
(5, 'Eva Green', '202 Birch St, Seattle, WA 98101', '2022-05-10'),
(6, 'Frank Harris', '303 Cedar St, Portland, OR 97201', '2022-06-15'),
(7, 'Grace Lewis', '404 Walnut St, San Francisco, CA 94102', '2022-07-20'),
(8, 'Hannah Walker', '505 Chestnut St, Boston, MA 02108', '2022-08-25'),
(9, 'Ian Wright', '606 Aspen St, Chicago, IL 60601', '2022-09-30'),
(10, 'Jack Thompson', '707 Beech St, Miami, FL 33101', '2022-10-05'),
(11, 'Karen Adams', '808 Willow St, New York, NY 10001', '2022-11-10'),
(12, 'Liam Baker', '909 Cedar St, Atlanta, GA 30301', '2022-12-15'),
(13, 'Mia Clark', '1010 Spruce St, Los Angeles, CA 90001', '2023-01-20'),
(14, 'Noah King', '1111 Maple St, Houston, TX 77001', '2023-02-25'),
(15, 'Olivia Scott', '1212 Pine St, Phoenix, AZ 85001', '2023-03-30');
update Customer set Reg_date= '2021-06-24' where Customer_Id=13;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 5, 'The Great Gatsby', '2023-04-01', '978-3-16-148410-0'),
(2, 3, '1984', '2023-04-05', '978-0-14-118267-4'),
(3, 10, 'To Kill a Mockingbird', '2023-04-10', '978-0-7432-7356-5'),
(4, 1, 'Brave New World', '2023-04-15', '978-0-452-28423-4'),
(5, 7, 'The Catcher in the Rye', '2023-04-20', '978-0-06-112008-4'),
(6, 9, 'The Road', '2023-04-25', '978-0-307-59465-8'),
(7, 6, 'Where the Crawdads Sing', '2023-04-30', '978-1-5011-3677-1'),
(8, 2, 'Educated', '2023-05-05', '978-0-14-312774-1'),
(9, 8, 'The Nightingale', '2023-05-10', '978-1-4767-7988-8'),
(10, 4, 'The Help', '2023-05-15', '978-0-06-202403-9'),
(11, 11, 'The Book Thief', '2023-05-20', '978-0-670-03320-4'),
(12, 14, 'The Da Vinci Code', '2023-05-25', '978-0-7432-7357-2'),
(13, 12, 'Becoming', '2023-05-30', '978-0-06-245771-4'),
(14, 15, 'Gone Girl', '2023-06-01', '978-0-307-27952-3'),
(15, 13, 'The Woman in the Window', '2023-06-05', '978-1-5011-7671-5'),
(16, 1, 'The Girl on the Train', '2023-06-10', '978-0-670-81302-4'),
(17, 4, 'Big Little Lies', '2023-06-15', '978-0-316-76980-7'),
(18, 6, 'Pride and Prejudice', '2023-06-20', '978-0-452-28702-0'),
(19, 8, 'All the Light We Cannot See', '2023-06-25', '978-1-5011-1081-9'),
(20, 10, 'The Alchemist', '2023-06-30', '978-0-06-231500-7'),
(21, 3, 'Angels & Demons', '2023-07-05', '978-0-7432-7358-9'),
(22, 7, 'The Shining', '2023-07-10', '978-0-385-74354-5'),
(23, 2, 'Moby-Dick', '2023-07-15', '978-0-14-243733-9'),
(24, 5, 'Tuesdays with Morrie', '2023-07-20', '978-0-06-251140-7'),
(25, 9, 'The Kite Runner', '2023-07-25', '978-0-375-70301-4'),
(26, 14, 'The Great Gatsby', '2023-07-30', '978-3-16-148410-0'),
(27, 12, '1984', '2023-08-01', '978-0-14-118267-4'),
(28, 11, 'To Kill a Mockingbird', '2023-08-05', '978-0-7432-7356-5'),
(29, 15, 'Brave New World', '2023-08-10', '978-0-452-28423-4'),
(30, 13, 'The Catcher in the Rye', '2023-08-15', '978-0-06-112008-4');

DELETE FROM IssueStatus
WHERE Issued_cust = 13;

Select * from IssueStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 'Eva Green', 'The Great Gatsby', '2023-04-20', '978-3-16-148410-0'),
(2, 'Charlie Johnson', '1984', '2023-04-25', '978-0-14-118267-4'),
(3, 'Jack Thompson', 'To Kill a Mockingbird', '2023-04-30', '978-0-7432-7356-5'),
(4, 'Alice Brown', 'Brave New World', '2023-05-01', '978-0-452-28423-4'),
(5, 'Grace Lewis', 'The Catcher in the Rye', '2023-05-10', '978-0-06-112008-4'),
(6, 'Ian Wright', 'The Road', '2023-05-15', '978-0-307-59465-8'),
(7, 'Hannah Walker', 'Where the Crawdads Sing', '2023-05-20', '978-1-5011-3677-1'),
(8, 'Bob Smith', 'Educated', '2023-05-25', '978-0-14-312774-1'),
(9, 'David White', 'The Nightingale', '2023-05-30', '978-1-4767-7988-8'),
(10, 'Karen Adams', 'The Help', '2023-06-01', '978-0-06-202403-9'),
(11, 'Liam Baker', 'The Book Thief', '2023-06-10', '978-0-670-03320-4'),
(12, 'Noah King', 'The Da Vinci Code', '2023-06-20', '978-0-7432-7357-2'),
(13, 'Mia Clark', 'Becoming', '2023-06-30', '978-0-06-245771-4'),
(14, 'Olivia Scott', 'Gone Girl', '2023-07-01', '978-0-307-27952-3'),
(15, 'Frank Harris', 'The Woman in the Window', '2023-07-05', '978-1-5011-7671-5'),
(16, 'Alice Brown', 'The Girl on the Train', '2023-07-10', '978-0-670-81302-4'),
(17, 'David White', 'Big Little Lies', '2023-07-20', '978-0-316-76980-7'),
(18, 'Hannah Walker', 'Pride and Prejudice', '2023-07-30', '978-0-452-28702-0');

-- 1. Retrieve the book title, category, and rental price of all available books
select Book_title, Category, Rental_Price as Rental_price_dollars from books;

-- 2. List the employee names and their respective salaries in descending order of salary. 

select Emp_name, Salary from employee order by Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

select customer.customer_name, books.book_title from IssueStatus 
Join Customer on IssueStatus.Issued_cust=Customer.Customer_Id
Join Books on IssueStatus.Isbn_book=Books.ISBN;

-- 4. Display the total count of books in each category. 
select Category, count(*) from books group by Category;

--  5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select Emp_name, Position, salary from Employee where Salary> 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

select Customer.customer_name, Customer.Reg_date from Customer 
 Left Join Issuestatus on Customer.Customer_Id= IssueStatus.Issued_cust 
 where Customer.Reg_date < '2022-01-01' and Issued_cust is null;
 
-- 7.Display the branch numbers and the total count of employees in each branch. 
Select Branch_no, count(*) as Count_of_Employees from Employee group by Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
select Customer.Customer_name
from Customer 
join IssueStatus  on Customer.Customer_Id = Issuestatus.Issued_cust
where month(issuestatus.Issue_date) = 6
  and year(issuestatus.Issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history. 
Select Book_title from books where Category='History';

-- 10.Retrieve the branch numbers along with 
-- the count of employees for branches having more than 5 employees

Select Branch_no, count(*) as Count_of_Employees 
from Employee group by Branch_no having count(*)> 5;

-- 11. Retrieve the names of employees who manage branches 
       -- and their respective branch addresses.
       
select employee.Emp_name as Manager, branch.branch_no, branch.Branch_address from Employee 
join Branch on employee.Branch_no=Branch.Branch_no 
where Employee.Position= 'Manager';

-- 12.  Display the names of customers 
-- who have issued books with a rental price higher than Rs. 25

select Customer.Customer_name, Books.Rental_price
from Customer 
join IssueStatus  on Customer.Customer_Id = Issuestatus.Issued_cust
Join Books on Issuestatus.Isbn_book= Books.ISBN
where Books.Rental_price > '25';



