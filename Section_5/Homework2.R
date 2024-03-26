# Lecture 54: Homework World Trends

#You are expected to produce a scatter plot depicting life expectancy
# y axis and Fertility rate x axis statistics per country.
# The Scatterplot needs to be categorised by countries' region
# You have been given data for 2 years: 1960 and 2013 you are requred to
# produce a visualisation for each of these years
# Some data has been provided in a csv file and some in R vectors
# The CSV contains combined data for both years.  All data manipulations
# to be performed in R.
# You have also been requested to provide insights into how the 2 periods compare.

# First get the dataframes.
# 1) Produce dataframe from the vectors.

Data_1960 <- data.frame(Country_Code,Life_Expectancy_At_Birth_1960,stringsAsFactors = T)
Data_2013 <- data.frame(Country_Code,Life_Expectancy_At_Birth_2013, stringsAsFactors = )
# str((Data_1960))
# str(Data_2013)

# Produce Dataframe from the csv file:

Fertility_Data <- read.csv("./Resources/P2-Section5-Homework-Data.csv", stringsAsFactors = T)
#str(Fertility_Data)
# tail(Fertility_Data)
Fertility_1960 <- Fertility_Data[1:187,]
# tail(Fertility_1960)
Fertility_2013 <- Fertility_Data[188:374,]
# tail(Fertility_2013)
# head(Fertility_2013)

# Join the dataframes 1960 to 1960 and 2013 to 2013
colnames(Fertility_1960)
colnames(Fertility_1960) <-c('Country.Name', 'Country.Code', 'Region', 'Year', 'Fertility.Rate1960')
colnames(Data_1960) <- c('Country.Code', 'Life.Expectancy')
Data_1960 <- merge(Fertility_1960, Data_1960, by.x = 'Country.Code', by.y = 'Country.Code')
head(Data_1960)
colnames(Fertility_2013) <-c('Country.Name', 'Country.Code', 'Region', 'Year', 'Fertility.Rate2013')
colnames(Data_2013) <- c('Country.Code', 'Life.Expectancy')
Data_2013 <- merge(Fertility_2013, Data_2013, by.x = 'Country.Code', by.y = 'Country.Code')
head(Data_2013)
# tail((Data_2013))

# Visaulise data for 1960

qplot(data = Data_1960, x=Fertility.Rate1960,
      y=Life.Expectancy,
      colour = Region,
      shape = I(19),
      alpha = I(.6),
      size = I(3),
      main = 'Birth Rate / Life Expectancy 1960 by Region',
      ylab = 'Life Expentancy',
      xlab = 'Fertility Rate')

# Visaulise data for 2013

qplot(data = Data_2013, x=Fertility.Rate2013,
      y=Life.Expectancy,
      colour = Region,
      shape = I(19),
      alpha = I(.6),
      size = I(3),
      main = 'Birth Rate / Life Expectancy 2013 by Region',
      ylab = 'Life Expentancy',
      xlab = 'Fertility Rate')

# merge dataframes:
rm('Merge_Years')  # Removed too many columns!

Merge_Years <- merge(Fertility_1960, Fertility_2013, by.x = 'Country.Code', by.y = 'Country.Code')
head(Merge_Years)
Merge_Years['Year.x']<-NULL
Merge_Years['Country.Name.y']<-NULL
Merge_Years['Region.y']<-NULL
Merge_Years['Year.y']<-NULL
Merge_Years['Country.Name.y'] <- NULL
head(Merge_Years)
colnames(Merge_Years) <- c('Country.Code', 'Country.Name', 'Region', 'Fertiity.Rate.1960', 'Fertility.Rate.2013')
head(Merge_Years)

# Try a different type of merge

colnames(Data_1960)
colnames(Data_2013)
col.names <- c('Country.Code', 'Country.Name', 'Region', 'Year', 'Fertility.Rate', 'Life.Expectancy')
col.names
colnames(Data_1960) <- col.names
colnames(Data_2013) <- col.names
colnames(Data_1960) == colnames(Data_2013)

Bind.Data <- rbind(Data_1960, Data_2013)
head(Bind.Data)
tail(Bind.Data)

Bind.Data['Year'] <- lapply(Bind.Data['Year'] , factor)

str(Bind.Data)

qplot(data = Bind.Data, x=Fertility.Rate,
      y=Life.Expectancy,
      colour = Region,
      shape = Year,
      alpha = I(.6),
      size = I(3),
      main = 'Birth Rate / Life Expectancy 1960 vs 2013 by Region',
      ylab = 'Life Expentancy',
      xlab = 'Fertility Rate')


# Don't like the graph produced but it does the job.

## Tutor cheated he didn't produce a graph comparing the 2 years as per the spec.
## He simply compared each years graphs side by side!
## Prefer having a graph that compares the 2 was hoping he would go through
## Prodducing pair plots or some other form of plot capable of showing hte
## 2 sets together.

