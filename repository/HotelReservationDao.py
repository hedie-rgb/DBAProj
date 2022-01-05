from Repository import RepositoryInterface
from Connection import getConn
from HotelReservation import HotelReservation
class HotelReservationDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Hotel_Reservation where id=' + str(id))
            i = c.fetchall()
            return HotelReservation(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7], i[0][8])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Hotel_Reservation where id=' + str(id))
                i = c.fetchall()
                a.append(HotelReservation(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7], i[0][8]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Hotel_Reservation')    
            for i in c:
                a.append(HotelReservation(i[0], i[1], i[2], i[3], i[4], i[5], i[6], i[7], i[8]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Hotel_Reservation where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Hotel_Reservation where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Hotel_Reservation where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into HotelReservation values(' +str(entity.checkInDate)+',' +str(entity.checkOutDate)+',' +str(entity.date)+','+str(entity.baby)+','+str(entity.adult)+','+str(entity.child)+','+str(entity.userId)+','+str(entity.roomCode)+')')
            else :
                c.execute('update HotelReservation set checkin_date=' +str(entity.checkInDate)+', checkout_date='+ str(entity.checkOutDate)+', _date='+ str(entity.date)+', number_of_baby='+ str(entity.ubaby)+', number_of_adult='+ str(entity.adult)+', number_of_children='+ str(entity.child)+', Userid='+ str(entity.userId)+', Roomcode='+ str(entity.roomCode)+' where id='+ str(entity.id))
            return HotelReservation(entity.id, entity.checkInDate, entity.checkInDate, entity.date, entity.baby, entity.adult, entity.child, entity.userId, entity.roomCode)
        except:
            print("There was an error")
            return None