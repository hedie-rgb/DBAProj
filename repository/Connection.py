import pyodbc 

def getConn():
    conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-L0KFUVJ;'
                      'Database=Alibaba;'
                      'Trusted_Connection=yes;')

    cursor = conn.cursor()
    return 