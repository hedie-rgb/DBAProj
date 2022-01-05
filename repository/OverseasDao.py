from Repository import RepositoryInterface
from Connection import getConn
from Overseas import Overseas
class OverseasDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Overseas where FlightTransportnumber=' + str(id))
            i = c.fetchall()
            return Overseas(i[0][0])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Overseas where FlightTransportnumber=' + str(id))
                i = c.fetchall()
                a.append(Overseas(i[0][0]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Overseas')    
            for i in c:
                a.append(Overseas(i[0]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Overseas where FlightTransportnumber=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Overseas where FlightTransportnumber=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('insert into Overseas values(' + str(entity.FlightTransportnumber)+')')
            return Overseas(entity.FlightTransportnumber)
        except:
            print("There was an error")
            return None