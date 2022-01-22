from Repository import RepositoryInterface
from Connection import getConn
from Country import Country
import traceback
class CountryDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Country where id=' + str(id))
            i = c.fetchall()
            return Country(i[0][0], i[0][1])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Country where id=' + str(id))
                i = c.fetchall()
                a.append(Country(i[0][0], i[0][1]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Country')    
            for i in c:
                a.append(Country(i[0], i[1]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Country where id=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Country where id=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Country where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into Country values(" +"'"+str(entity.name)+"'"+')')
                c.commit()
            else :
                c.execute("update Country set name='"+str(entity.name)+"' where id="+str(entity.id))
                c.commit()
            return Country(entity.id, entity.name)
        except:
            print("There was an error")
            return None