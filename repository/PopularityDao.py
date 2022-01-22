from Repository import RepositoryInterface
from Connection import getConn
from Popularity import Popularity
class PopularityDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Popularity where id=' + str(id))
            i = c.fetchall()
            return Popularity(i[0][0], i[0][1], i[0][2], i[0][3])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Popularity where id=' + str(id))
                i = c.fetchall()
                a.append(Popularity(i[0][0], i[0][1], i[0][2], i[0][3]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Popularity')    
            for i in c:
                a.append(Popularity(i[0], i[1], i[2], [i[3]]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Popularity where id=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Popularity where id=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Popularity where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Popularity values(' +str(entity.score)+','+ str(entity.userId)+','+ str(entity.hotelId)+')')
                c.commit()
            else :
                c.execute('update Popularity set score=' +str(entity.score)+', UserId='+ str(entity.userId)+', HotelId='+ str(entity.hotelId)+' where id='+ str(entity.id))
                c.commit()
            return Popularity(entity.id, entity.score, entity.userId, entity.hotelId)
        except:
            print("There was an error")
            return None