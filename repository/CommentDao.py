from Repository import RepositoryInterface
from Connection import getConn
from Comment import Comment
class CommentDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from _Comment where id=' + str(id))
            i = c.fetchall()
            return Comment(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from _Comment where id=' + str(id))
                i = c.fetchall()
                a.append(Comment(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from _Comment')    
            for i in c:
                a.append(Comment(i[0], i[1], i[2], i[3], i[4], i[5], i[6]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from _Comment where id=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from _Comment where id=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from _Comment where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into _Comment values('" + str(entity.date)+"','"+ str(entity.advantages)+"')")
                c.commit()
            else :
                c.execute("update _Comment set date='" +str(entity.date)+"', advantages="+ str(entity.advantages)+", disadvantages='"+ str(entity.disadvantages)+"', conclusion='"+ str(entity.conclusion)+"', userId="+ str(entity.userId)+', hotelId='+ str(entity.hotelId)+' where id='+ str(entity.id))
                c.commit()
            return Comment(entity.id, entity.date, entity.advantages, entity.disadvantages, entity.conclusion, entity.userId, entity.hotelId)
        except:
            print("There was an error")
            return None