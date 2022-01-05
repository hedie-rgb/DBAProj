from Repository import RepositoryInterface
from Connection import getConn
from Domestic import Domestic
class DomesticDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Domestic where FlightTransportnumber=' + str(id))
            i = c.fetchall()
            return Domestic(i[0][0])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Domestic where FlightTransportnumber=' + str(id))
                i = c.fetchall()
                a.append(Domestic(i[0][0]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Domestic')    
            for i in c:
                a.append(Domestic(i[0]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Domestic where FlightTransportnumber=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Domestic where FlightTransportnumber=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('insert into Domestic values(' + str(entity.FlightTransportnumber)+')')
            return Domestic(entity.FlightTransportnumber)
        except:
            print("There was an error")
            return None