# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
# Generate models and tables, according to the domain model.
# TODO!

#1. rails generate model Studio
#t.string "name"
#2. rails generate model Movie
#t.string "title"
#t.integer "year_released"
#t.string "rated"
#t.integer "studio_id"
#3. rails generate model Actor
#t.string "name"
#4. rails generate model Role
#t.integer "movie_id"
#t.integer "actor_id"
#t.string "character_name"


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Studio
Warner_Bros = Studio.new
Warner_Bros["name"] = "Warner Bros"
Warner_Bros.save
puts Warner_Bros["id"]

puts "Studios: #{Studio.all.count}" 

#Movie
Batman_Begins = Movie.new
Batman_Begins["title"] = "Batman Begins"
Batman_Begins["year_released"] = "2005"
Batman_Begins["rated"] = "PG-13"
Batman_Begins["studio_id"] = Warner_Bros["id"]
Batman_Begins.save

The_Dark_Knight = Movie.new
The_Dark_Knight["title"] = "The Dark Knight"
The_Dark_Knight["year_released"] = "2008"
The_Dark_Knight["rated"] = "PG-13"
The_Dark_Knight["studio_id"] = Warner_Bros["id"]
The_Dark_Knight.save

The_Dark_Knight_Rises = Movie.new
The_Dark_Knight_Rises["title"] = "The Dark Knight Rises"
The_Dark_Knight_Rises["year_released"] = "2012"
The_Dark_Knight_Rises["rated"] = "PG-13"
The_Dark_Knight_Rises["studio_id"] = Warner_Bros["id"]
The_Dark_Knight_Rises.save

puts "Movies: #{Movie.all.count}" 

#Actor
Christian_Bale = Actor.new
Christian_Bale["name"] = "Christian Bale"
Christian_Bale.save

Michael_Caine = Actor.new
Michael_Caine["name"] = "Michael Caine"
Michael_Caine.save

Liam_Neeson = Actor.new
Liam_Neeson["name"] = "Liam Neeson"
Liam_Neeson.save

Katie_Holmes = Actor.new
Katie_Holmes["name"] = "Katie Holmes"
Katie_Holmes.save

Gary_Oldman = Actor.new
Gary_Oldman["name"] = "Gary Oldman"
Gary_Oldman.save

Heath_Ledger = Actor.new
Heath_Ledger["name"] = "Heath Ledger"
Heath_Ledger.save

Aaron_Eckhart = Actor.new
Aaron_Eckhart["name"] = "Aaron Eckhart"
Aaron_Eckhart.save

Maggie_Gyllenhaal = Actor.new
Maggie_Gyllenhaal["name"] = "Maggie Gyllenhaal"
Maggie_Gyllenhaal.save

Tom_Hardy = Actor.new
Tom_Hardy["name"] = "Tom Hardy"
Tom_Hardy.save

Joseph_Gordon_Levitt = Actor.new
Joseph_Gordon_Levitt["name"] = "Joseph Gordon-Levitt"
Joseph_Gordon_Levitt.save

Anne_Hathaway = Actor.new
Anne_Hathaway["name"] = "Anne Hathaway"
Anne_Hathaway.save

puts "Actors: #{Actor.all.count}" 

#Roles
Role_1 = Role.new
Role_1["movie_id"] = Batman_Begins["id"]
Role_1["actor_id"] = Christian_Bale["id"]
Role_1["character_name"] = "Bruce Wayne"
Role_1.save

Role_2 = Role.new
Role_2["movie_id"] = Batman_Begins["id"]
Role_2["actor_id"] = Michael_Caine["id"]
Role_2["character_name"] = "Alfred"
Role_2.save

Role_3 = Role.new
Role_3["movie_id"] = Batman_Begins["id"]
Role_3["actor_id"] = Liam_Neeson["id"]
Role_3["character_name"] = "Ra's Al Ghul"
Role_3.save

Role_4 = Role.new
Role_4["movie_id"] = Batman_Begins["id"]
Role_4["actor_id"] = Katie_Holmes["id"]
Role_4["character_name"] = "Rachel Dawes"
Role_4.save

Role_5 = Role.new
Role_5["movie_id"] = Batman_Begins["id"]
Role_5["actor_id"] = Gary_Oldman["id"]
Role_5["character_name"] = "Commissioner Gordon"
Role_5.save

Role_6 = Role.new
Role_6["movie_id"] = The_Dark_Knight["id"]
Role_6["actor_id"] = Christian_Bale["id"]
Role_6["character_name"] = "Bruce Wayne"
Role_6.save

Role_7 = Role.new
Role_7["movie_id"] = The_Dark_Knight["id"]
Role_7["actor_id"] = Heath_Ledger["id"]
Role_7["character_name"] = "Joker"
Role_7.save

Role_8 = Role.new
Role_8["movie_id"] = The_Dark_Knight["id"]
Role_8["actor_id"] = Aaron_Eckhart["id"]
Role_8["character_name"] = "Harvey Dent"
Role_8.save

Role_9 = Role.new
Role_9["movie_id"] = The_Dark_Knight["id"]
Role_9["actor_id"] = Michael_Caine["id"]
Role_9["character_name"] = "Alfred"
Role_9.save

Role_10 = Role.new
Role_10["movie_id"] = The_Dark_Knight["id"]
Role_10["actor_id"] = Maggie_Gyllenhaal["id"]
Role_10["character_name"] = "Rachel Dawes"
Role_10.save

Role_11 = Role.new
Role_11["movie_id"] = The_Dark_Knight_Rises["id"]
Role_11["actor_id"] = Christian_Bale["id"]
Role_11["character_name"] = "Bruce Wayne"
Role_11.save

Role_12 = Role.new
Role_12["movie_id"] = The_Dark_Knight_Rises["id"]
Role_12["actor_id"] = Gary_Oldman["id"]
Role_12["character_name"] = "Commissioner Gordon"
Role_12.save

Role_13 = Role.new
Role_13["movie_id"] = The_Dark_Knight_Rises["id"]
Role_13["actor_id"] = Tom_Hardy["id"]
Role_13["character_name"] = "Bane"
Role_13.save

Role_14 = Role.new
Role_14["movie_id"] = The_Dark_Knight_Rises["id"]
Role_14["actor_id"] = Joseph_Gordon_Levitt["id"]
Role_14["character_name"] = "John Blake"
Role_14.save

Role_15 = Role.new
Role_15["movie_id"] = The_Dark_Knight_Rises["id"]
Role_15["actor_id"] = Anne_Hathaway["id"]
Role_15["character_name"] = "Selina Kyle"
Role_15.save

puts "Roles: #{Role.all.count}" 

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Studio_Test = Studio.find_by({ "name" => "Warner Bros" })
# puts Studio_Test.inspect


# Movies_Data = Movie.where({"studio_id" => Studio_Test["id"] })
# puts Movies_Data.inspect

movies_all = Movie.all
# puts movies_all

for movie in movies_all
    #puts movie.inspect
    #puts movie["title"]
    studio_movie = Studio.find_by({"id" => movie["studio_id"]})
    puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio_movie["name"]}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

roles_all = Role.all
# puts movies_all

for roles in roles_all
    role_movie = Movie.find_by({"id" => roles["movie_id"]})
    actor_role = Actor.find_by({"id" => roles["actor_id"]})
    puts "#{role_movie["title"]} #{actor_role["name"]} #{roles["character_name"]}"
end