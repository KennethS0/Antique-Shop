import mysql.connector
import src.model.Database.IConstants as I
from ..User import User as u



class Database:
    '''
    Database class (SINGLETON):
        This class is responsible for all connections,
        queries and data manipulation  
    '''

    instance = None

    @staticmethod
    def getInstance():
        '''
        Gets the only instance of the database allowed
        '''
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


    def connect(self, pUser, pPassword, pHost, pDatabase) -> None:
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


    def disconnect(self) -> None:
        '''
            Closes the database connection.
        '''
        self.connection.close()

    def commit(self):
        try:
            cursor = self.connection.commit()
        except Exception as err:
            print(err)

    def query(self, instruction='', parameters=()) -> list:
        '''
            Retrieves data from a specific query.
        '''
        try:
            data = []

            cursor = self.connection.cursor()

            cursor.callproc(instruction, parameters)

            for results in cursor.stored_results():
                data += results.fetchall()

            return data

        except Exception as err:
            print(err)

        finally:
            cursor.close()


    def signUp(self, **kwargs) -> None:
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
                                             kwargs['communityId'],
                                             kwargs['username'],
                                             kwargs['password'],
                                             kwargs['phonenumber'],
                                             kwargs['phonetype'],
                                             kwargs['areacode']))

            self.connection.commit()

        except Exception as err:
            print(err)
        
        finally:
            cursor.close()


    def logIn(self, pUsername, pPassword) -> None:
        '''
            Logs in the user, saving its information
            in a User instance.
        '''
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
                break
        else:
            raise Exception('Incorrect username or password.')


    def makeAdmin(self, pUsername) -> None:
        '''
        Makes another user an administrator    
        '''
        if not self.connectedUser.isAdmin:
            raise Exception('The connected user is not an admin.')

        else:
            try:
                userData = self.query(instruction='Admin_GetUserData', parameters=(pUsername,))

                cursor = self.connection.cursor()

                cursor.callproc(I.MAKE_ADMIN, (userData[0][0],))

            except Exception as err:
                print(err)

            finally:
                cursor.close()


    def revokeAdmin(self, pUsername) -> None:
        '''
        Makes another user an administrator    
        '''
        if not self.connectedUser.isAdmin:
            raise Exception('The connected user is not an admin.')

        else:
            try:
                userData = self.query(instruction='Admin_GetUserData', parameters=(pUsername,))

                cursor = self.connection.cursor()

                cursor.callproc(I.REVOKE_ADMIN, (userData[0][0],))

            except Exception as err:
                print(err)

            finally:
                cursor.close()


    def insertData(self, instruction='', parameters=()) -> None:
        try:
            cursor = self.connection.cursor()

            cursor.callproc(instruction, parameters)
            
        except Exception as err:
            print(err)

        finally:
            cursor.close()

