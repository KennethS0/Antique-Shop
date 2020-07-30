from ..model.Database import IConstants as I
from PyQt5 import QtWidgets, QtGui
import re
import os

class ProductviewController:
    #    Connects the login view to the model.
    def __init__(self, pView, pModel):

        #    Connects the database model to the view
        self.view = pView
        self.model = pModel


    def setProduct(self, productid): # configures the display of the specified product
        self.productid = productid
        try:
            self.product = self.model.query(I.GET_PRODUCT, [self.productid])
            print(self.product)
            #print("ProductviewController: PRODUCT SET: " + str(productid))

            #self.view.ui.Product_NameLabel.setText("")
            
            self.view.ui.Product_NameDisplay.setText(str(self.product[0][1]))
            self.view.ui.Product_ViaDisplay.setText(str(self.product[0][2]))
            self.view.ui.Product_SellerDisplay.setText(str(self.product[0][3]))
            self.view.ui.Product_PriceDisplay.setText(str(self.product[0][4]) + " $")

            self.image = QtGui.QPixmap(str(self.product[0][5]))
            self.view.ui.Product_PhotoDisplay.setPixmap(self.image)

            self.view.ui.Product_DescriptionDisplay.setWordWrap(True)
            self.view.ui.Product_DescriptionDisplay.setText(str(self.product[0][6]))

            self.view.ui.Product_AddCartButton.clicked.connect(self.addToCart)
            self.view.ui.Product_AddWishlistButton.clicked.connect(self.addToWishlist)

        except Exception as err:

            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)

            msg.exec_()

    def addToCart(self):
        # ADDS THE PRODUCT TO THE USER'S CART
        try:
            self.model.query(I.ADD_CART, (self.productid, self.model.connectedUser.id))
            self.model.commit()
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle("Success")
            msg.setText("Product added to cart")
            msg.exec_()

        except Exception as err:
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('An error occurred')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)
            msg.exec_()

    def addToWishlist(self):
        # ADDS THE PRODUCT TO THE USER'S CART
        try:
            self.model.query(I.ADD_WISHLIST, (self.productid, self.model.connectedUser.id))
            self.model.commit()
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle("Success")
            msg.setText("Product added to wishlist")
            msg.exec_()

        except Exception as err:
            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('An error occurred')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)
            msg.exec_()

