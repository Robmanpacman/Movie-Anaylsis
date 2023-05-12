from bs4 import BeautifulSoup
import requests, openpyxl
#creating the excel sheet
excel = openpyxl.Workbook()
print(excel.sheetnames)
sheet = excel.active
#changing the title of the sheet
sheet.title = 'Top Rated Movies'
print(excel.sheetnames)
#creating the columns for our sheet
sheet.append(['Movie Rank','Movie Name','Year Released','IMDB Rating'])


try:    
#grabbing the source code from the imdb wesbite
    source = requests.get('https://www.imdb.com/chart/top/?ref_=nv_mv_250')

#checking if the url actually exists
    source.raise_for_status()

#now im going to parse the html source code
    soup = BeautifulSoup(source.text,'html.parser')
    
#fetching the movie list 
    movies = soup.find('tbody',class_='lister-list').find_all('tr')

#loop to get all the movie titles from my movies variable
    for movie in movies:
#the name will be found in the 'td' tag, inside the 'titleColumn' class
        name = movie.find('td',class_="titleColumn").a.text
#the rank will also be found in the 'td' tag, but outside the 'titleColumn' class so i have to get_text and split the '.' 
        rank = movie.find('td',class_="titleColumn").get_text(strip=True).split('.')[0]
#the year is found in the 'td' tag, also outside the 'titleColumn' class so im stripping the '()' out
        year = movie.find('td',class_="titleColumn").span.text.strip('()')
#the rating is found in 'td' tag, inside the 'ratingColumn imdbRating' class 
        rating = movie.find('td', class_="ratingColumn imdbRating").strong.text

    

        print(rank,name,year,rating)
#putting the results into the excel sheet in order        
        sheet.append([rank,name,year,rating])
except Exception as e:
    print(e)
#this will create and save the excel sheet with all our results 
excel.save('IMDB Movie Ratings.xlsx')