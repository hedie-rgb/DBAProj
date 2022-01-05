from Repository import RepositoryInterface
from Connection import getConn
from MultiWay import MultiWay
class MultiWayDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Multi_Way where id=' + str(id))
            i = c.fetchall()
            return MultiWay(i[0][0])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Multi_Way where id=' + str(id))
                i = c.fetchall()
                a.append(MultiWay(i[0][0]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Multi_Way')    
            for i in c:
                a.append(MultiWay(i[0]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Multi_Way where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Multi_Way where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('insert into MultiWay values(' +')')
            return MultiWay(entity.id)
        except:
            print("There was an error")
            return None