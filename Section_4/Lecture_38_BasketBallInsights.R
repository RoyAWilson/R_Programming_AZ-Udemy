# Use the function created last lesson to derive some insights from the data:

# Salary:

my_plot_4(Salary)
my_plot_4(Salary / Games) # Not the best way to show, paid regardless of fields
my_plot_4(Salary / FieldGoals) # Same again

# In Game Metrics

my_plot_4(MinutesPlayed)
my_plot_4(Points)
my_plot_4(MinutesPlayed / Games)
my_plot_4(MinutesPlayed / Points)

# In Game Metrics Normalised:
# Divisions help to normailize the data and flatten out the skewing from
# players not fielded due to injury etc.

my_plot_4(FieldGoals / Games) # Injuries still visible but less pronounced
my_plot_4(FieldGoals / FieldGoalAttempts)
my_plot_4(FieldGoalAttempts / Games)
my_plot_4(Points / Games)

# Interesting Observations

my_plot_4(MinutesPlayed / Games)
my_plot_4(FieldGoals / Games)

# Time is valuable

my_plot_4(FieldGoals / MinutesPlayed)

# Player Style

my_plot_4(Points / FieldGoals)
