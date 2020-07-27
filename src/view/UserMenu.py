import sys
from PyQt5.QtWidgets import QApplication
from PyQt5.QtWidgets import QMainWindow

from Ui_UserMenu import Ui_UserMenuPage

class UserMenu:
    def __init__(self):
        self.main_win = QMainWindow()
        self.ui = Ui_UserMenuPage()
        self.ui.setupUi(self.main_win)

        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.SearchPage)

        self.ui.UserMenu_SearchButton.clicked.connect(self.showSearch)
        self.ui.UserMenu_PurchaseHistoryButton.clicked.connect(self.showPurchaseHistory)
        self.ui.UserMenu_MessagesButton.clicked.connect(self.showMessages)
        self.ui.UserMenu_SellingButton.clicked.connect(self.showSelling)
        self.ui.UserMenu_ReviewsButton.clicked.connect(self.showReviews)
        self.ui.UserMenu_WishlistButton.clicked.connect(self.showWishlist)
        self.ui.UserMenu_ListsButton.clicked.connect(self.showLists)
        self.ui.UserMenu_CartButton.clicked.connect(self.showCart)
        self.ui.UserMenu_Username.clicked.connect(self.showUserEdit)
        self.ui.Selling_RegisterProductButton.clicked.connect(self.showProductRegister)


    def show(self):
        self.main_win.show()

    def showSearch(self):
        self.ui.UserMenu_WidgetGroup.setCurrentWidget(self.ui.SearchPage)

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

if __name__ == '__main__':
    app = QApplication(sys.argv)
    main_win = UserMenu()
    main_win.show()
    sys.exit(app.exec_())