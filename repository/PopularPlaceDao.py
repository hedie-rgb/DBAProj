from Repository import RepositoryInterface
from Connection import getConn
from PopularPlace import PopularPlace
class PopularPlaceDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Popular_Place where id=' + str(id))
            i = c.fetchall()
            return PopularPlace(i[0][0], i[0][1], i[0][2])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Popular_Place where id=' + str(id))
                i = c.fetchall()
                a.append(PopularPlace(i[0][0], i[0][1], i[0][2]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Popular_Place')    
            for i in c:
                a.append(PopularPlace(i[0], i[1], i[2]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Popular_Place where id=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Popular_Place where id=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Popular_Place where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into Popular_Place values('"  +str(entity.name)+"',"+ str(entity.cityId)+')')
                c.commit()
            else :
                c.execute("update PopularPlace set name='" +str(entity.name)+"', cityId="+ str(entity.cityId)+' where id='+ str(entity.id))
                c.commit()
            return PopularPlace(entity.id, entity.name, entity.cityId)
        except:
            print("There was an error")
            return None