import pg8000 as pg8k

class Db():
    def __init__(self, conn):
        self.conn = conn;
        self.c = self.conn.cursor()
        init_db()

    def init_db(self):
        db_init_file = open('./create.sql', 'r')
        self.c.execute(db_init_file.read())

    def getAverageAbsoluteNewsSourceRep(self, name):
        self.c.execute("SELECT AVG(S.srep) FROM News_sources S WHERE S.sname = %s", (name, ))
        ret = self.conn.fetch_one()
        return ret

    def getAverageNewsSourceRepByTopic(self, name, topic):
        self.c.execute("SELECT AVG(T.rep) FROM Topics T WHERE T.sname = %s AND T.tname = %s", (name, topic))
        ret = self.conn.fetch_one()
        return ret

