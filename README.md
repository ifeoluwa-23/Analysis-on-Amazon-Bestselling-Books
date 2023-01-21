## Analysis-on-Amazon-Bestselling-Books

This project shows my analysis of Amazon 50 bestselling books from 2009 - 2019.

## :bookmark_tabs: Table of Contents
- 📂 Dataset
- 📙 Case Study Questions
- 🏆 Solution Script

## :open_file_folder: Dataset
The dataset used in this analysis was gotten from kaggle. The Dataset contains 550 books with 7 measures: Name, Author, User Rating, Reviews, Price, Year, and Genre. Reviews represent the number of written reviews on Amazon and Year stands for the Year(s) the book ranked on the bestseller. Genre is either fiction or non-fiction. 

## :closed_book: Case Study Questions
Each of the following case study questions were derived from the data using SQL:

  1. Categorised the 550 books into fiction and non-fiction measures.
  2. Query the top 50 best sellers with a rating parameter showing title, author, year and review.
  3. Books rated above 4.0 between 2009 - 2019.
  4. Books with over 10,000 review between 2009 - 2018.
  5. Number of books based on Genre categories.
  6. Author with the highest number of best selling books between 2009-2019.
  7. Top 5 Most Expensive Best selling Book on Amazon between 2009-2019.
  8. Average Price of book based on Genre.
  9. The best book, with year, author and price between 2009 - 2019.

 ## 	:trophy: Solutions
 <details><summary>View Solution</summary>
<p> 
  
   1. Categorised the 550 books into fiction and non-fiction measures.
   
   ```bash
WITH t
     AS (SELECT CASE
                  WHEN genre = "fiction" THEN title
                END "Fiction",
                CASE
                  WHEN genre = "non fiction" THEN title
                END "NonFiction"
         FROM   amazon)
SELECT *
FROM   t
WHERE  fiction IS NOT NULL
        OR nonfiction IS NOT NULL; 
```
  2. Query the top 50 best sellers with a rating parameter showing title, author, year and review.
   
```bash
SELECT DISTINCT title,
                author,
                year,
                reviews,
                rating
FROM   amazon
ORDER  BY rating DESC
LIMIT  50; 
```

  3. Books rated above 4.0 between 2009 - 2019.
   
```bash
SELECT DISTINCT title,
                user_rating
FROM   amazon
WHERE  year <= 2019
       AND user_rating > 4
ORDER  BY user_rating DESC; 
```

  4. Books with over 10,000 review between 2009 - 2018.
   
```bash
SELECT DISTINCT title,
                reviews
FROM   amazon
WHERE  year <= 2018
       AND reviews > 10000
ORDER  BY reviews DESC; 
```

  5. Number of books based on Genre categories.
   
```bash
SELECT genre,
       Count(title) AS No_of_books
FROM   amazon
GROUP  BY genre;
```

  6. Author with the highest number of best selling books between 2009-2019.
   
```bash
SELECT author,
       Count(title) AS No_of_books
FROM   amazon
GROUP  BY author
ORDER  BY no_of_books DESC; 
```

  7. Top 5 Most Expensive Best selling Book on Amazon between 2009-2019.
   
```bash
SELECT title,
       Max(price) AS Price
FROM   amazon
GROUP  BY title
ORDER  BY price DESC
LIMIT  5; 
```

  8. Average Price of book based on Genre.
   
```bash
SELECT genre,
       Round(Avg(price), 2) AS Average_price
FROM   amazon
GROUP  BY genre;  
```

  9. The best book, with year, author and price between 2009 - 2019.
   
```bash
SELECT author,
       title,
       Count(title) AS No_of_books,
       year,
       price
FROM   amazon
GROUP  BY title
ORDER  BY no_of_books DESC
LIMIT  1;
```
