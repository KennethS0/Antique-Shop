import sys
from PyQt5.QtWidgets import QApplication
from PyQt5.QtWidgets import QMainWindow

from .Ui_MainWindow import *

class MainWindow:
    def __init__(self):
        self.main_win = QMainWindow()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self.main_win)

        self.ui.MainWindow_PageGroup.setCurrentWidget(self.ui.LoginPage)

        self.ui.Login_RegisterButton.clicked.connect(self.showRegister)
        

        
        self.ui.Register_CancelButton.clicked.connect(self.showLogin)



        #Available Functionalities for Users (Non-Admins)
        self.ui.UserMenu_SearchButton.clicked.connect(self.showSearch)
        self.ui.Search_OpenProductPageButton.clicked.connect(self.showProduct)
        self.ui.UserMenu_PurchaseHistoryButton.clicked.connect(self.showPurchaseHistory)
        self.ui.UserMenu_MessagesButton.clicked.connect(self.showMessages)
        self.ui.UserMenu_SellingButton.clicked.connect(self.showSelling)
        self.ui.UserMenu_ReviewsButton.clicked.connect(self.showReviews)
        self.ui.UserMenu_WishlistButton.clicked.connect(self.showWishlist)
        self.ui.Wishlist_OpenProductButton.clicked.connect(self.showProduct)
        self.ui.UserMenu_ListsButton.clicked.connect(self.showLists)
        self.ui.UserMenu_CartButton.clicked.connect(self.showCart)
        self.ui.UserMenu_Username.clicked.connect(self.showUserEdit)
        self.ui.UserEdit_ApplyButton.clicked.connect(self.showSearch)
        self.ui.Selling_RegisterProductButton.clicked.connect(self.showProductRegister)
        self.ui.UserMenu_LogoutButton.clicked.connect(self.showLogin)



        #Extra Functionalities for Admins (includes the ones before)
        self.ui.UserMenu_StatisticsButton.clicked.connect(self.showStatistics)
        self.ui.UserMenu_QueriesButton.clicked.connect(self.showQueries)
        self.ui.UserMenu_TableButton.clicked.connect(self.showTable)
        self.ui.Table_EditSelectedButton.clicked.connect(self.showEditTable)



    def show(self):
        self.main_win.show()

    def showLogin(self):
        self.ui.MainWindow_PageGroup.setCurrentWidget(self.ui.LoginPage)

    def showRegister(self):
        self.ui.MainWindow_PageGroup.setCurrentWidget(self.ui.RegisterPage)

    def showUserMenu(self):
        self.ui.MainWindow_PageGroup.setCurrentWidget(self.ui.UserMenuPage)





    def showSearch(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.SearchPage)
    
    def showProduct(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.ProductPage)  

    def showPurchaseHistory(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.PurchaseHistoryPage)

    def showMessages(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.MessagesPage)

    def showSelling(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.SellingPage)

    def showReviews(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.ReviewsPage)

    def showWishlist(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.WishlistPage)

    def showLists(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.ListsPage)

    def showCart(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.CartPage)

    def showUserEdit(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.UserEditPage)

    def showProductRegister(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.ProductRegisterPage)



    def showStatistics(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.StatisticsPage)

    def showQueries(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.QueriesPage)

    def showTable(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.TablePage)

    def showEditTable(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.EditTablePage)



if __name__ == '__main__':
    app = QApplication(sys.argv)
    main_win = MainWindow()
    main_win.show()
    sys.exit(app.exec_())