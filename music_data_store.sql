create database music_data;
use music_data;

select * from album2;

--- Q1) who is the senior most employee based on job title ?

select * from employee;

select employee_id , first_name , last_name , title , levels from employee
order by levels desc
limit 1;



--- Q2) which countries have the most invoices ?

select * from invoice;

select billing_country , count(*) as most_invoice
from invoice
group by billing_country
order by most_invoice desc;



--- Q3) what are Top 3 values of total invoice ?

select total from invoice
order by total desc
limit 3;




--- Q4) which city has the best customer? we would like to throw a promotional music festival in the city we made the most money . write a query that returns one city that has highest sum of invoice totals. retur both city name & sum of all invoice totals 

select billing_city, sum(total) as high_sum from invoice
group by billing_city
order by high_sum desc
limit 1;




--- Q5) who is the best customer? the customer who has spent  the most money will be declared the best customer .write a quert that returns the person who has spent the most money 


select * from invoice;

select customer.customer_id , customer.first_name , customer.last_name , sum(invoice.total) as total
 from customer 
inner join invoice 
on customer.customer_id = invoice.customer_id 
group by invoice.customer_id
order by total desc;




--- Q6) write a query to return email , first name , last name, genre of all rock music listners . return your list ordered alphabetically by mail starting with A.  


select distinct email , first_name , last_name
from customer
inner join invoice
on customer.customer_id = invoice.customer_id
inner join invoice_line
on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
select track_id from track
inner join genre
on track.genre_id = genre.genre_id
where genre.name like 'Rock'
)
order by email;




--- Q7)  lets invite the artists who have written the most rock music in our dataset . write a query to return the artist name & total track count of the top 10 rock bands.

select artist.artist_id , artist.name , count(artist.artist_id) as number_of_songs
from track
join album
on album.album_id = track.album_id
join artist
on artist.artist_id = album.artist_id
join genre
on genre.genre_id = track.genre_id
where genre.name = 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;