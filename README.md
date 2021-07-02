# happyhour

- Selected topic: Exploring Survival on the Titanic
- Reason why they selected their topic: Determine if there are certain factors such as gender, age, ticket class, etc that contributed to whether someone survived on the Titanic
Description of their source of data: Train set has 891 rows and 12 columns based on PassengerId, Survived (target column), Pclass (Passenger's class), Name (will not be used for machine learning), Sex (to be converted to 0 and 1), Age (to be converted to age buckets), SibSp (Number of siblings/spouses aboard), Parch (Number of parents/children aboard), Ticket, Fare (can be converted to fare buckets), Cabin (lots of missing values), and Embarked
- Questions they hope to answer with the data: 
  - What factors contributed the most to the survival on the Titanic? What factors did not contribute to the survival on the Titanic?
  - Use the model and the biases to predict survival rates on a current cruise ship (shift bias on # of lifeboats)
  - Identify relationships that contribute to survival rates (i.e., single traveler vs traveling with a family member)
- Description of the data exploration phase of the project: Based on loading the data into a pandas dataframe, there are 714 non-null (177 null) values for Age, 204 non-null (687 null) values for Cabin, and 889 non-null (2 null) values for Embarked, as such these values may not be as reliable to predict the survival rate for the Titanic. In addition, the average rate of survival was approximately 38.38% with an average fare of 32.20 and standard deviation of 49.69 for the fare.
- Description of the analysis phase of the project: For the analysis, gender is replaced with 1 and 0 values. Further, the train and test dataframes are loaded to the Postgres DB.

Google Slides: https://docs.google.com/presentation/d/1qMSHVCMOXXqsc5P8uBrMM9QYQQPu_BJBKuw3FCWUnwk/edit#slide=id.p

Storyboard:

- Bar Graph survival rate by Ticket Price (as an indicator of Class or Location on the Ship)
- Graph Survival by Sex and Age groups
- Plot survival rate/Lifeboat and compare to modern day cruise ships 
- Plot survival rate on a modern day cruise ship (using model output) and compare to the Titanic  
- Tabulate expected survival rate based on identified relationships 

Description of the tool(s) that will be used to create final dashboard:

- GitHub, jupyter notebook, postgreSQL, AWS, Google slides, Tableau

Description of interactive element(s):

- Tableau will be used for the interactive elements of exploring certain relationships between different factors which contributed to survival on the Titanic (https://public.tableau.com/authoring/ExploringSurvivalontheTitanicTableau/AverageSurvivalRateByAge#2) 

Description of the communication protocols:

- Breakout rooms during class sessions Tuesdays and Thursdays
- #happyhour slack channel
- Any other communication throughout the week such as additional meetings

- The expectation is to use Postgres DB on AWS
