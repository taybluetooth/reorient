## Import necessary packages
import pandas as pd
from scipy import sparse
from sklearn.metrics.pairwise import cosine_similarity

## Read dataset and adjust first column
## Replace NaN's with 0 for now
ratings = pd.read_csv("test.csv",index_col=0)
ratings = ratings.fillna(0)

## Method which standardises data values to be more
## accurately represent a user's opinion.
def standardise(row):
    new_row = (row - row.mean()) / (row.max() - row.min())
    return new_row

## Apply standardise method to new table
ratings_std = ratings.apply(standardise)

## Create item similarity matrix and use transposed table 
## since we want similarity between items which need to be in rows.
item_similarity = cosine_similarity(ratings_std.T)

## Create data frame from item similarity matrix
## Values represented as percentages on how similar they are to another item
item_similarity_df = pd.DataFrame(item_similarity,index=ratings.columns,columns=ratings.columns)

## Create recommendation method
def get_similar_item(activity_name, user_rating):
    ## Scale movie by user's rating
    similar_score = item_similarity_df[activity_name]*(user_rating-2.5)
    similar_score = similar_score.sort_values(ascending=False)
    
    return similar_score

print(get_similar_item("Football", 2))

ball_games_lover = [("Football",5), ("Rugby", 2), ("Walking", 1)]
similar_activities = pd.DataFrame()
for activity, rating in ball_games_lover:
    similar_activities = similar_activities.append(get_similar_item(activity, rating),ignore_index=True)
    
similar_activities.head()
similar_activities.sum().sort_values(ascending=False)