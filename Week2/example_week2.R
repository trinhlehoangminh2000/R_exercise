#Import the library
library(tidyverse);

#Import the table
DS <- read.table("C:/Users/User/Documents/rExercise/Week2/data/auto-mpg.data", quote="\"",comment.char="");
#name the column
names(DS) <- c("mpg","cylinders","displacement","horsepower","weight","acceleration","model year","origin","car name");
#change the object to tibble objects
DS <- as_tibble(DS);

attach(DS); 

#Filer the table wiht conditions
filterDS <- filter(DS, weight > 3500);
filter(DS, DS$weight > 3500);

#Arrange the table
arrange(DS, desc(DS$acceleration));



#select without column 1
select(DS, -1); 

#select column 2 3 4
select(DS, 2,3,4);
select(DS, 1,2);select(DS, c(mpg,2));

# Create a column based on the condition or calculation
DS2 <- mutate(DS, a4w = acceleration/weight, pre75 = as.numeric(DS$`model year`<75));

#Group by model year, calculated respective mean of displ and standard deviation of displ and count using functin n
summaryDS <- summarise(group_by(DS, `model year`), mean_displ = mean(displacement), sd_displ= sd(displacement), n =n())

rm(car_cost);

#Read the new file
car_cost <-read_delim("C:/Users/User/Documents/BUINT/Week2/data//car_197x_costs_2.csv", 
                      delim = "-", 
                      escape_double = FALSE, 
                      na = "NA", trim_ws = TRUE, 
                      col_types =cols(`Car Name` = col_factor(), 
                                      Price = col_character(), 
                                      Location = col_character(), 
                                      `Matriculation Year` = col_integer()));
# change car cost to tibble object
car_cost <- as_tibble(car_cost);

# change the variable type from char to factor
car_cost <- mutate(car_cost, Location = sapply(Location,as.factor));

# change price to integer removing the $ sign
car_cost <- mutate(car_cost, Price = as.integer(str_replace(str_sub(Price, 2, -1),",","")))


