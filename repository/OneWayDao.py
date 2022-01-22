from Repository import RepositoryInterface
from Connection import getConn
from OneWay import OneWay
class OneWayDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from One_Way where DomesticFlightTransportnumber=' + str(id))
            i = c.fetchall()
            return OneWay(i[0][0], i[0][1])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from One_Way where DomesticFlightTransportnumber=' + str(id))
                i = c.fetchall()
                a.append(OneWay(i[0][0], i[0][1]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from One_Way')    
            for i in c:
                a.append(OneWay(i[0], i[1]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from One_Way where DomesticFlightTransportnumber=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from One_Way where DomesticFlightTransportnumber=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('insert into One_Way values(' + str(entity.DomesticFlightTransportnumber)+ str(entity.OverseasFlightTransportnumber)+')')
            c.commit()
            return OneWay(entity.FlightTransportnumber, entity.OverseasFlightTransportnumber)
        except:
            print("There was an error")
            return None