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


    def setProduct(self,productid): # configures the display of the specified product
        self.product = self.model.query(I.GET_PRODUCT, [productid])

        self.view.ui.Product_NameDisplay.setText(product[1])
