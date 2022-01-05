from Repository import RepositoryInterface
from Connection import getConn
from Bus import Bus
class BusDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Bus where Transportnumber=' + str(id))
            i = c.fetchall()
            return Bus(i[0][0], i[0][1], i[0][2])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Bus where Transportnumber=' + str(id))
                i = c.fetchall()
                a.append(Bus(i[0][0], i[0][1], i[0][2]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Bus')    
            for i in c:
                a.append(Bus(i[0], i[1], i[2]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Bus where Transportnumber=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Bus where Transportnumber=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Bus where TransportNumber=' + str(entity.TransportNumber))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Bus values(' + str(entity.TransportNumber)+',' +str(entity.BusOriginTerminalId)+','+ str(entity.BusDestinationTerminalId)+')')
            else :
                c.execute('update Bus set BusOriginTerminalId=' +str(entity.BusOriginTerminalId)+', BusDestinationTerminalId='+ str(entity.BusDestinationTerminalId)+' where TransportNumber='+ str(entity.TransportNumber))
            return Bus(entity.TransportNumber, entity.BusOriginTerminalId, entity.BusDestinationTerminalId)
        except:
            print("There was an error")
            return None