This script makes tidy data from dataset obtained from Samsung mobile phone and distributed by various files

###Algorithm
1. Script reads feature names, selects from this list features that are mean value or standart deviation and clears their names of braces and dashes.
2. Script reads possible activities names.
3. Script reads train and test result tables, merges them, substitutes activity names for numeric codes and corrests data frame column name.
4. Script reads train and test subject tables, merges them and corrests data frame column name.
5. Script reads train and test features tables, merges them, selects columns corresponding to features it has selected earlier and substitute obtained feature names for them.
6. Script merges dataframe in one that has features, subjects and activities.
7. Script aggregates data and calculates average for each subject and activity into one tidy dataframe.