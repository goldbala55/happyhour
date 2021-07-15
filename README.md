# happyhour

## Project Overview
 ### Selected topic: Exploring Survival on the Titanic
  - Reason why the topic was selected: The crash of the Titanic is one history's most storied tragedies.  While there are many myths and facts surrounding the events of the day we know for certain who survived and who did not.  The question is why and how did some of them survive and others perish?  The team will determine if there are certain factors such as gender, age, ticket class, etc that contributed to whether someone survived on the Titanic.
  - Description of the source data: Given the fame of the Titanic the details surrounding the passenger list and the survivors are well documented.  The version used in this analysis was posted on Kaggle and the link is below in the Resources section.
  - Questions to answer: 
    - What factors contributed the most to the survival on the Titanic? What factors did not contribute to the survival on the Titanic? Can the factors be utilized to predict survival rates on a current ship?
    - __Use the model and the biases to predict survival rates on a current cruise ship (shift bias on # of lifeboats)__
    - Identify relationships that contribute to survival rates (i.e., single traveler vs traveling with a family member)
    - What impact did sex, age, or traveler class have on survival?
  - Description of the data exploration phase of the project: 
    - Initial exploration of the data revealed several interesting factors to explore: Age, sex, and passenger class.  These will be further explored and transformed in the model pre-processing phase.  It was also observed that the data had multiple missing values scattered throughout the input file.  As the modeling packages do not use missing values these will need to be addressed in the preprocessing phase as well.  Finally, text based values (like sex) and continuous values (like fare) will also need to be transformed to be useful in the modeling process.

      * [Survival_count_by_Age](https://github.com/goldbala55/happyhour/blob/seg3_document/images/Survival_count_by_Age.png)
      * [Survival_count_by_class](https://github.com/goldbala55/happyhour/blob/seg3_document/images/Survival_count_by_class.png)
      * [Survival_count_by_sex](https://github.com/goldbala55/happyhour/blob/seg3_document/images/Survival_count_by_sex.png)


  - Description of the analysis phase of the project: _TBD_

## Machine Learning Model
### Preprocessing
Based on the information gathered in the preprocessing phase, the following decisions and actions were taken:
  - The data is split into training and testing components using the standard sklearn train_test_split() module.  We used an 80/20 train/test split to make sure the training data had sufficient observations to work with.
  - All transformations are applied to the train and test datasets.
  - Categorical data is transformed into numerical equivalents, i.e., converting sex into a numeric representation (replace({'male':0,'female':1}))
  - While it is common to drop rows with missing data when building ML models, for a file with a modest size like the Titanic passenger list this would substantially reduce the available data.  As an alternative, we used an approach to fill the missing points with interpolated data calculated on the available points in the file, i.e., replace missing ages with the median by passenger class (fillna(x_train.groupby(['Pclass'])['Age'].transform('median')))
  - For continuous values, like fare, the data was split into five (5) groups using the pandas qcut() method.
  - All non-numeric data is dropped and only the numerical values are kept.

### Model Design
  - _TBD_

### Model Results
  - _TBD_



## Presentation Details
The presentation deck can be viewed at [Google Slides](https://docs.google.com/presentation/d/1qMSHVCMOXXqsc5P8uBrMM9QYQQPu_BJBKuw3FCWUnwk/edit#slide=id.p)

Storyboard:

- Bar Graph survival rate by Ticket Price (as an indicator of Class or Location on the Ship)
- Graph Survival by Sex and Age groups
- Plot survival rate/Lifeboat and compare to modern day cruise ships 
- Plot survival rate on a modern day cruise ship (using model output) and compare to the Titanic  
- Tabulate expected survival rate based on identified relationships 
- Box plots to visualize survival rate result with different bias in the model. 

Description of interactive element(s):

- Tableau will be used for the interactive elements of exploring certain relationships between different factors which contributed to survival on the [Titanic on Tableau](https://public.tableau.com/app/profile/alex.wang6199/viz/ExploringSurvivalontheTitanicTableau/AverageSurvivalRateByClass) 


### Team members
| Key Roles | Team                              |
| :-------- | :-------------------------------- |
| Square    | Machine Learning: Muhammad Madyun |
| Triangle  | DataBase: Alan Goldberg           |
| Circle    | Tableau: Alex Wang                |
| X         | GitHub: Kevin Birk                |


## Resources
Data: [Exploring Survival on the Titanic](https://www.kaggle.com/mrisdal/exploring-survival-on-the-titanic)

Software: Python 3.7.10, Jupyter Notebook 6.3, pandas 1.2.4, Git Bash 4.4.23, Tableau Public 2021.2.0

The complete set of modules used can be found here: [requirements.txt](https://github.com/goldbala55/happyhour/blob/main/Resoures_2/requirements.txt)

Database: 
AWS/RDS Postgresql 12.5 
  - A Postgresql instance was created using the RDS service on AWS. Using a combination of SQL, Pandas, and the Pgadmin tool multiple files were loaded, joined, and used as input to the analysis and modeling process.  Accounts for read only and read/write access were created and appropriate connection strings were defined.

ERD
<details><summary>Titanic prepared data ER Diagram</summary>
<p>

![](https://github.com/goldbala55/happyhour/blob/main/images/Titanic_DB_ERD.png)

</p>
</details>

 <br/><br/><hr>


#### relocated for discussion
  Where did all these numbers come from?  Is there a notebook or sheet or ?
#### ------------------------
Reason why the topic was selected:

  Train set has 891 rows and 12 columns based on PassengerId, Survived (target column), Pclass (Passenger's class), Name (will not be used for machine learning), Sex (to be converted to 0 and 1), Age (to be converted to age buckets), SibSp (Number of siblings/spouses aboard), Parch (Number of parents/children aboard), Ticket, Fare (can be converted to fare buckets), Cabin (lots of missing values), and Embarked

#### ---------------------------
Description of the data exploration phase of the project

  Based on loading the data into a pandas dataframe, there are 714 non-null (177 null) values for Age, 204 non-null (687 null) values for Cabin, and 889 non-null (2 null) values for Embarked, as such these values may not be as reliable to predict the survival rate for the Titanic. In addition, the average rate of survival was approximately 38.38% with an average fare of 32.20 and standard deviation of 49.69 for the fare

#### ---------------------------
Description of the analysis phase of the project: 

  For the analysis, gender is replaced with 1 and 0 values. Further, the train and test dataframes are loaded to the Postgres DB.
