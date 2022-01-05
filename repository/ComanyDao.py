from Repository import RepositoryInterface
from Connection import getConn
from Company import Company
class CompanyDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Company where id=' + str(id))
            i = c.fetchall()
            return Company(i[0][0], i[0][1])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Company where id=' + str(id))
                i = c.fetchall()
                a.append(Company(i[0][0], i[0][1]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Company')    
            for i in c:
                a.append(Company(i[0], i[1]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Company where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Company where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Company where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Company values(' +str(entity.name)+')')
            else :
                c.execute('update Company set name=' +str(entity.name)+' where id='+ str(entity.id))
            return Company(entity.id, entity.name)
        except:
            print("There was an error")
            return None