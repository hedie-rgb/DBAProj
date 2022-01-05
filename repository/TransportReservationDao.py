from Repository import RepositoryInterface
from Connection import getConn
from TransportReservation import TransportReservation
class TransportReservationDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Transport_Reservation where id=' + str(id))
            i = c.fetchall()
            return TransportReservation(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Transport_Reservation where id=' + str(id))
                i = c.fetchall()
                a.append(TransportReservation(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Transport_Reservation')    
            for i in c:
                a.append(TransportReservation(i[0], i[1], i[2], i[3], i[4], i[5]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Transport_Reservation where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Transport_Reservation where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Transport_Reservation where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into TransportReservation values('  +str(entity.rules)+','+ str(entity.adult)+','+ str(entity.child)+','+ str(entity.userId)+','+ str(entity.ticketCode)+')')
            else :
                c.execute('update TransportReservation set rules=' +str(entity.rules)+', number_of_adult='+ str(entity.adult)+', number_of_children='+ str(entity.child)+', Userid='+ str(entity.userId)+', Ticketcode='+ str(entity.ticketCode)+' where id='+ str(entity.id))
            return TransportReservation(entity.id, entity.rules, entity.adult)
        except:
            print("There was an error")
            return None