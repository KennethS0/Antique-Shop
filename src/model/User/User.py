'''
'''


class User:
    '''
        User class used to represent an account
        saved in the database.
    '''


    def __init__(self, pUsername, pId):
        '''
            Constructor method, saves user information
            for querying data.
        '''
        self.username = pUsername
        self.id = pId
        self.isAdmin = False