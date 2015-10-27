import re
import json
import requests

import pg8000 as pg8k

from bs4 import BeautifulSoup

conn = pg8k.connect(
            host="politidb.cm8mhypepst9.us-west-2.rds.amazonaws.com",
            port=5432,
            user="trumpster",
            password="bushdidnothingwrong",
            database="postgres"
        )

c = conn.cursor()
c.execute('CREATE TABLE IF NOT EXISTS Lies (statement VARCHAR(2048), politician VARCHAR(64), topic VARCHAR(64));')
conn.commit()
c.execute('CREATE TABLE IF NOT EXISTS Truths (statement VARCHAR(2048), politician VARCHAR(64), topic VARCHAR(64));')
conn.commit()

docs = json.loads(requests.get('http://www.politifact.com/api/statements/truth-o-meter/json/?n=250').text)

for doc in docs:
    if doc['ruling']['ruling'].lower() in ['half-true', 'mostly true', 'true']:
        c.execute("INSERT INTO Truths (statement, politician, topic) VALUES (%s, %s, %s)", (re.sub(r'&nbsp;', '\\n', re.sub(r'(\<p\>)?&quot;(\</p\>)?', '', doc['statement'])), doc['speaker']['last_name'], doc['subject'][0]['subject_slug']))
        conn.commit()
    else:
        c.execute("INSERT INTO Lies (statement, politician, topic) VALUES (%s, %s, %s)", (re.sub(r'&nbsp;', '\\n', re.sub(r'(\<p\>)?&quot;(\</p\>)?', '', doc['statement'])),doc['speaker']['last_name'], doc['subject'][0]['subject_slug']))
        conn.commit()

