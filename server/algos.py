# some basic P'n'P algorithms that estimate the truthfulness of 
# political statements based on a number of factors.
# see docstrings for each algorithm for more info

import pg8000 as pg8k

from db_scripts import Db

conn = pg8k.connect(
            host="",
            port=5432,
            user="",
            password="",
            database=""
        )

d = Db(conn)

def calculateP_NF_T(name, topic):
    nf = d.getAverageAbsoluteNewsSourceRep(name)
    t = d.getAverageNewsSourceRepByTopic(name, topic)

