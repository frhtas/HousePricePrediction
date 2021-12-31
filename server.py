#!/usr/bin/env python
# encoding: utf-8
import json
from flask import Flask
from flask import request
import pickle
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import sklearn
from sklearn.linear_model import LinearRegression, LogisticRegression
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import StandardScaler
from sklearn.feature_selection import RFE
from sklearn.decomposition import PCA
from sklearn.svm import SVR
from sklearn.svm import LinearSVR
from sklearn.neighbors import KNeighborsRegressor
from sklearn.svm import SVR
from sklearn.metrics import r2_score
from sklearn.ensemble import RandomForestRegressor
import sklearn.neighbors

app = Flask(__name__)


def removeTurkishChars(county):
    countyMap = {
        "Üsküdar": "uskudar",
        "Esenyurt": "esenyurt",
        "Beşiktaş": "besiktas",
        "Pendik": "pendik",
        "Küçükçekmece": "kucukcekmece",
        "Bahçelievler": "bahcelievler",
        "Kadıköy": "kadikoy",
        "Sarıyer": "sariyer",
        "Bakırköy": "bakirkoy",
        "Şişli": "sisli"
    }
    return countyMap[county]

def prepareInput(inputValue, house):
    inputValue['Alan'][0] = int(house['area'])
    inputValue['Oda Sayısı'][0] = house['room_count']
    inputValue['Banyo Sayısı'][0] = int(float(house['bath_count']))
    inputValue['Bina Yaşı'][0] = house['building_age']
    inputValue['Balkon Durumu'][0] = house['balcony']
    inputValue['Eşya Durumu'][0] = house['ware']
    inputValue['Site İçerisinde'][0] = house['site']
    inputValue['Isıtma Tipi_' + house['heating_type']] = 1

    print(inputValue)

    oda_hashmap = {'6+1': 8, '2+0': 2,'2+2': 6, '1.5+1': 2, '2.5+1': 4, '2+1': 4,'3+1': 5,'5+2': 9,'Stüdyo': 1,'1+1': 2,'3+2': 7,'1 Oda': 1,'4+1': 6,'5+1': 7,'4+2': 8,'8+ Oda': 13,'7+2': 11,'6+2': 10, '3.5+1': 5}
    bina_hashmap = {'21 Ve Üzeri': 25, '5-10': 7, '11-15': 13, '16-20': 18, '4': 4, '0 (Yeni)': 0, '1': 1, '3': 3, '2': 2}
    balkon_hashmap = {'Yok': -1, 'Var': 1}
    esya_hashmap = {'Boş': -1, 'Eşyalı': 1}
    site_hashmap = {'Evet': 1, 'Hayır': -1}

    inputValue = inputValue.replace({'Oda Sayısı': oda_hashmap})
    inputValue = inputValue.replace({'Bina Yaşı': bina_hashmap})
    inputValue = inputValue.replace({'Balkon Durumu': balkon_hashmap})
    inputValue = inputValue.replace({'Eşya Durumu': esya_hashmap})
    inputValue = inputValue.replace({'Site İçerisinde': site_hashmap})
    return inputValue


@app.route('/getpredictions', methods=["POST"])
def get_predictions():
    house = request.form
    county = removeTurkishChars(house["county"])
    print(county)
    inputValue = pickle.load(open("DEFAULT_INPUTS", "rb"))[county]
    print(inputValue)
    inputValue = prepareInput(inputValue, house)

    models = pickle.load(open("models/" + county, "rb"))
    LinearRegressionModel = models[0]
    RandomForestRegressorModel = models[1]
    KNeighborsRegressorModel = models[2]
    SVRModel = models[3]

    results = {
        "LinearRegression": int(LinearRegressionModel.predict(inputValue)),
        "RandomForestRegressor": int(RandomForestRegressorModel.predict(inputValue)),
        "KNeighborsRegressor": int(KNeighborsRegressorModel.predict(inputValue)),
        "SVR": int(SVRModel.predict(inputValue))
    }
    return results
    
app.run()