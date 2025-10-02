-- views:a  view is a virtual table based on the result set of an sql statement 


use  library_database_management_system; 


-- creating a view-- 
create view active_loans as 
select load_id,book_id,member_id,loan_date, due_date 
from loan 
where return_date is null;

select * from active_loans;


create view book_view as
select title,year,copies
from book;

select * from book_view;

create view book_details as
select author_id as ID,year as Published_Year,title as book_title
from book
where  year > '1990';

select * from book_details;


-- creating complex views
create view old_books as 
select * from book 
where year =  (select min(year) from book);

select * from old_books;

create view  author_books as
select  a.name,b.title
 from author a 
join book b
on a.author_id = b.author_id;

select * from author_books ;

-- drop view
drop view active_loans;
drop view  author_books ;


