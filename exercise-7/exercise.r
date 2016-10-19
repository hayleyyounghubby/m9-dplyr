# Exercise 7: DPLYR practice with NBA data

# Read in the NBA player data into a variable called `team.data` using `read.csv`
setwd("/Users/hayleyyounghusband/m9-dplyr/exercise-7") # Setting working directory to access data
team.data <- read.csv('data/teams.csv')

# The data.frame team.data should now be accessible to you. 
# View it, and get some basic information about the number of rows/columns. 
View(team.data) # Viewing the data.frame
nrow(team.data) # 30
ncol(team.data) # 26
colnames(team.data)
# [1] "Rk"   "Team" "G"    "MP"   "FG"   "FGA"  "FG."  "X3P"  "X3PA" "X3P." "X2P" 
# [12] "X2PA" "X2P." "FT"   "FTA"  "FT."  "ORB"  "DRB"  "TRB"  "AST"  "STL"  "BLK" 
# [23] "TOV"  "PF"   "PTS"  "PS.G"
rownames(team.data)
# [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15"
# [16] "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30"

# Note the "X" preceding some of the column titles as well as the "*" 
# following the names of teams that made it to the playoffs that year.


# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team
team.data <- mutate(team.data, Ratio = TOV / STL)

# Sort the teams from lowest turnover/steal ratio to highest
# Which team has the lowest ratio?
team.data <- arrange(team.data, Ratio) 
# Boston Celtics

# Using the pipe operator, create a new column of assists per game (AST / G) AND
# sort the data.frame by this new column in DESCENDING order.
team.data <- mutate(team.data, Assists = AST / G) %>% arrange(-Assists) 

# Create a data.frame called `good.offense` of teams that scored more than 8700 points (PTS)
good.offense <- filter(team.data, PTS > 8700)
  
# Create a data.frame called `good.defense` of teams that had more than 470 blocks (BLK)
good.defense <- filter(team.data, BLK > 470)

# Create a data.frame called `defense.stats` that only shows defensive rebounds (DRB), steals (STL),
# and blocks (BLK) along with the team name.
defense.stats <- select(team.data, DRB, STL, BLK, Team)

# Create a data.frame called `offense.stats` that only shows offensive rebounds (ORB), 
# field-goal % (FG.), and assists (AST) along with the team name.
offense.stats <- select(team.data, ORB, FG., AST, Team)

### Bonus ###
# Create a function called `BetterShooters` that takes in two teams and returns
# a data.frame of the team with the better field-goal percentage. The returned 
# data.frame should include the team name, field-goal percentage, and points.
BetterShooters <- function(Team1, Team2) {
  better.team <- filter(team.data, Team %in% c(Team1, Team2)) %>%
    filter(FG. == max(FG.)) %>%
    select(Team, FG., PTS)
  return(better.team)
}





