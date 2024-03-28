# Homework Challenge reproduce a given graph with given data as closely as possible.

movieData <- read.csv('./Resources/Section6-Homework-Data.csv', stringsAsFactors = T)
colnames(movieData)
dnames <- c('DayOfWeek', 'Director', 'Genre', 'MovieTitle', 'ReleaseDate', 'Studio',
            'AdjustedGrossM_Dollar', 'BudgetM_Dollar', 'GrossM_Dollar', 'IMDB_Rating',
            'MovieLens_Rating', 'OvereeasM_Dollar', 'Overseas',
            'ProfiM_Dollar', 'Profit','RuntimeMin', 'US_M_Dollar', 'GrossPC_US_Dollar')
colnames(movieData) <- dnames
# length(colnames(movieData))
# length(dnames)
# colnames(movieData) <- dnames

str(movieData)

# No need to worry about data types for this plot as the only 2 numeric cols required has been set
# to double; if I needed to do more analysis then some of the dollar amounts would need to be
# set to double and the dates would need to be set as datetime
# As only working to produce 1 graph won't bother dropping unnecessary cols

library(ggplot2)
library(extrafont)

# Required Studios: Buena Vista Studios, Fox, Paramount Pictures, Sony, Universal, WB
# Required Genres: Action, Adventure, Comedy, Drama - Note not capitalised

movieData
str(movieData)

movieData <- movieData[movieData$Genre == 'action' | movieData$Genre =='adventure'| movieData$Genre == 'animation' | movieData$Genre == 'comedy' | movieData$Genre == 'drama',]
movieData <- movieData[movieData$Studio == 'Buena Vista Studios' | movieData$Studio == 'Fox' | movieData$Studio == 'Paramount Pictures' | movieData$Studio == 'Sony' | movieData$Studio == 'Universal' | movieData$Studio == 'WB',]
# movieData

# Start the visualisation
colnames(movieData)

plot <- ggplot(data = movieData)

plot <- plot + geom_jitter(aes(x = Genre,
                       y = GrossPC_US_Dollar,
                       size = BudgetM_Dollar,
                       colour = Studio),
                       alpha = 0.7
                   )+
  geom_boxplot(aes(x = Genre,
                   y = GrossPC_US_Dollar,
                   ),
               alpha = 0.5,
               outlier.colour='Transparent')

plot <- plot + xlab('Genre')+
  ylab('Gross % US Dollar') +
  ggtitle('Domestic Gross % by Genre') +
  theme(axis.title.x = element_text(colour = 'Blue', size = 20, family = 'Comic Sans MS'),
        axis.title.y = element_text(colour = 'Blue', size = 20, family = 'Comic Sans MS'),
        axis.text.x = element_text(size = 12, family = 'Comic Sans MS'),
        axis.text.y = element_text(size = 12, family = 'Comic Sans MS'),
        legend.text = element_text(size = 10, family = 'Comic Sans MS'),
        legend.title = element_text(size = 12, family = 'Comic Sans MS'),
        title = element_text(size = 15, family = 'Comic Sans MS'))
plot$labels$size <- 'Budget $M'
plot
