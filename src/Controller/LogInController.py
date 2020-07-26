from ..view.App import MainWindow
from PyQt5 import QtCore, QtGui, QtWidgets
import sys
from ..model.Database import Database as dbm

class LoginController:

    def __init__(self, pModel):
        app = QtWidgets.QApplication(sys.argv)

        self.view = MainWindow()
        self.model = pModel
        self.model.connect('ge', 'ge', 'localhost', 'ge') 

        # Adds the events to each button
        self.view.loadedUi.Login_LoginButton.clicked.connect(self.login)
        self.view.loadedUi.Login_CancelButton.clicked.connect(self.cancelLogin)
        
        # Shows the application
        self.view.show()

        app.exec_()

    
    def login(self):
        '''
            Logs in a user and changes the window.
        '''
        try:
            username = self.view.loadedUi.Login_UsernameInput.text().strip()
            password = self.view.loadedUi.Login_PasswordInput.text().strip()
            
            self.model.login(username, password)
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
        self.view.loadedUi.Login_PasswordInput.clear()
        self.view.loadedUi.Login_UsernameInput.clear()