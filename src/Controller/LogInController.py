from PyQt5 import QtCore, QtGui, QtWidgets
import sys
from ..model.Database import Database as dbm

class LoginController:

    def __init__(self, pView, pModel):
        self.view = pView
        self.model = pModel 

        # Adds the events to each button
        self.view.ui.Login_LoginButton.clicked.connect(self.login)#User info or Admin
        self.view.ui.Login_CancelButton.clicked.connect(self.cancelLogin)
    

    def login(self):
        '''
            Logs in a user and changes the window.
        '''
        try:
            username = self.view.ui.Login_UsernameInput.text().strip()
            password = self.view.ui.Login_PasswordInput.text().strip()
            
            self.model.login(username, password)

            self.view.showUserMenu()
        except:
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('Invalid credentials.')
            msg.setText('Incorrect username or password!')
            msg.setIcon(QtWidgets.QMessageBox.Critical)

            msg.exec_()


    def cancelLogin(self):
        '''
            Clears data in the filled spaces.
        '''
        self.view.ui.Login_PasswordInput.clear()
        self.view.ui.Login_UsernameInput.clear()


    def loadRegister(self):
        '''
            
        '''