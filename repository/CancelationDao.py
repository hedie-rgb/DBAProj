from Repository import RepositoryInterface
from Connection import getConn
from Cancelation import Cancelation
class CancelationDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Cancelation where id=' + str(id))
            i = c.fetchall()
            return Cancelation(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Cancelation where id=' + str(id))
                i = c.fetchall()
                a.append(Cancelation(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Cancelation')    
            for i in c:
                a.append(Cancelation(i[0], i[1], i[2], i[3], i[4], i[5], i[6], i[7]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Cancelation where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Cancelation where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Cancelation where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into Cancelation values('" + str(entity.rules)+"',"+ str(entity.userId)+ str(entity.refund)+"'," +str(entity.date)+"','"+ str(entity.time)+"',"+ str(entity.transportNumber)+',' +str(entity.hotrlId)+')')
                c.commit()
            else :
                c.execute("update Cancelation set rules='" +str(entity.rules)+"', userId="+ str(entity.userId)+', refund='+str(entity.refund)+", date='"+ str(entity.date)+ ", time='"+str(entity.time)+"', transportNumber=" +str(entity.transportNumber)+', hotelId=' +str(entity.hotrlId)+' where id='+ str(entity.id))
                c.commit()
            return Cancelation(entity.id, entity.rules, entity.userId, entity.refund, entity.date, entity.time, entity.transportNumber, entity.hotelId)
        except:
            print("There was an error")
            return None