from flask import Flask, jsonify, json
from flask import request
import joblib
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
import json
import numpy as np

inputParametersDict = {
    "AGE" : 60,
    "GENDER_F" : True,
    "GENDER_M" : True,
    "SMOKING_1" : True,
    "SMOKING_2" : True,
    "YELLOW_FINGERS_1" : True,
    "YELLOW_FINGERS_2" : True,
    "ANXIETY_1" : True,
    "ANXIETY_2" : True,
    "PEER_PRESSURE_1" : True,
    "PEER_PRESSURE_2" : True,
    "CHRONIC_DISEASE_1" : True,
    "CHRONIC_DISEASE_2" : True,
    "FATIGUE_1" : True,
    "FATIGUE_2" : True,
    "ALLERGY_1" : True,
    "ALLERGY_2" : True,
    "WHEEZING_1" : True,
    "WHEEZING_2" : True,
    "ALCOHOL_CONSUMING_1" : True,
    "ALCOHOL_CONSUMING_2" : True,
    "COUGHING_1" : True,
    "COUGHING_2" : True,
    "SHORTNESS_OF_BREATH_1" : True,
    "SHORTNESS_OF_BREATH_2" : True,
    "SWALLOWING_DIFFICULTY_1" : True,
    "SWALLOWING_DIFFICULTY_2" : True,
    "CHEST_PAIN_1" : True,
    "CHEST_PAIN_2" : True,
}

with open("model.joblib", "rb") as f:
    model = joblib.load(f)

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    content_type = request.headers.get('Content-Type')
    jsonres = request.json
    print(jsonres)

    # SMOKING_1 MEANS HE NOT SMOKE

    age_data = pd.read_csv("data.csv")["AGE"].tolist()
    print("JSON AGE HERE")
    print(jsonres)
    age_data.append(jsonres["AGE"]) # DEFINED AS AGE PARAM

    datas = pd.DataFrame(age_data)
    scaler = MinMaxScaler()
    age_data = scaler.fit_transform(datas)

    data_input = [age_data[len(age_data)-1]] # AGE PARAM
    
    for key in inputParametersDict:
        if (key != "AGE"):
            if (jsonres[key] == True):
                data_input.append(1)
            else:
                data_input.append(0)

    print(data_input)

    try:
        result = model.predict([data_input])
        if (result):
            return jsonify(
                status=200,
                response=result[0],
            )

    except Exception as e:
        return jsonify(
                status=200,
                data="Error with message : "+str(e),
            )

    return 0