import sys
from PyQt5.QtWidgets import QApplication, QLabel, QMainWindow
from PyQt5.QtCore import Qt

from .login_ui.LoginWidget import Ui_LoginPage

class MainWindow(QMainWindow):

    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.setFixedSize(1024, 727)

        self.loadedUi = Ui_LoginPage()
        self.loadedUi.setupUi(self)


