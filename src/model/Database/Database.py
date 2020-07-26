import mysql.connector
import model.Database.IConstants as I
import model.User.User as u

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

            cursor.callproc(I.SIGN_UP_PERSON, (kwargs['citizenId'],
                                             kwargs['firstName'].upper(), 
                                             kwargs['secondName'].upper(),
                                             kwargs['lastName'].upper(),
                                             kwargs['secondLastName'].upper(),
                                             kwargs['email'].upper(), 
                                             kwargs['date'],
                                             kwargs['genderId'],
                                             kwargs['nationalityId'], 
                                             kwargs['communityId']))

            cursor.callproc(I.SIGN_UP_PERSON, (kwargs['citizenId'], 
                                           kwargs['username'].upper(),
                                           kwargs['password']))

        except Exception as err:
            print(err)
        
        finally:
            cursor.close()


    def logIn(self, pUsername, pPassword):
        '''
            Logs in the user, saving its information
            in a User instance.
        '''
        try:
            cursor = self.connection.cursor()

            cursor.callproc(I.LOGIN, (pUsername, pPassword))

            userData = []

            # Saves the data
            for results in cursor.stored_results():
                userData += results.fetchall()

            # Creates the user if one was found
            if userData:
                self.connectedUser = u.User(userData[0][1], userData[0][0])
                
                cursor.callproc(I.IS_ADMIN, (userData[0][0],))
                
                # Sets the admin state in the user
                for isAdmin in cursor.stored_results():
                    self.connectedUser.isAdmin = isAdmin.fetchall()[0][0]

            else:
                raise Exception('Incorrect username or password.')

        except Exception as err:
            print(err)

        finally:
            cursor.close()
