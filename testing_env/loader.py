# code  for loading movies data from csv files to database using SQLAlchemy

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine
from sql_config import login_pwd
import csv


engine = create_engine(f'postgresql://{login_pwd}@localhost:5432/p2')
connection = engine.connect()

# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(engine, reflect=True)
Movie = Base.classes.moviesandshows
Platform = Base.classes.source

session = Session(engine)

# lookup or creating new entry in platform  table
def get_platform(pl_name):
    plat = session.query(Platform).filter_by(source=pl_name).first()
    if plat==None:
        plat=Platform(source=pl_name)
        session.add(plat)
    return plat


def load_movies(file, platform):
    print(f'loading: {platform}')
    pl=get_platform(platform)

    # open "file" as CSV file 
    with open(file, encoding = 'utf-8') as csvfile:

    # CSV reader specifies delimiter and variable that holds contents
        csvreader = csv.reader(csvfile, delimiter=',')
        csv_header = next(csvreader)
        
        # loop through it 
        for row in csvreader:
            movie_id=row[0]  # get from row
            movie_title= row[1] #get from row

            m = session.query(Movie).filter_by(imbd_id=movie_id).first()
            if m==None:
                m=Movie(imdb_id=movie_id, title=movie_title, year=row[2], rated=row[3], \
                    released=row[4], genre=row[6], director=row[7], writer=row[8], actors=row[9], language=row[10], \
                        country=row[11], imdb_rating=row[12], runtime=row[5], type=row[15]) # create full movie object from row
                session.add(m)

            m.source_collection.append(pl)
            
            # pl.movies_collection.append(m)

            session.commit()

load_movies('../OutputData/crackle.csv', 'Crackle')
load_movies('../OutputData/NetflixDB.csv', 'Netflix')
load_movies('../OutputData/disneyplus.csv', 'Disney+')


session.close()


