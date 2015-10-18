# some basic P'n'P algorithms that estimate the truthfulness of 
# political statements based on a number of factors.
# see docstrings for each algorithm for more info

import pg8000 as pg8k

from db_scripts import Db

conn = pg8k.connect(
            host="politidb.cm8mhypepst9.us-west-2.rds.amazonaws.com",
            port=5432,
            user="trumpster",
            password="bushdidnothingwrong",
            database="postgres"
        )

d = Db(conn)

def calculateP_NF_T(name, topic):
    nf = d.getAverageAbsoluteNewsSourceRep(name)
    t = d.getAverageNewsSourceRepByTopic(name, topic)

def calculateP_BS_W(pname, topic, keyword):
    r = getBayesianData(pname, topic, keyword)
    p_w_bs = r['kw']['bs'] / r['kw']['total']
    p_bs = r['no-kw']['bs'] / r['no-kw']['total']
    p_w_t = (r['kw']['total'] - r['kw']['bs']) / r['kw']['total']
    p_t = (r['no-kw']['total'] - r['no-kw']['bs']) / r['no-kw']['total']
    return (p_w_bs * p_bs) / (p_w_bs * p_bs + p_w_t * p_t)



