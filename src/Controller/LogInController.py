from PyQt5 import QtWidgets
from src.Controller.SellingController import SellingController
from src.Controller.QueriesController import QueriesController

class LoginController:
    '''
        Connects the login view to the model.
    '''

    def __init__(self, pView, pModel):
        self.view = pView
        self.model = pModel 

        # Adds the events to each button
        self.view.ui.Login_LoginButton.clicked.connect(self.login) # User info or Admin
        self.view.ui.Login_CancelButton.clicked.connect(self.cancelLogin)


    def login(self):
        '''
            Logs in a user and changes the window.
        '''
        try:
            username = self.view.ui.Login_UsernameInput.text().strip()
            password = self.view.ui.Login_PasswordInput.text().strip()
            
            if not username or not password:
                raise Exception('Make sure all spaces are filled out.')

            self.model.logIn(username, password)
            self.cancelLogin()
            
            if not self.model.connectedUser.isAdmin:
                self.view.ui.UserMenu_StatisticsButton.hide()
                self.view.ui.UserMenu_TableButton.hide()

            self.view.showUserMenu()

            # self.chatController = ChatController(self.view, self.model)
            self.queriesController = QueriesController(self.view, self.model)
        except Exception as err:

            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('Invalid credentials.')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)

            msg.exec_()


    def cancelLogin(self):
        '''
            Clears data in the filled spaces.
        '''
        self.view.ui.Login_PasswordInput.clear()
        self.view.ui.Login_UsernameInput.clear()
