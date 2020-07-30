from ..model.Database import IConstants as I
from PyQt5 import QtWidgets

class QueriesController:

    def __init__(self, pView, pModel):

        self.view = pView
        self.model = pModel

        # Defining the data
        self.queries = {
            'Sold Products': [I.PRODUCTS_SOLD, ['ID', 'Product', 'Buyer', 'Price', 'Date Bought']],
            'Purchases by category': [I.PURCHASE_BY_CATEGORY,  ['ID', 'Product', 'Buyer', 'Country', 'Price', 'Date Bought']]
        }

        if self.model.connectedUser.isAdmin:
            # self.queries[]
            pass

        for query in self.queries:
            self.view.ui.Queries_QueriesInput.addItem(query)

        self.view.ui.Queries_QueriesInput.activated.connect(self.changeHeaders)
        self.view.ui.Queries_ShowButton.clicked.connect(self.loadQuery)

    def changeHeaders(self):
        '''
             Changes the headers of the queries.
        '''
        # Obtains the query data
        self.view.ui.Queries_QueriesTableDisplay.clear()
        queryName = self.view.ui.Queries_QueriesInput.currentText()
        queryData = self.queries[queryName]

        # Sets the headers accordingly
        self.view.ui.Queries_QueriesTableDisplay.setColumnCount(len(queryData[1]))
        self.view.ui.Queries_QueriesTableDisplay.setHorizontalHeaderLabels(queryData[1])

    
    def loadQuery(self):
        '''
            Loads the information obtained from the query into the table
        '''
        queryName = self.view.ui.Queries_QueriesInput.currentText()
        queryData = self.queries[queryName]

        results = self.model.query(queryData[0])

        # Loads queried data
        for i in range(len(results)):
            for j in range(queryData[1]):
                item = QtWidgets.QTableWidgetItem(str(products[i][j]))
                self.view.ui.Search_TableProductInput.setItem(i, j, item)
