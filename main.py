from src.Controller.LogInController import LoginController
from src.Controller.RegisterController import RegisterController
from src.Controller.SearchController import SearchController
from src.Controller.SellingController import SellingController
from src.Controller.StatisticsController import StatisticsController
from src.Controller.ProductviewController import ProductviewController
from src.Controller.ChatController import ChatController
from src.Controller.WishlistController import WishlistController
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
           
    app = QtWidgets.QApplication(sys.argv)

    view = MainWindow()
    
    model = dbm.Database.getInstance()
    model.connect('ge', 'ge', 'localhost', 'ge')
    
    loginController = LoginController(view, model)
    registerController = RegisterController(view, model)
    searchController = SearchController(view, model)
    statisticsController = StatisticsController(view, model)
    sellingController = SellingController(view, model)
    wishlistController = WishlistController(view, model)

    view.show()
    
    app.exec_()

