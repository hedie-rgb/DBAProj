from Repository import RepositoryInterface
from Connection import getConn
from HotelHotelFacility import HotelHotelFacility
class HotelHotelFacilityDao(RepositoryInterface):
    def findByHotelid(id):
        try:
            c = getConn()
            c.execute('select * from Hotel_Hotel_Facility where Hotelid=' + str(id))
            i = c.fetchall()
            return HotelHotelFacility(i[0][0], i[0][1])
        except:
            print("There was an error")
            return None
    def findByHotelids(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Hotel_Hotel_Facility where Hotelid=' + str(id))
                i = c.fetchall()
                a.append(HotelHotelFacility(i[0][0], i[0][1]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Hotel_Hotel_Facility')    
            for i in c:
                a.append(HotelHotelFacility(i[0], i[1]))
            return a
        except:
            print("There was an error")
            return None
    def deleteByHotelid(id):
        try:
            c=getConn()
            c.execute('delete from Hotel_Hotel_Facility where Hotelid=' + str(id))
            return True
        except:
            return False
    def deleteByHotelids(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Hotel_Hotel_Facility where Hotelid=' + str(id))
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Hotel_Hotel_Facility where Hotelid=' + str(entity.hotelId))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Hotel_Hotel_Facility values(' + str(entity.hotelId)+',' +str(entity.hotelFacilityId)+')')
            else :
                c.execute('update Hotel_Hotel_Facility set Hotel_Facilityid=' +str(entity.hotelFacilityId)+' where Hotelid='+ str(entity.hotelId))
            return HotelHotelFacility(entity.hotelId, entity.hotelFacilityId)
        except:
            print("There was an error")
            return None