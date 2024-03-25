# Lecture 42 - Peoject Brief Demographic Analysis:

# You are working on a project for the World Bank and you
# are working on a project to analyse the World's dempgraphic
# trends. 

# You are required to produce a scatter plot illustrating birth rates and
# internet usage per country/
# The scatter plot needs to be categorised by Country's Income Groups

# Required Files Demographic Date.csv and one more used later in the section.

# File has columns: Country Name, Country Code, Birth Rate, Inrwenwr UYsers, Income Group
# Income grouop defined in words High Low Upper Middle etx.

# Looking for overall trend so not interested in country or country code.

# Internet users given as percentage of population.  Is that total populatin or
# population over a certain age?

# Birth Rates column - Number of new births per thousand people.  Immediately the number do
# not look right, as numbers are very low, maybe some nuance that the tutor has not explained.

# Lecture 43 - Importing data into R

# Firstly using manually chossing the file and another where you have to set the directory

# Firstly explain Read CSV function.  Functin read.csv()

# read.csv() Reads a file and creates a data frame from it, with cases corresponding
# to Lines and variables to fields in the file.
# read.csv(file, header = TRUE, sep = ",", quote = "\"",dec = ".", fill = TRUE, comment.char = "", ...)


# Method 1:

stats <- read.csv(file.choose())

# Note for some reason my dialogue box is popping up behind this screen!

stats
# Cool when typed stats a popup appeared with a snippet of the data

# Method 2 set readning directory and read data from there.

getwd()

# to set working directory in Windos:
# setwd('C:\\Users\\Roy\\Desktop\\R_Programming')
# Not going to do that as my working directory is set as I want it to
# top level directory.

rm(stats)
stats

stats <- read.csv("./Resources/P2-Demographic-Data.csv", stringsAsFactors = T)
# Nice works same as pd.read_csv :)

# stats  Rem out call to dataframe as don't want it to run every time run through the file

# Lecture 44 - Exploring your dataset

# Can simply type df name to see all the data.  Not good on bigger sets

# To see how mayb records per df:

nrow(stats)
# Imported 195 Rows from dataset.

ncol(stats)
# Imported 5 Columns from dataset

head(stats)
# Givbes top six rows.  Not unlike in  python pandas

tail(stats)
# Same as in python pandas

head(stats, n = 10)
# To change the uumber of lines same true of tail.

str(stats)
# stands for structure.  No unlike .info in pandas. Doesn't show the number of NaNs though
# factor - gives data aabout categorical variables  - Bit ub nt versi9on
# Tutor has numbers relating to the variables.

summary(stats)
# Gives summary statistics of the data frame

# Lecture 45 Using the $ sign:

# Finding the birthrate for Angola

stats[3, 3]

# Or:

stats[3, 'Birth.rate']
# Could not do it with 'angola', 3 as not a row name.

# The $ is another way to access your data in a data frame.

stats$Internet.users
# Will return a whole column of data as a vector

# To access a certain row in the vector:

stats$Internet.users[2]
# Returns the value of row 2 of Internet.users

# Not included in the the lecture:
stats$Internet.users[stats$Country.Name == 'Angola']
# Nice to see it works like pandas.

# Another use of $ sign - to show levels for one group:

levels(stats$Income.Group)
# Oddly m9ne gives null where the tutors gives the levels
# Had to add extra argument to the read.csv statement as the default changed:
# strubgsAsFactors= T.  Took a long while to find that little gem
#
# Lecture 46 Basic operations with Data Frames:

# 1) Subsetting:

stats[1:10, ]
stats[3:9,]
stats[c(4, 100),]
is.data.frame(stats[1,])
# Note even a single row of dataframe does not turn into a vector.
is.data.frame(stats$Country.Name)
is.data.frame((stats[,1]))
# Tutor does not tell us what this is, is.vector and is.matrix both show false

# To preserve column as DF:

is.data.frame(stats[, 1, drop = FALSE])

# Maths operations:

# multiplication, multiply birth rate by internet users, just to show how it works:

stats$Birth.rate * stats$Internet.users

# Add a column:

stats$My.calc <- stats$Birth.rate * stats$Internet.users
head(stats)

# Vector recycling used in DFs too, so adding col 1:5 will give a column counting
# 1:5 all the way down.

#To Remove a column:

stats$My.calc <- NULL
head(stats)


# Lecture 47 - Filtering a Data Frame

# To find any country with less than 2% internet users:

stats$Internet.users < 2
# Experimented with above, covered a few steps later by tutor
stats[stats$Internet.users < 2,]

# To use above method to filter out rows from df:

filt <- stats$Internet.users < 2
stats[filt,]
# Do Not Forget the Comma!

# Filter out countries with birthrate > 40

stats[stats$Birth.rate > 40,]

# Same and with Internet users under 2

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
# Easy enough, pretty much as with pandas.

# Try with Or function:
stats[stats$Birth.rate > 40 | stats$Internet.users < 2,]
# Not covered in the tutorial yet.

# Filter out all high income countries

stats[stats$Income.Group == 'High income',]
# NB R seems to be case sensitive.

# Quick Exercise:  Find all Infromation about Malta

stats[stats$Country.Name == 'Malta',]
# pretty simple.

# Lecture 48 Introduction to qplot:

library(ggplot2)
?qplot()

qplot(data = stats, x=Internet.users)
# Automatically gives axis name and bins automatically to produce a distribution

qplot(data = stats, x=Income.Group, y = Birth.rate)
# Picks correct chart type based on inputs.

qplot(data = stats, x=Income.Group, y = Birth.rate, size = 5)
# Note that qplot has added a legend as well as changing size to avoid this:

qplot(data = stats, x=Income.Group, y = Birth.rate, size = I(5))
# Apparently the reason for the I is pretty complicated and will not go into it.
# Also need to use this if changing colours.  This is just an intorduction to work
# us into using ggplot.

qplot(data = stats, x=Income.Group, y = Birth.rate, size = I(5), colour = I('blue'))
# Without the I uses red and adds a legend.

qplot(data = stats, x=Income.Group, y = Birth.rate, geom = 'boxplot')

# Lecture 49 Visualising with qplot: Part 1

qplot(data = stats, x = Internet.users, y = Birth.rate,
      size = I(5),
      colour = Income.Group)

rm(filt)
# Tidy vector no longer needed

# Colour without the I maps it to a column's data, assume same true for size.
# Looks like adding a title is a bastard and qplot has  been deprecated since ggplot2

# Lecture 50 Building Dataframes

# The rerquirement given:

# You have received an urgent update request from your manager

# You are required to produce a second scatter plot also illustrating Birth Rate
# and internet usage statistics by country.

# However this scatter plot needs to be categorised by countries' region.

# Additional data has been supplied in the form of R vectors.

# Building a df from vectors:

my_df <- data.frame(Country = Countries_2012_Dataset,
                    Code = Codes_2012_Dataset,
                    Region = Regions_2012_Dataset,
                    stringsAsFactors = T)
# Note lack of quotes round names. Can also use with Rbind() and Cbind() functs

# head(my_df, 5)

# Column Names too long need changing:

# colnames(my_df) <- c('Country', 'Code', 'Region')
# Commented out as another way of doing this to be shown better than 2 lines
# head(my_df)
# rm(my_df)

head(my_df)
summary(my_df)
# my output looks different to the tutor's.  Have to assume that, as this course
# is pretty old that there have been changes to the function.  My output gives
# pretty much same information but does not give the country names nor a count of
# Each Country as does his.  Will look up later if a different function exists to give
# basic stats for a df.

# Lecture 51 Merging Dataframese:

# Add regions from my_df to the stats df.:

# Tutor explaining basics of using data, using codes better than country names.

merged <- merge(stats, my_df, by.x='Country.Code', by.y='Code')
# head(merged)
# Not significantly different to the method used in Pandas.  Just need to retrain
# muscle memory to us by.x and by.y.  Need to look into merge types if they are availavle.

# As with pandas match column is not repeated but Country is repeated so remove that column:

# merged$Country <- NULL
# head(merged)
# Must try to remember to not try using .head() as in python!!!

str(merged)
# Again my Region is Chr type and tutor has factor.
# Cired by setting arg stringsAsFactors = T as with the matrices.

# Lecture 52 Visualising with qplot(): Part 2
# Start the challenge

# You are required to produce a second scatter plot also illustrating Birth Rate
# and internet usage statistics by country.
# However this scatter plot needs to be categorised by countries' region.

qplot(data = merged, x = Internet.users, y = Birth.rate,
      size = I(3),
      colour = Region)
# Not Happy with the plot it doesn't mention country name but there are too many
# Countries to distinguish.  Other plot types may give more scope but still not
# Going to fit them all into 1 sweep of the eye.
# Would rather group the countries by Region and sub-group by Birthrate then
# Produce several plots to show the stats assuming the actual wording of the
# requirement was not well thought out.

#Tutors solution:

# Firstly adding shapes.  I tried with pch but got error message

qplot(data = merged, x = Internet.users, y = Birth.rate,
      size = I(3),
      colour = Region,
      shape = I(17))

# Transparency:

qplot(data = merged, x = Internet.users, y = Birth.rate,
      size = I(3),
      colour = Region,
      shape = I(17),
      alpha = I(0.6),
      main = 'Birth Rate vs Internet Users by Region')

# Damn didn't spot the main argument when was lookign for tiles for other polots