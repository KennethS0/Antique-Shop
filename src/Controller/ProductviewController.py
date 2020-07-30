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
        try:
            self.product = self.model.query(I.GET_PRODUCT, [productid])
            print(self.product)
            #print("ProductviewController: PRODUCT SET: " + str(productid))
            self.view.ui.Product_NameDisplay.setText(str(self.product[0][1]))
            

        except Exception as err:

            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)

            msg.exec_()
