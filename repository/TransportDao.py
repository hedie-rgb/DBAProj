from Repository import RepositoryInterface
from Connection import getConn
from Transport import Transport
class TransportDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Transport where _number=' + str(id))
            i = c.fetchall()
            return Transport(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Transport where _number=' + str(id))
                i = c.fetchall()
                a.append(Transport(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6], i[0][7]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Transport')    
            for i in c:
                a.append(Transport(i[0], i[1], i[2], i[3], i[4], i[5], i[6], i[7]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Transport where _number=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Transport where _number=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Transport where _number=' + str(entity.number))
            i = c.fetchall()
            if len(i) == 0:
                c.execute("insert into Transport values('"  +str(entity.time)+"','" +str(entity.date)+"','"+ str(entity.duration)+"',"+ str(entity.capacity)+','+ str(entity.originCityId)+','+ str(entity.destinationCityId)+','+ str(entity.companyId)+')')
                c.commit()
            else :
                c.execute("update Transport set time='" +str(entity.time)+"', _date='"+ str(entity.date)+"', duration='"+ str(entity.duration)+"', capacity="+ str(entity.capacity)+', origin_city_id='+ str(entity.originCityId)+', destination_city_id='+ str(entity.destinationCityId)+', Companyid='+ str(entity.companyId)+' where _number='+ str(entity.id))
                c.commit()
            return Transport(entity.number, entity.time, entity.date, entity.duration, entity.capacity, entity.originCityId, entity.destinationCityId, entity.companyId)
        except:
            print("There was an error")
            return None