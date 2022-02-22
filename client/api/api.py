import json
import flask
from flask import request
import pandas as pd
from scipy import sparse
from sklearn.metrics.pairwise import cosine_similarity

app = flask.Flask(__name__)
app.config["DEBUG"] = True

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

def parse_data(activities):
    data = activities.to_json().replace("{", "").replace("}", "").split(",")
    output = []
    for x in data:
        y = x.split(":")
        output.append({"activity": y[0].strip("\""), "rating": y[1]})
    return output


@app.route('/api/v1/recommend', methods=['GET'])
def home():
    if 'activity' in request.args:
        activity = str(request.args['activity'])
        if 'rating' in request.args:
            rating = int(request.args['rating'])
        else:
            return "Error: No rating field provided. Please specify an rating."
    else:
        return "Error: No activity field provided. Please specify an activity."
    
    activities = parse_data(get_similar_item(activity, rating))
    
    
    return (json.dumps(activities))


app.run()