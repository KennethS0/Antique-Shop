from ..model.Database import IConstants as I
from PyQt5 import QtWidgets, QtGui
import re
from PyQt5.QtCore import Qt
from src.Controller.ProductviewController import ProductviewController

class SeenController:

    #    Connects the login view to the model.
    def __init__(self, pView, pModel):

        self.view = pView
        self.model = pModel

        self.view.ui.RecentlySeen_ShowButton.setText("Refresh")
        self.view.ui.RecentlySeen_ShowButton.clicked.connect(self.refreshSeen)
        self.view.ui.RecentlySeen_TableDisplay.setColumnCount(4)
        self.view.ui.RecentlySeen_TableDisplay.setHorizontalHeaderLabels(['ID', 'Product', 'Price', 'Category'])
        self.view.ui.RecentlySeen_TableDisplay.cellDoubleClicked.connect(self.selectProduct)
        self.productviewController = ProductviewController(self.view, self.model)

    #   GETS SEEN INFORMATION OF USER
    def refreshSeen(self):
        self.view.ui.RecentlySeen_TableDisplay.clearContents()

        try:
            self.products = self.model.query(I.GET_SEEN, (self.model.connectedUser.id,))

            if self.products == []:
                print('No products seen')
            else:
                self.view.ui.RecentlySeen_TableDisplay.setRowCount(len(self.products))            
            
            for i in range(len(self.products)):
                for j in range(4):
                    item = QtWidgets.QTableWidgetItem(str(self.products[i][j]))
                    item.setFlags( Qt.ItemIsSelectable |  Qt.ItemIsEnabled )
                    self.view.ui.RecentlySeen_TableDisplay.setItem(i,j,item)
            
        except Exception as err:

            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)

            msg.exec_()

    def selectProduct(self, row, column):
        #print("SELECTED PRODUCT ID " + self.view.ui.Wishlist_WishlistTableInput.item(row, 0).text())
        try:
            self.productviewController.setProduct(int(self.view.ui.RecentlySeen_TableDisplay.item(row, 0).text()))
            self.view.showProduct()
        except Exception as err:
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)
            msg.exec_()
            
