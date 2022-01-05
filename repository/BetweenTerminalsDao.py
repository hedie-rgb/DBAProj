from Repository import RepositoryInterface
from Connection import getConn
from BetweenTerminals import BetweenTerminals
class BetweenTerminalsDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from between_terminals where BusReservationTransportnumber=' + str(id))
            i = c.fetchall()
            return BetweenTerminals(i[0][0], i[0][1])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from between_terminals where BusReservationTransportnumber=' + str(id))
                i = c.fetchall()
                a.append(BetweenTerminals(i[0][0], i[0][1]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from between_terminals')    
            for i in c:
                a.append(BetweenTerminals(i[0], i[1]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from between_terminals where BusReservationTransportnumber=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from between_terminals where BusReservationTransportnumber=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from between_terminals where BusReservationTransportnumber=' + str(entity.BusReservationTransportNumber))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into between_terminals values(' + str(entity.BusReservationTransportNumber)+',' +str(entity.BuTerminalId)+')')
            else :
                c.execute('update between_terminals set BuTerminalId=' +str(entity.BuTerminalId)+' where BusReservationTransportNumber='+ str(entity.BusReservationTransportNumber))
            return BetweenTerminals(entity.BusReservationTransportNumber, entity.BuTerminalId)
        except:
            print("There was an error")
            return None