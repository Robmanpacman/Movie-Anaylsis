# Welcome to my Movie Analysis Project! <br>
This project will be about grabbing data off the IMDB website and presenting the data in different programs like SQL and Tableau. I want to show my analysis skills and also manage the database of data with my Data Engineering skills that I have learned.

The questions I want to answer are of the following:
1. Which movie made the most money?
2. Which movies are both in the top 20 in rating and gross?
3. Which movies made the most money between 2010 - 2020?
4. Which director has the most movies in the top 250? 
5. What genre is the most common in the top 250?

These are some questions we can answer using various techinques in Python and SQL. Also presenting our findings with a program like Tableau will make things easier! 
---------------------------------------------------------------------------------------------------------
I start off this project first with web scraping the IMDB website using python. Using the BeautifulSoup library, I can manipulate and grab the certain HTML elements that I want from the IMDB website like movie rank, movie name, etc.. 

![image](C:\Users\rober\OneDrive\Documents\GitHub\Movie-Anaylsis\Python Code Screenshot.png)

After succesfully scraping the data I want, I cleaned it up a bit in Excel. Making sure columns have the right data type like for example the 'Gross' has a default data type of 'abc' so I'm chaning it to 'dec' to make it a decimal column type and have an accurate reading when the data is transfered into SQL and Tableau. 

![][Excel Data Type.png]

