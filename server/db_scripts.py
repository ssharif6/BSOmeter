import pg8000 as pg8k

class Db():
    def __init__(self, conn):
        self.conn = conn;
        self.c = self.conn.cursor()
        self.init_db()

    def init_db(self):
        db_init_file = open('./create.sql', 'r').read().split(';')
        self.c.execute(db_init_file[0])
        self.conn.commit()
        self.c.execute(db_init_file[1])
        self.conn.commit()
        self.c.execute(db_init_file[2])
        self.conn.commit()
        self.c.execute(db_init_file[3])
        self.conn.commit()

    def getAverageAbsoluteNewsSourceRep(self, name):
        self.c.execute("SELECT AVG(S.srep) FROM News_sources S WHERE S.sname = %s", (name, ))
        ret = self.conn.fetch_one()
        return ret

    def getAverageNewsSourceRepByTopic(self, name, topic):
        self.c.execute("SELECT AVG(T.rep) FROM Topics T WHERE T.sname = %s AND T.tname = %s", (name, topic))
        ret = self.conn.fetch_one()
        return ret

    def getMultiplier(self, pname, sname):
        self.c.execute("SELECT S.saffil FROM News_sources S WHERE S.sname = %s", (sname,))
        naff = self.conn.fetch_one()
        self.conn.commit()
        self.c.execute("SELECT P.paffil FROM Politicians P WHERE P.pname = %s", (pname,))
        paff = self.conn.fetch_one()
        self.conn.commit()
        return (naff > 0 and paff > 0) or (naff < 0 and paff < 0)

    def getBayesianData(self, pname, dtopic, keyword):
        res = {'kw':{}, 'no-kw':{}}
        self.c.execute("SELECT COUNT(*) FROM Speeches S WHERE S.pname = %s AND S.dtopic = %s AND S.transcript LIKE '%' || %s || '%'", (pname, dtopic, keyword))
        res['kw']['total'] = self.conn.fetchall()
        conn.commit()
        self.c.execute("SELECT COUNT(*) FROM Speeches S WHERE S.pname = %s AND S.dtopic = %s AND S.transcript LIKE '%%' || %s || '%%' AND S.bullshit = TRUE", (pname, dtopic, keyword))
        res['kw']['bs'] = self.conn.fetchall()
        conn.commit()
        self.c.execute("SELECT COUNT(*) FROM Speeches S WHERE S.pname = %s AND S.dtopic = %s", (pname, dtopic, keyword))
        res['no-kw']['total'] = self.conn.fetchall()
        conn.commit()
        self.c.execute("SELECT COUNT(*) FROM Speeches S WHERE S.pname = %s AND S.dtopic = %s AND S.bullshit = TRUE", (pname, dtopic, keyword))
        res['kw']['bs'] = self.conn.fetchall()
        conn.commit()
        return res

