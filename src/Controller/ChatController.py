class ChatController:

    def __init__(self, pView, pModel):
        '''
            Lets the user send messages to diferent people.
        '''

        self.view = pView
        self.model = pModel

        # Loads the data related to the user
        self.view.ui.Messages_UsersTree.setHeaderLabels(['User'])
        self.view.ui.UserMenu_MessagesButton.clicked.connect(self.loadUsers)

    def loadUsers(self):
        '''
            Loads the users that have messaged the logged on user
        '''
        users = self.model.query(I.GET_MESSAGED_USERS, (self.model.connectedUser.id))