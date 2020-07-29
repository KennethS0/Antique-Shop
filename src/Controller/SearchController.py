from ..model.Database import IConstants as I
from PyQt5 import QtWidgets
import re

class SearchController:
    '''
        Connects the login view to the model.
    '''
    def __init__(self, pView, pModel):
        print("e")
        self.view = pView
        self.model = pModel 
        
        # Data gathering
        self.categories = self.model.query(I.GET_CATEGORIES)
        

        # Loads initial data
        for category in self.categories:
            self.view.ui.Search_CategoryInput.addItem(category[1])

        self.view.ui.Search_CategoryInput.addItem('ANY')
        self.view.ui.Search_CategoryInput.setCurrentIndex(len(self.categories))

        self.view.ui.Search_PriceInput.addItem('50')
        self.view.ui.Search_PriceInput.addItem('100')
        self.view.ui.Search_PriceInput.addItem('200')
        self.view.ui.Search_PriceInput.addItem('300')
        self.view.ui.Search_PriceInput.addItem('500')
        self.view.ui.Search_PriceInput.addItem('1000')
        self.view.ui.Search_PriceInput.addItem('ANY')
        self.view.ui.Search_PriceInput.setCurrentIndex(6)

        self.view.ui.Search_SearchButton.clicked.connect(self.searchProduct)

        self.view.ui.Search_TableProductInput.setColumnCount(4)
        self.view.ui.Search_TableProductInput.setHorizontalHeaderLabels(['ID', 'Product', 'Price', 'Category'])

    def searchProduct(self):
        try:
            # GET PARAMETERS FROM INPUT
            category = str(self.view.ui.Search_CategoryInput.currentText())
            if category == 'ANY':
                category = ''
            price = str(self.view.ui.Search_PriceInput.currentText())
            keyword = self.view.ui.Search_ProducNametInput.text().strip()
        
            print("SEARCHING PRODUCT... CATEGORY: " + category + ", PRICE: " + price + ", KEYWORD: " + keyword)

            self.model.query(I.SET_CATEGORY_PARAM, [category])
            self.model.query(I.SET_PRICE_PARAM, [price])
            self.model.query(I.SET_KEYWORD_PARAM, [keyword])
            self.model.commit()

            # EXECUTES SEARCH PRODUCT QUERY
            products = self.model.query(I.PRODUCT_SEARCH)

            if products == []:
                print('No products match the search parameters!')
            else:
                self.view.ui.Search_TableProductInput.setRowCount(len(products))

            
            
        except:
            self.showError('ERROR', 'Fatal error')
            return



        
