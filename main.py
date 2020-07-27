from src.Controller.LogInController import LoginController
from src.view.mainWindow import MainWindow
from src.model.Database import Database as dbm
from PyQt5 import QtWidgets
import sys
from datetime import datetime

if __name__ == '__main__':
    # try:
        

    #     db.logIn('KennethS0', 'Passwordxd')
    #     db.revokeAdmin('KennethS01')

    # except Exception as err:
    #     print(err)
    # 
    # model.signUp(citizenId=1178709336,
    #                firstName='KENNETH',
    #                secondName= '',
    #                lastName= 'SANCHEZ',
    #                secondLastName='OCAMPO',
    #                email='kenneth.sanzchez0906',
    #                date=datetime.now().date(),  
    #                genderId=2,
    #                nationalityId=44,
    #                communityId=1010106,
    #                username='kenneths01',
    #                password='Passwordxd')           
    app = QtWidgets.QApplication(sys.argv)

    view = MainWindow()
    
    model = dbm.Database.getInstance()
    model.connect('ge', 'ge', 'localhost', 'ge')

    loginController = LoginController(view, model)
    # registerController = RegisterController(view, model)


    view.show()

    app.exec_()
