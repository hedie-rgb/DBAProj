from Repository import RepositoryInterface
from Connection import getConn
from Transactions import Transactions
class TransactionsDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Transactions where id=' + str(id))
            i = c.fetchall()
            return Transactions(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Transactions where id=' + str(id))
                i = c.fetchall()
                a.append(Transactions(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Transactions')    
            for i in c:
                a.append(Transactions(i[0], i[1], i[2], i[3], i[4]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Transactions where id=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Transactions where id=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Transactions where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Transactions values('  +str(entity.amount)+",'" +str(entity.type)+"','"+ str(entity.date)+"',"+ str(entity.userId)+')')
                c.commit()
            else :
                c.execute('uptype Transactions set amount=' +str(entity.amount)+", _type='"+ str(entity.type)+"', _date='"+ str(entity.date)+"', Userid="+ str(entity.userId)+' where id='+ str(entity.id))
                c.commit()
            return Transactions(entity.id, entity.amount, entity.adult)
        except:
            print("There was an error")
            return None