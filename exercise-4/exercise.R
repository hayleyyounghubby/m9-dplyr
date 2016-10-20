# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)
nrow(flights) # 336776
ncol(flights) # 19

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, time_gained = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, -time_gained)

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- mutate(flights, time_gained = arr_delay - dep_delay) %>%
  arrange(-time_gained)

# Make a histogram of the amount of gain using the `hist` command
hist(flights$time_gained)

# On average, did flights gain or lose time?
mean(flights$time_gained, na.rm = TRUE) # -5.659779

# Create a data.frame that is of flights headed to seatac ('SEA'), 
flights.seatac <- flights %>% select(time_gained, dest) %>% filter(dest == 'SEA')

# On average, did flights to seatac gain or loose time?
mean(flights.seatac$time_gained, na.rm = TRUE) # -11.6991

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see slides on standard evaluation


# Retireve the air_time column for flights from JFK to SEA


# What was the average air time of those flights (in hours)?  


# What was the min/max average air time for the JFK to SEA flights?
