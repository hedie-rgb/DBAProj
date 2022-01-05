from Repository import RepositoryInterface
from Connection import getConn
from BusTerminal import BusTerminal
class BusTerminalDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Bus_Terminal where id=' + str(id))
            i = c.fetchall()
            return BusTerminal(i[0][0], i[0][1], i[0][2])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Bus_Terminal where id=' + str(id))
                i = c.fetchall()
                a.append(BusTerminal(i[0][0], i[0][1], i[0][2]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Bus_Terminal')    
            for i in c:
                a.append(BusTerminal(i[0], i[1], i[2]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Bus_Terminal where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Bus_Terminal where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Bus_Terminal where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Bus_Terminal values(' + str(entity.name)+','+ str(entity.cityId)+')')
            else :
                c.execute('update Bus_Terminal set name=' +str(entity.name)+', cityId='+ str(entity.cityId)+' where id='+ str(entity.id))
            return BusTerminal(entity.id, entity.name, entity.cityId)
        except:
            print("There was an error")
            return None