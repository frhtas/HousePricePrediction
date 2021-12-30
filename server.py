#!/usr/bin/env python
# encoding: utf-8
import json
from flask import Flask

app = Flask(__name__)

@app.route('/getpredictions')
def get_predictions():
    return json.dumps({'prediction1': 1000,
                       'prediction2': 1100,
                       'prediction3': 1200})
app.run()