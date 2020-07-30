from ..model.Database import IConstants as I
from PyQt5 import QtWidgets, QtGui
import re
from PyQt5.QtCore import Qt
from src.Controller.ProductviewController import ProductviewController
from functools import partial

class CartController:

    #    Connects the login view to the model.
    def __init__(self, pView, pModel):

        self.view = pView
        self.model = pModel

        self.view.ui.Cart_ShowCartButton.setText("Refresh")
        self.view.ui.Cart_ShowCartButton.clicked.connect(self.refreshCart)
        self.view.ui.Cart_RemoveButton.clicked.connect(self.removeProduct)
        self.view.ui.Cart_CartTableInput.setColumnCount(4)
        self.view.ui.Cart_CartTableInput.setHorizontalHeaderLabels(['ID', 'Product', 'Price', 'Category'])
        self.view.ui.Cart_CartTableInput.cellDoubleClicked.connect(self.selectProduct)
        #self.view.ui.Cart_CartTableInput.cellClicked.connect(partial(self.selectItem, item))
        self.productviewController = ProductviewController(self.view, self.model)
        self.view.ui.Cart_BuyButton.clicked.connect(self.buyProducts)

        

        #   GETS AND DISPLAYS THE CART INFORMATION
    def refreshCart(self):
        self.view.ui.Cart_CartTableInput.clearContents()

        try:
            self.products = self.model.query(I.GET_CART, (self.model.connectedUser.id,))

            if self.products == []:
                print('No products on cart')
            else:
                self.view.ui.Cart_CartTableInput.setRowCount(len(self.products))            
            
            for i in range(len(self.products)):
                for j in range(4):
                    item = QtWidgets.QTableWidgetItem(str(self.products[i][j]))
                    item.setFlags( Qt.ItemIsSelectable |  Qt.ItemIsEnabled )
                    self.view.ui.Cart_CartTableInput.setItem(i,j,item)

        except Exception as err:

            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)

            msg.exec_()

    def selectProduct(self, row, column):
        #print("SELECTED PRODUCT ID " + self.view.ui.Wishlist_WishlistTableInput.item(row, 0))
        try:
            self.productviewController.setProduct(int(self.view.ui.Cart_CartTableInput.item(row, 0).text()))
            self.view.showProduct()
        except Exception as err:
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)
            msg.exec_()

    #def selectItem(self, item):
    #    print("SELECTED ROW: " + item.row())
        

    def removeProduct(self):
        #print(self.view.ui.Cart_CartTableInput.selectedItems()[0].text())

        row = self.view.ui.Cart_CartTableInput.selectedItems()[0].row()

        productID = int(self.view.ui.Cart_CartTableInput.item(row, 0).text())
        userID = self.model.connectedUser.id
        try:
            self.model.query(I.REMOVE_CART, (productID,userID))
            self.model.commit()
            self.refreshCart()
            
        except Exception as err:
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)
            msg.exec_()

    def buyProducts(self):
        for i in range(self.view.ui.Cart_CartTableInput.rowCount()):
            try:
                productID = int(self.view.ui.Cart_CartTableInput.item(i, 0).text())
                if productID != "":
                    self.model.query(I.PURCHASE_PRODUCTS, (productID, self.model.connectedUser.id))
                    self.model.query(I.REMOVE_CART, (productID, self.model.connectedUser.id))
                    self.model.commit()
            except Exception as err:
                msg = QtWidgets.QMessageBox()
                msg.setWindowTitle('ERROR')
                msg.setText(str(err))
                msg.setIcon(QtWidgets.QMessageBox.Critical)
                msg.exec_()
                
        self.refreshCart()
        msg = QtWidgets.QMessageBox()
        msg = QtWidgets.QMessageBox()
        msg.setWindowTitle("Success")
        msg.setText("Products purchased successfully")
        msg.exec_()
            
