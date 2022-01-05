class Transport:
    def __init__(self, number, date, time, duration, capacity, originCityId, destinationCityId, companyId):
        self.number = number
        self.time = time
        self.date=date
        self.duration= duration
        self.capacity=capacity
        self.originCityId=originCityId
        self.destinationCityId=destinationCityId
        self.companyId=companyId