from Repository import RepositoryInterface
from Connection import getConn
from Flight import Flight
class FlightDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Flight where Transportnumber=' + str(id))
            i = c.fetchall()
            return Flight(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Flight where Transportnumber=' + str(id))
                i = c.fetchall()
                a.append(Flight(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Flight')    
            for i in c:
                a.append(Flight(i[0], i[1], i[2], i[3], i[4]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Flight where Transportnumber=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Flight where Transportnumber=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Flight where Transportnumber=' + str(entity.transportNumber))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Flight values(' + str(entity.transportNumber)+',' +str(entity.flightClass)+','+ str(entity.allowedBaggage)+','+ str(entity.airportCodeOrigin)+','+ str(entity.airportCodeDestination)+')')
            else :
                c.execute('update Flight set Transportnumber=' +str(entity.name)+', class='+ str(entity.flightClass)+', amount_of_allowed_baggage='+ str(entity.allowedBaggage)+', Airportcode_origin='+ str(entity.airportCodeOrigin)+', Airportcode_destination='+ str(entity.airportCodeDestination)+' where Transportnumber='+ str(entity.Transportnumber))
            return Flight(entity.Transportnumber, entity.name, entity.cityId)
        except:
            print("There was an error")
            return None