create database studentLibrary


create table student(
student_id int primary key,
student_name varchar(100),
surname varchar(100),
birthday Date,
gender char(1),
class varchar (10),
point int
)

create table borrows(
borrowid int primary key,
studentid int,
takenDate date,
BroughtDate date)


create table books(
bookid int primary key,
nameofthebook nvarchar(200),
page_Count int,
point int,
authorid int,
typeid int
)

create table authors(
authorid int primary key,
nameoftheauthor nvarchar(200),
surname nvarchar(200)
)
drop table authors
CREATE TABLE types (
    typeId INT PRIMARY KEY,
    name VARCHAR(50)
);
-- insert data into students
insert into student(student_id, student_name, surname, birthday, gender, class, point)
values
(1, 'Alice', 'Johnson', '2005-06-15', 'F', '10A', 85),
(2, 'Bob', 'Smith', '2006-09-23', 'M', '10A', 90),
(3, 'Charlie', 'Brown', '2005-08-10', 'M', '10B', 78),
(4, 'Diana', 'Carter', '2004-03-05', 'F', '11A', 88);

--insert values into borrows
INSERT INTO borrows (borrowid, studentid, takenDate, broughtDate) VALUES
(1, 1, '2024-01-10', '2024-01-20'),
(2, 2, '2024-01-15', '2024-01-25'),
(3, 3, '2024-01-20', '2024-01-30'),
(4, 4, '2024-02-01', '2024-02-11');


--insert into books
INSERT INTO books (bookid, nameofthebook, page_Count, point, authorid, typeid) 
VALUES
(1, 'Pride and Prejudice', 279, 5, 1, 3),
(2, 'Adventures of Huckleberry Finn', 366, 4, 2, 1),
(3, 'A Tale of Two Cities', 489, 5, 3, 1),
(4, 'War and Peace', 1225, 5, 4, 1);

--insert into authors
INSERT INTO authors (authorid, nameoftheauthor, surname) VALUES
(1, 'Jane', 'Austen'),
(2, 'Mark', 'Twain'),
(3, 'Charles', 'Dickens'),
(4, 'Leo', 'Tolstoy');


--insert into types
INSERT INTO types (typeId, name) VALUES
(1, 'Fiction'),
(2, 'Science Fiction'),
(3, 'Romance'),
(4, 'Mystery'),
(5, 'Biography');

select *from student
select*from borrows
select *from books
select *from authors
select *from types

 --List all the records in the student chart
 select *from student
 
 --List the name surname and class of the student in the student table
 select student_name, surname, class from student

 -- List the gender Female (F) records in the student table
 select student_name from student where gender='F'

 -- List the names of each class in the way of being seen once in the student table 
 select distinct class from student

 -- List the students with Female gender and the class 10Math in the student table
 select *from student where gender= 'F' and class='10Math'

 -- List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table 
 select *from student where class in ('10Math', '10sci')

 -- List the students name surname and school number in the student table
 select student_name, surname, student_id as School_Number from student

 --List the students name and surname by combining them as name surname in the student table
 select concat(student_name, ' ', surname) as Student_Name from student;

 select *from student

 -- List the students with the names starting with “A” letter in the student table
select *from student where student_name like 'a%'

-- List the book names and pages count with number of pages between 50 and 200 in the book table
select  nameofthebook, page_Count from books where page_Count between '50' and '200'

-- List the students with names Emma Sophia and Robert in the student table
select *from student where student_name in ('Emma', 'Sophia', 'Robert')

-- List the students with names starting with A D and K in the student table 
select *from student where student_name like 'a%' or student_name like 'd%' or student_name like 'k%'

-- List the names surnames classes and genders of males in 9Math or females in 9His in the student table
select *from student where (gender='M' and class='9Math') or (gender ='F' and class='9His')

-- List the males whose classes are 10Math or 10Bio
select *from student where gender='M' and class in ('10Math', '10Bio')

--List the students with birth year 1989 in the student table
select *from student where year(birthday) = '1989'

-- List the female students with  student numbers between 30 and 50
select *from student where gender = 'F' and student_id between 30 and 50

-- List the students according to their names
select *from student order by student_name asc

-- List the students by names for those with same names. List them by their surnames //doubt
select * from student ORDER BY student_name, surname;

-- List the students in 10Math by decreasing school numbers 
select *from student where class='10Math' order by student_id desc

--List the first 10 records in the student chart
select top 10 *from student

-- List the first 10 records name surname and date of birth information in the student table
select top 10 student_name, surname, birthday from student

--List the book with the most page number
SELECT top 1 * FROM books ORDER BY page_Count DESC ;

--List the youngest student in the student table 
select top 1 *from student order by birthday desc

-- List the oldest student in the 10Math class
select top 1 *from student WHERE class = '10THMATH' ORDER BY birthday asc

--List the books with the second letter N
select *from books where nameofthebook like '%n%'

--List the students by grouping according to their classes
select *from student
select count(student_id)
from student
group by class

-- List the students to be different in each questioning randomly //doutb

-- Pick a random student from student table //doubt

-- Bring some random student’s name , surname and number from class 10Math //doubt

-- Add the writer named Smith Allen to the authors table
insert into authors values ('5','smith','allen');

--Add the genre of  biography to the genre table
insert into types(typeid, name) values ('6', 'Biography')

-- Add 10Math Class male named Thomas Nelson , 9Bio class female named Sally Allen and 11His Class female named Linda Sandra in one question 
select *from student
insert into student(student_id, student_name, surname, birthday, gender, class, point) values
('5', 'Thomas', 'Nelson', '1989-06-12','M', '10MATH', 90),
('6', 'Sally', 'Allen', '1990-07-18', 'F', '9Bio', 87),
('7', 'Linda', 'Sandra', '2000-08-09', 'F', '11His', 90)

-- Add a random student in the students chart to the writers chart as an authors //doubt 


--Add students with student numbers between 10 and 30 as authors //doubt

-- Change the class of the student whose school number is 3 from 10Bio to 10His 
update student set class = '10his' where student_id= '3'

--Transfer all the students in 9Math Class to 10Math Class 
update student set class='10Math' where class='9Math' 

--Increase all of the students’ score by 5 points 
NOTE 1: The most important thing in delete interrrogation is the part of condition.
If the condition isn’t written, all records are included to the cleaning process.. 
NOTE 2: TRUNCATE TABLE instruction will be given 
at the end of interrogation. (It is used for 
empting the table TRUNCATE TABLE TABLE NAME) 

UPDATE student SET point = point + 5;

select *from student


--Delete the author #25 When searching for the records whose rate are null in the select questıons, you can’t search 
for field area=null to research the area whose 
fieald area are null , İt is used null 
statement. 
select *from authors
DELETE FROM authors WHERE authorid = 25;

--List the students whose birth dates are null 
SELECT * FROM student WHERE birthday IS NULL;
--List the name ,surname and the dates of received books of the student
select *from student
select *from borrows

select student.student_name, student.surname, borrows.takenDate, borrows.BroughtDate
from student
join Borrows on Student.student_id= borrows.studentid

