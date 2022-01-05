from Repository import RepositoryInterface
from Connection import getConn
from User import User
class UserDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from _user where id=' + str(id))
            i = c.fetchall()
            return User(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7], i[0][8], i[0][9], i[0][10], i[0][11], i[0][12], i[0][13])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from _user where id=' + str(id))
                i = c.fetchall()
                a.append(User(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7], i[0][8], i[0][9], i[0][10], i[0][11], i[0][12], i[0][13]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from _user')    
            for i in c:
                a.append(User(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7], i[0][8], i[0][9], i[0][10], i[0][11], i[0][12], i[0][13]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from _user where id=' + str(id))
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from _user where id=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from _user where id=' + str(entity.id))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into _user values('  +str(entity.mobile)+',' +str(entity.email)+',' +str(entity.birth)+',' +str(entity.phone)+',' +str(entity.ssn)+','+ str(entity.gender)+','+ str(entity.passno)+','+ str(entity.firstName)+','+ str(entity.lastName)+','+ str(entity.password)+','+ str(entity.balance)+','+ str(entity.registrationDate)+','+ str(entity.accountNumber)+')')
            else :
                c.execute('update _user set MobileNumber=' +str(entity.mobile)+', email='+ str(entity.email)+', DateOfBirth='+ str(entity.birth)+', TelephoneNumber='+ str(entity.phone)+', SSN='+ str(entity.ssn)+', gender='+ str(entity.gender)+', PassportNumber='+ str(entity.passno)+', first_name='+ str(entity.firstName)+', last_name='+ str(entity.lastName)+', _password='+ str(entity.password)+', balance='+ str(entity.balance)+', registration_date='+ str(entity.registrationDate)+', account_number='+ str(entity.accountNumber)+' where id='+ str(entity.id))
            return User(entity.id, entity.mobile,entity.email, entity.birth, entity.phone,entity.ssn, entity.gender,entity.passno, entity.firstName, entity.lastName, entity.password, entity.balance, entity.registrationDate, entity.accountNumber)
        except:
            print("There was an error")
            return None