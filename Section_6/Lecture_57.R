


# Movie Ratings Project Brief:

# To Write provide analytical data for an article analysing movie ratings
# by critics and audiences as well as movie budgets for yrs 2007 - 11

# This is the first time they have done this and don't know what the want.
# They have asked you to provide them with 5 graphs that tell a story about the
# data.

# However there is one chart the CEO specifically requested:  A diagram showing
# how the correlation between critic and audience ratings has evolved over the
# years by Genre. This is in addition to the 5 others.

# The CEO's vision has been given to you as a hand drawn chart with Audience
# Rating on the x-axis and the Critic Raing on the y - axis with a qusteion mark
# Where the data should be shown.

# Given data in CSV file comprises 6 columns:  Film, Genre, Rotten Tomatoes Ratings %,
# Audience Rating %, Budget( milling $ ), Year of Release
# Comprises of 562 Titles.

# Rotten Tomatoes, the higher the rating the better the movie.

# Lecture   57 Grammar of Graphics: GGPlot2 - see handwritten notes.

#Lecture 58 What is a Factor? 

library(ggplot2)

movies <- read.csv('./Resources/P2-Movie-Ratings.csv', stringsAsFactors = T)
# head(movies)
# Tidy up column Names in df:
# colnames(movies)
colnames(movies) <- c('Film', 'Genre', 'CriticRating', 'AudienceRating', 'BudgetMillions', 'Year')

# Some basic EDA
# head(movies)
# tail(movies)
# str(movies)  # Thnk that years probably better as factors too
# summary(movies)

# Convert years into factors:
# This way is easier than the way I found on the internet for last section.
movies$Year <- factor(movies$Year)
# str(movies)

# Lecture 59 Aesthetics

# First plots with GGPlot2

ggplot(data = movies,
       aes(x = CriticRating,
           y = AudienceRating,
           colour = Genre,
           size = BudgetMillions,
           ),
       ) +
  geom_point()

# Lecture 60 Plotting with Layers:

# The abobe plot is an object that can be saved to a variable:

p <- ggplot(data = movies,
            aes(x = CriticRating,
                y = AudienceRating,
                colour = Genre,
                size = BudgetMillions,
            )
)
# Oddly tutor got list of 9 for p but I got list of 11? All code same as his.
# My copy of R shows different in the Environment, I have to click magnifying
# glass next to p to see the breakdown in a new tab where his is all in the environment.
# Think I prefer my version.  It is less crowded.  Still worried that I got list of 11 not 9

# To show the  visualisation correctly have to add the geom to the object

p + geom_point()
# Brings the dots back onto the plot.

# To visualise the same plot with lines:

p + geom_line()
# Produces a pretty revolting plot - completely unreadable and totally meaningless.

# Multiple layers:

p + geom_point() + geom_line()
# Even Worse dots there but almost indistinguishable

# Changing the layer order will make the dots more visible:

p + geom_line() + geom_point()
# Ouch my eyes!

# Lecture 61 Over-riding asthaetics:

q <- ggplot(data = movies,
           aes(x = CriticRating,
               y = AudienceRating,
               colour = Genre,
               size = BudgetMillions,
           )
)
# Add Geon Layer:

q + geom_point()

# geom_point is inheriting aesthetics from q

q + geom_point(aes(size = CriticRating))
# Budget now not counted in the plot.
q + geom_point(aes(colour = BudgetMillions))
# But this has not changed q so if run original back to original plot.

# The x and y can also be over-ridden:

q + geom_point(aes(x = BudgetMillions))
# Over-riding X does not change the axis label
# to fix this:

q + geom_point(aes(x = BudgetMillions)) +
  xlab('Budget Millions') +
  ylab('Audience Rating')

# Reduce line size in line and dot plot

p + geom_line(size=1) + geom_point()

# Lecture 62 Mapping Vs Setting

r <- ggplot(data = movies,
          aes(x = CriticRating,
              y = AudienceRating,
          )
)
r + geom_point()

# Add aesthetic with mapping:

r + geom_point(aes(colour = Genre))

# Changing colour by setting

r + geom_point(colour = 'DarkGreen')
# Sets all points to dark green

# another mapping example:

r + geom_point(aes(size = BudgetMillions))

# Same thing with setting:

r + geom_point(size = 10)

# Lecture 62 Histograms and Density Charts:

s <- ggplot(data = movies,
            aes(BudgetMillions))
s + geom_histogram(binwidth = 10)

# Add Colour to the histogram map the fill colour and set the border colour with colour:

s + geom_histogram(binwidth = 10,
                    aes(fill = Genre),
                   colour = 'Black')
# This is deliverable chart 3 (it will be improved later in section)

# Density Charts:

s + geom_density(aes(fill = Genre,
                     alpha = 0.6),)
# Better way:

s + geom_density(aes(fill = Genre),
                 position = 'stack')

# Lecture 64 Starting Layer Tips:

t <- ggplot(data = movies,
            aes(x = AudienceRating)
            )
t + geom_histogram(binwidth = 10,
                   fill = 'White',
                   colour = 'Blue')
# Another way:

t1 <- ggplot(data = movies)
t1 + geom_histogram(aes(x=AudienceRating),
                    binwidth = 10,
                    fill = 'White',
                    colour = 'Blue')

# This will be our fourth chart in the presentation:

# Method 1 above (t<- ...) is if your chart is set to just one variable ie it
# will only be used for audience rating, method 2 if you might want to set the
# chart to a different variable.  Second is more flexible for example when you
# want to explore the data and to feed various geoms and/or aesthetics.

# Example using t1 to visualise critic rating:

t1 + geom_histogram(aes(x=CriticRating),
                    binwidth = 10,
                    fill = 'White',
                    colour = 'Blue')
# interesting Audience Normal Distrib. Critics Uniform distrib.

# Can also produce a skeleton plot and add datasets and all else in geom:

t2 <- ggplot()

# Lecture 65 Statistical Transformations:

# Looking at geom_smooth():
# Adding a smoothed conditional mean - 
# Allows the eye to see patterns in presence of over-plotting;
# geom_smooth and stat_smooth() are effectively aliases, use geom_smooth() unless
# you are plotting results with a non-standard geom.

u <- ggplot(data = movies,
            aes(x = CriticRating,
                y = AudienceRating,
                colour = Genre))
u + geom_point() + geom_smooth(fill = NA)

# boxplots

u1 <- ggplot(data = movies,
             aes(x = Genre,
                 y = AudienceRating,
                 colour = Genre))
u1 + geom_boxplot(size = 1.2)

# Add points to the boxplot:

u1 + geom_boxplot(size = 1.2) + geom_point()
# Bloody horrible plot!

# But the tutor has a tip:

u1 + geom_boxplot(size = 1.2) + geom_jitter()
# Slightly Better but still awful looking chart.

# And another way:

u1 + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)
# Better still but still not a great plot.  Adding Alpha has made it worse

# Challenge - produce a boxplot for critic rating

u2 <- ggplot(data = movies,
             aes(x = Genre,
                 y = CriticRating,
                 colour = Genre))
u2 + geom_jitter() + geom_boxplot(size = 1, alpha = 0.5)

# Lecture 66 using Facets

v <- ggplot(data = movies,
            aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10,
                   aes(fill = Genre),
                   colour = 'Black')
# Using Facets tto split the histograms out

v + geom_histogram(binwidth = 10,
                   aes(fill = Genre),
                   colour = 'Black') +
  facet_grid(Genre~., scales = 'free')
# The dot translates to rows being not given.  scales = 'free' allows each plot
# to have it's own y axis.

# facets with scatter plots:

w <- ggplot(data = movies, aes(x = CriticRating,
                               y = AudienceRating,
                               color = Genre))
w + geom_point(size = 3) +
  facet_grid(Genre~., scales = 'free')

w + geom_point(size = 3) +
  facet_grid(.~Year, scales = 'free')

w + geom_point(size = 3) +
  facet_grid(Genre~Year, scales = 'free')

w + geom_point(size = 3) +
  geom_smooth() +
  facet_grid(Genre~Year, scales = 'free')

w + geom_point(aes(size = BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year, scales = 'free')
# Note some of the produced charts have y as low as -150 due to the large
# differences in the confidence intervals.  This will be addressed in the next
# Lecture

# Lecture 67 Cpprdomates:

# Covered this lecture:
# 1) Limits - how to limit axis
# 2) Zooming - How to zoom in to the axis

m <- ggplot(movies,
            aes(x = CriticRating,
                y = AudienceRating,
                size = BudgetMillions,
                colour = Genre))
m + geom_point()

# To cut out the movies top right corner - the highest rated:

m + geom_point() +
  xlim(50,100) +
  ylim(50,100)
# NB Will get warning that some data has been dropped
# This method won't always work well.


n <- ggplot(data = movies,
            aes(x = BudgetMillions))
n + geom_histogram(binwidth = 10,
                   aes(fill = Genre),
                   colour = 'Black') + # And zoom in to cut off at 50
  ylim(0, 50)
# Not working at all well cuts off data at 50 cutting off top.  Wanted zoom.

n + geom_histogram(binwidth = 10,
                   aes(fill = Genre),
                   colour = 'Black') +
  coord_cartesian(ylim = c(0, 50))

# Imporve the pairplot:

w + geom_point(aes(size = BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))

# Lecture 68 Perfecting by Adding Themes
library(ggplot2)
o <- ggplot(data = movies,
            aes(x = BudgetMillions))
h <- o + geom_histogram(binwidth = 10,
                   aes(fill = Genre),
                   colour = 'Black')
# Add axes labels format to theme add tick mark theme:

h + xlab('Money Axis') +
  ylab('Number of Movies') +  # Format the labels
  theme(axis.title.x = element_text(colour = 'DarkGreen', size = 30),
        axis.title.y = element_text(colour = 'Red', size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20))
# Control the legend and add title.
library(extrafont)
# font_import()
h + xlab('Money Axis') +
  ylab('Number of Movies') +  # Format the labels
  ggtitle('Movie Budget Distribution') +
  theme(axis.title.x = element_text(colour = 'DarkGreen', size = 30),
        axis.title.y = element_text(colour = 'Red', size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1, 1),
        legend.justification = c(1, 1),
        plot.title = element_text(size = 40,
                                  colour = 'DarkBlue',
                                  family = 'Courier New'
        )
)
