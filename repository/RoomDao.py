from Repository import RepositoryInterface
from Connection import getConn
from Room import Room
class RoomDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Room where code=' + str(id))
            i = c.fetchall()
            return Room(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Room where code=' + str(id))
                i = c.fetchall()
                a.append(Room(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Room')    
            for i in c:
                a.append(Room(i[0], i[1], i[2], i[3], i[4], i[5], i[6], i[7]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Room where code=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Room where code=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Room where code=' + str(entity.code))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into Room values('"  +str(entity.meal)+"'," +str(entity.hotelId)+",'"+ str(entity.type)+"',"+ str(entity.available)+','+ str(entity.cost)+','+ str(entity.bedroom)+','+ str(entity.number)+')')
                c.commit()
            else :
                c.execute("update RoomNumber Room set meal='" +str(entity.meal)+"', Hotelid="+ str(entity.hotelId)+", Type='"+ str(entity.type)+"', available="+ str(entity.available)+', cost_per_night='+ str(entity.cost)+', num_of_bedrooms='+ str(entity.bedroom)+', _number='+ str(entity.number)+' where code='+ str(entity.id))
                c.commit()
            return Room(entity.code, entity.meal, entity.RoomNumber, entity.type, entity.available, entity.type, entity.cost)
        except:
            print("There was an error")
            return None