class RegisterController:
    '''
        Connects the login view to the model.
    '''

    def __init__(self, pView, pModel):
        self.view = pView
        self.model = pModel

        # Sets the events
        self.view.ui.Register_RegisterButton.clicked.connect(self.registerNewUser)


    def registerNewUser(self):
        print('aqui')
        # self.ui.Register_RegisterButton.clicked.connect(self.showLogin)