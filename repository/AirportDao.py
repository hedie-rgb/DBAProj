from Repository import RepositoryInterface
from Connection import getConn
from Airport import Airport
class AirportDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Airport where code=' + str(id))
            i = c.fetchall()
            return Airport(i[0][0], i[0][1], i[0][2])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Airport where code=' + str(id))
                i = c.fetchall()
                a.append(Airport(i[0][0], i[0][1], i[0][2]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Airport')    
            for i in c:
                a.append(Airport(i[0], i[1], i[2]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Airport where code=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Airport where code=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Airport where code=' + str(entity.code))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into Airport values('" + str(entity.name)+"',"+ str(entity.cityId)+')')
                c.commit()
            else :
                c.execute("update Airport set name='" +str(entity.name)+"', cityId="+ str(entity.cityId)+" where code="+ str(entity.code))
                c.commit()
            return Airport(entity.code, entity.name, entity.cityId)
        except:
            print("There was an error")
            return None