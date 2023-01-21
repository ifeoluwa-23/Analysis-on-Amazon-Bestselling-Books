use amazon_books;

alter table amazon
rename column rating to Rating;

-- Categorising all books

with t as
(select 
  case when genre ="fiction" then title end "Fiction",
  case when genre ="Non fiction" then title end "NonFiction"
from amazon)
select *
from t
WHERE FICTION IS NOT NULL
OR Nonfiction is not null;

-- Top 50 bestsellers
select distinct
	Title, Author, Year, reviews, rating
from Amazon
order by rating desc
limit 50;

-- books above rating of 4 
select distinct 
	Title, User_Rating
from amazon
where year <= 2019
	and User_Rating > 4
order by User_Rating desc;


-- Books with reviews greater than 10k 
select distinct 
	Title, Reviews
from amazon
where year <= 2018
	and reviews > 10000
order by reviews desc;

-- Number of books based on Genre

select 
	Genre,
	count(title) as No_of_books
from amazon
group by Genre;

-- Authors with the highest number of best selling books between year 2009 - 2019

select 
	Author, count(title) as No_of_books
from amazon
group by Author
order by No_of_books desc;

-- Top 5 Most Expensive Best selling Book on Amazon

select
	Title,
	max(Price) as Price
from amazon
group by Title
order by price desc
limit 5;

-- Average Price of book based on Genre

select
	Genre,
    round(avg(Price),2) as Average_price
from amazon
group by Genre;

-- best book, with year, author and price
select 
	Author, Title, count(title) as No_of_books, year, price
from amazon
group by Title
order by No_of_books desc
limit 1;





