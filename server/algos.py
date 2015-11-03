import toml

import pg8000 as pg8k

from db_scripts import Db

conf = toml.load('conf.toml')

conn = pg8k.connect(
            host=conf['db']['host'],
            port=conf['db']['port'],
            user=conf['db']['user'],
            password=conf['db']['pass'],
            database=conf['db']['name']
        )

d = Db(conn)

def calculateP_NF_T(name, topic):
    nf = d.getAverageAbsoluteNewsSourceRep(name)
    t = d.getAverageNewsSourceRepByTopic(name, topic)

def calculateP_BS_W(pname, topic, keyword):
    r = d.getBayesianData(pname, topic, keyword)
    p_w_bs = r['kw']['bs'] / r['kw']['total']
    p_bs = r['no-kw']['bs'] / r['no-kw']['total']
    p_w_t = (r['kw']['total'] - r['kw']['bs']) / r['kw']['total']
    p_t = (r['no-kw']['total'] - r['no-kw']['bs']) / r['no-kw']['total']
    return (p_w_bs * p_bs) / (p_w_bs * p_bs + p_w_t * p_t)

