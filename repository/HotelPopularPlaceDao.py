from Repository import RepositoryInterface
from Connection import getConn
from HotelPopularPlace import HotelPopularPlace
class HotelPopularPlaceDao(RepositoryInterface):
    def findByHotelid(id):
        try:
            c = getConn()
            c.execute('select * from Hotel_Popular_Palce where Hotelid=' + str(id))
            i = c.fetchall()
            return HotelPopularPlace(i[0][0], i[0][1])
        except:
            print("There was an error")
            return None
    def findByHotelids(ids):
        try:
            a = []
            c = getConn()
            for id in ids:
                c.execute('select * from Hotel_Popular_Palce where Hotelid=' + str(id))
                i = c.fetchall()
                a.append(HotelPopularPlace(i[0][0], i[0][1]))
            return a
        except:
            print("There was an error")
            return None
    def findAll():
        try:
            a = []
            c=getConn()
            c.execute('select * from Hotel_Popular_Palce')    
            for i in c:
                a.append(HotelPopularPlace(i[0], i[1]))
            return a
        except:
            print("There was an error")
            return None
    def deleteByHotelid(id):
        try:
            c=getConn()
            c.execute('delete from Hotel_Popular_Palce where Hotelid=' + str(id))
            c.commit()
            return True
        except:
            return False
    def deleteByHotelids(ids):
        try:
            c=getConn()
            for id in ids:
                   c.execute('delete from Hotel_Popular_Palce where Hotelid=' + str(id))
                   c.commit()
            return True
        except:
            return False
    def save(entity):
        try:
            c=getConn()
            c.execute('select * from Hotel_Popular_Palce where Hotelid=' + str(entity.hotelId))
            i = c.fetchall()
            if len(i) == 0:
                c.execute('insert into Hotel_Popular_Palce values(' + str(entity.hotelId)+',' +str(entity.popularPlaceId)+')')
                c.commit()
            else :
                c.execute('update Hotel_Popular_Palce set Popular_Palceid=' +str(entity.popularPlaceId)+' where Hotelid='+ str(entity.hotelId))
                c.commit()
            return HotelPopularPlace(entity.hotelId, entity.popularPlaceId)
        except:
            print("There was an error")
            return None