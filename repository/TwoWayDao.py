from Repository import RepositoryInterface
from Connection import getConn
from TwoWay import TwoWay
class TwoWayDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Two_Way where OverseasFlightTransportnumber1=' + str(id))
            i = c.fetchall()
            return TwoWay(i[0][0], i[0][1], i[0][2], i[0][3])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Two_Way where OverseasFlightTransportnumber1=' + str(id))
                i = c.fetchall()
                a.append(TwoWay(i[0][0], i[0][1], i[0][2], i[0][3]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Two_Way')    
            for i in c:
                a.append(TwoWay(i[0], i[1], i[2], i[3]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Two_Way where OverseasFlightTransportnumber1=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from TwoWay where OverseasFlightTransportnumber1=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from TwoWay where OverseasFlightTransportnumber1=' + str(entity.OverseasFlightTransportnumber1))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into TwoWay values(' + str(entity.OverseasFlightTransportnumber1)+',' +str(entity.OverseasFlightTransportnumber2)+','+ str(entity.DomesticFlightTransportnumber1)+','+ str(entity.DomesticFlightTransportnumber2)+')')
                c.commit()
            else :
                c.execute('update TwoWay set OverseasFlightTransportnumber2=' +str(entity.OverseasFlightTransportnumber2)+', DomesticFlightTransportnumber1='+ str(entity.DomesticFlightTransportnumber1)+', DomesticFlightTransportnumber2='+ str(entity.DomesticFlightTransportnumber2)+' where OverseasFlightTransportnumber1='+ str(entity.OverseasFlightTransportnumber1))
                c.commit()
            return TwoWay(entity.OverseasFlightTransportnumber1, entity.OverseasFlightTransportnumber2, entity.DomesticFlightTransportnumber1,entity.DomesticFlightTransportnumber2)
        except:
            print("There was an error")
            return None