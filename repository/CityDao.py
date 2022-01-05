from Repository import RepositoryInterface
from Connection import getConn
from City import City
class CityDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from City where id=' + str(id))
            i = c.fetchall()
            return City(i[0][0], i[0][1], i[0][2])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from City where id=' + str(id))
                i = c.fetchall()
                a.append(City(i[0][0], i[0][1], i[0][2]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from City')    
            for i in c:
                a.append(City(i[0], i[1], i[2]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from City where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from City where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from City where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into City values('" + str(entity.name)+"',"+ str(entity.countryId)+')')
                c.commit()
            else :
                c.execute("'update City set name='" +str(entity.name)+"', countryId="+ str(entity.countryId)+' where id='+ str(entity.id))
                c.commit()
            return City(entity.id, entity.name, entity.countryId)
        except:
            print("There was an error")
            return None