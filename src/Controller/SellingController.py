from ..model.Database import IConstants as I
from PyQt5 import QtWidgets, QtGui
import re
import os
import binascii

class SellingController:

    #    Connects the login view to the model.
    def __init__(self, pView, pModel):
    
        #    Connects the database model to the view
        self.view = pView
        self.model = pModel

        self.categories = self.model.query(I.GET_CATEGORIES)
        self.shipments = self.model.query(I.GET_SHIPMENTS)

        for category in self.categories:
            self.view.ui.Selling_CategoryInput.addItem(category[1])
            
        for shipment in self.shipments:
            self.view.ui.Selling_ViaInput.addItem(shipment[1])

        self.view.ui.Selling_RegisterButton.clicked.connect(self.registerProduct)

    def registerProduct(self):
        # GET INFORMATION

        name = self.view.ui.Selling_NameInput.text().strip()

        description = str(self.view.ui.Selling_DescriptionInput.toPlainText())

        file = self.view.ui.Selling_PhotoInput.text().strip()
        file = "images\\" + file

        try:

            if not name or not description:
                raise Exception('Please add a name and a description to your item')

            category_id = self.categories[self.view.ui.Selling_CategoryInput.currentIndex()][0]
            shipment_id = self.shipments[self.view.ui.Selling_ViaInput.currentIndex()][0]

            price = self.view.ui.Selling_PriceInput.value()

            if price < 1:
                raise Exception('Price cannot be lower than 1')

            print("INSERTING PRODUCT: " + str(category_id) + ", " + str(shipment_id) + ", " +
                  str(self.model.connectedUser.id)+ ", " + name + ", " + str(price) + ", " + description
                  + ", PICTURE FILE: " + file)
            

            self.model.query(I.SELL_PRODUCT, (category_id, shipment_id, self.model.connectedUser.id,
                                              name, price, description))                

            if file != "images\\":
                #picture = self.convertToBinary(file)
                print("Inserting: " + file + "size: " + str(len(file)))
                self.model.query(I.INSERT_PICTURE, (file, self.model.connectedUser.id))

            self.model.commit()
            
            ##IMAGE DEBUG
            #msg = QtWidgets.QMessageBox()
            #msg.setWindowTitle("Success")
            #msg.setText("XD")
            #image = QtGui.QImage(file)
            #msg.setIconPixmap(QtGui.QPixmap(image))
            #msg.exec_()

            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle("Success")
            msg.setText("Product added successfully to the store")
            msg.exec_()


        except Exception as err:

            msg = QtWidgets.QMessageBox()
            msg.setWindowTitle('ERROR')
            msg.setText(str(err))
            msg.setIcon(QtWidgets.QMessageBox.Critical)

            msg.exec_()

    def showError(self, pTitle, pMessage):
        #    Shows a custom error message
        msg = QtWidgets.QMessageBox()
        msg.setWindowTitle(pTitle)
        msg.setText(pMessage)
        msg.setIcon(QtWidgets.QMessageBox.Critical)
        msg.exec_()

    #def convertToBinary(self,filename):
    #    #   Convert digital data to binary format
    #    with open(filename, 'rb') as file:
    #        binaryData = file.read()
    #    return binaryData


