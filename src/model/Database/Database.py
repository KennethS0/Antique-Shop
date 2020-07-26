import mysql.connector
import model.Database.IConstants

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
        '''
        Creates an instance of Database, if there is none
        '''
        if Database.instance != None:
            raise Exception('SINGLETON CLASS')
        else:
            Database.instace = self


    def connect(self, pUser, pPassword, pHost, pDatabase):
        '''
        Connects to the specified database
        '''
        try:
            self.connection = mysql.connector.connect(user=pUser,
                                                      password=pPassword,
                                                      host=pHost,
                                                      database=pDatabase)
        except:
            print('Error occured')


    def disconnect(self):
        '''
            Closes the database connection.
        '''
        self.connection.close()


    def query(self, **kwargs):
        # pPermission, pType, pInstruction, parameters=[], returnType=None, getRows=False
        pass

    def signUp(self, **kwargs):
        '''
        Signs up the person and user to the database.
        '''
        try:
            cursor = self.connection.cursor()

            cursor.callproc('SignUp_Person', (kwargs['citizenId'],
                                             kwargs['firstName'].upper(), 
                                             kwargs['secondName'].upper(),
                                             kwargs['lastName'].upper(),
                                             kwargs['secondLastName'].upper(),
                                             kwargs['email'].upper(), 
                                             kwargs['date'],
                                             kwargs['genderId'],
                                             kwargs['nationalityId'], 
                                             kwargs['communityId']))

            cursor.callproc('SignUp_Account', (kwargs['citizenId'], 
                                           kwargs['username'].upper(),
                                           kwargs['password']))

        except Exception as err:
            print(err)

    def logIn(self, pUsername, pPassword):
        try:
            cursor = self.connection.cursor()



        except Exception as err:
            print(err)



    def __getPublicKey(self):
        '''
        Method to get the public key in order to encrypt messages. 
        Method turned private for security.
        '''
        return rsa.PublicKey(7448188390935309559762268346969139335445643747358375780699545774849146587133817358590827902682907530426006839207101084773877149373355688748172562976675587, 
                             65537)
    
    
    def __getPrivateKey(self):
        '''
        Method to get the private key in order to decrypt messages.
        Method turned into private key for security.
        '''
        return rsa.PrivateKey(7448188390935309559762268346969139335445643747358375780699545774849146587133817358590827902682907530426006839207101084773877149373355688748172562976675587, 
                              65537, 
                              58415381127313565065807191820530961417505544747886005634673032459106479444200234828576816576660741873314729542542260093985551896547099833610253148818145, 
                              4770878076950975455204481644330156637049818655614541034913282465696905611356178713, 
                              1561177684862443317707859093150293908187485696864728316834700491281791099)