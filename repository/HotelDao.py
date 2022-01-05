from Repository import RepositoryInterface
from Connection import getConn
from Hotel import Hotel
class HotelDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Hotel where id=' + str(id))
            i = c.fetchall()
            return Hotel(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Hotel where id=' + str(id))
                i = c.fetchall()
                a.append(Hotel(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Hotel')    
            for i in c:
                a.append(Hotel(i[0], i[1], i[2], i[3], i[4], i[5], i[6]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Hotel where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Hotel where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Hotel where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Hotel values('  +str(entity.name)+',' +str(entity.about)+',' +str(entity.stars)+',' +str(entity.accomodationType)+',' +str(entity.rules)+','+ str(entity.cityId)+')')
            else :
                c.execute('update Hotel set name=' +str(entity.name)+', about='+ str(entity.about)+', stars='+ str(entity.stars)+', accomondation_type='+ str(entity.accomodationType)+', rules='+ str(entity.rules)+', cityId='+ str(entity.cityId)+' where id='+ str(entity.id))
            return Hotel(entity.id, entity.name,entity.about, entity.stars, entity.accomodationType,entity.rules, entity.cityId)
        except:
            print("There was an error")
            return None