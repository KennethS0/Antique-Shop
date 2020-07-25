import mysql.connector

'''
    Database class (SINGLETON):
        This class is responsible for all connections,
        queries and data manipulation  
'''

class Database:

    instance = None

    @staticmethod
    def getInstance():
        if Database.instance == None:
            return Database()
        return Database.instance

   
    def __init__(self):
        if Database.instance != None:
            raise Exception('SINGLETON CLASS')
        else:
            Database.instace = self


    def connect(self, pUser, pPassword, pHost, pDatabase):
        try:
            self.connection = mysql.connector.connect(user=pUser,
                                                      password = pPassword,
                                                      host = pHost,
                                                      database = pDatabase)
        except:
            print('Error occured')


    def disconnect(self):
        self.connection.close()

if __name__ == '__main__':
    db = Database.getInstance()
    db.connect('ge', 'ge', 'localhost', 'ge')
    cursor = db.connection.cursor()

    cursor.execute('SELECT * FROM PROVINCE', ())

    for i in cursor:
        print(i)