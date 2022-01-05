from Repository import RepositoryInterface
from Connection import getConn
from FlightLegs import FlightLegs
class FlightLegsDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Flight_Legs where code=' + str(id))
            i = c.fetchall()
            return FlightLegs(i[0][0], i[0][1], i[0][2], i[0][3])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Flight_Legs where code=' + str(id))
                i = c.fetchall()
                a.append(FlightLegs(i[0][0], i[0][1], i[0][2], i[0][3]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Flight_Legs')    
            for i in c:
                a.append(FlightLegs(i[0], i[1], i[2], i[3]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Flight_Legs where code=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Flight_Legs where code=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Flight_Legs where code=' + str(entity.code))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Flight_Legs values(' + str(entity.duration)+','+ str(entity.overseasFlightTransportNumber)+','+ str(entity.airportCode)+')')
            else :
                c.execute('update FlightLegs set duration=' +str(entity.duration)+', OverseasFlightTransportnumber='+ str(entity.overseasFlightTransportNumber)+', Airportcode='+ str(entity.airportCode)+' where code='+ str(entity.code))
            return FlightLegs(entity.code, entity.name, entity.cityId)
        except:
            print("There was an error")
            return None