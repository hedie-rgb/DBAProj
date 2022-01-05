from Repository import RepositoryInterface
from Connection import getConn
from MultiWayOverseas import MultiWayOverseas
class MultiWayOverseasDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from MultiWay_Overseas where MultiWayid=' + str(id))
            i = c.fetchall()
            return MultiWayOverseas(i[0][0])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from MultiWay_Overseas where MultiWayid=' + str(id))
                i = c.fetchall()
                a.append(MultiWayOverseas(i[0][0]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from MultiWay_Overseas')    
            for i in c:
                a.append(MultiWayOverseas(i[0]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from MultiWay_Overseas where MultiWayid=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from MultiWay_Overseas where MultiWayid=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from MultiWay_Overseas where MultiWayid=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into MultiWay_Overseas values(' + str(entity.MultiWayid)+',' +str(entity.OverseasFlightTransportnumber)+')')
            else :
                c.execute('update MultiWay_Overseas set OverseasFlightTransportnumber=' +str(entity.OverseasFlightTransportnumber)+' where MultiWayid='+ str(entity.id))
                return MultiWayOverseas(entity.MultiWayid, entity.OverseasFlightTransportnumber)
        except:
            print("There was an error")
            return None