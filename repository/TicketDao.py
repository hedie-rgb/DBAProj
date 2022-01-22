from Repository import RepositoryInterface
from Connection import getConn
from Ticket import Ticket
class TicketDao(RepositoryInterface):
    def findById(id):
        try:
            c = getConn()
            c.execute('select * from Ticket where code=' + str(id))
            i = c.fetchall()
            return Ticket(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6])
        except:
            print("There was an error")
            return None
    def findByIds(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Ticket where code=' + str(id))
                i = c.fetchall()
                a.append(Ticket(i[0][0], i[0][1], i[0][2], i[0][3], i[0][4], i[0][5], i[0][6]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Ticket')    
            for i in c:
                a.append(Ticket(i[0], i[1], i[2], i[3], i[4], i[5], i[6]))
            return a
        except:
            print("There was an error")
            return None
    def deleteById(id):
        try:
            c=getConn()
            c.execute('delete from Ticket where code=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByIds(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Ticket where code=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Ticket where code=' + str(entity.code))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Ticket values('  +str(entity.seatNumber)+',' +str(entity.ticketNumber)+','+ str(entity.status)+','+ str(entity.Transportnumber)+",'"+ str(entity.type)+"',"+ str(entity.cost)+')')
                c.commit()
            else :
                c.execute('upticketNumber Ticket set seat_number=' +str(entity.seatNumber)+', ticket_number='+ str(entity.ticketNumber)+', _status='+ str(entity.status)+', Transportnumber='+ str(entity.Transportnumber)+", _type='"+ str(entity.type)+"', cost="+ str(entity.cost)+' where code='+ str(entity.id))
                c.commit()
            return Ticket(entity.code, entity.seatNumber, entity.ticketNumber, entity.status, entity.Transportnumber, entity.type, entity.cost)
        except:
            print("There was an error")
            return None