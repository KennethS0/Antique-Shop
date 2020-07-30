from PyQt5.QtChart import QChart, QChartView, QPieSeries, QPieSlice, QLegend
from PyQt5.Qt import QVBoxLayout
from ..model.Database import IConstants as I

class StatisticsController:
    '''
        Class responsible of changing letting the user
        visualize the data saved in the database through
        a graph.
    '''

    def __init__(self, pView, pModel):
        '''
            Initializes the chart
        '''
        self.model = pModel
        self.view = pView 

        self.queries = {
            'Products by category': I.PRODUCTS_BY_CATEGORY,
            'Sellers by gender': I.SELLERS_BY_GENDER,
            'Sellers by age': I.SELLERS_BY_AGE,
            'Total sales by gender': I.SALES_BY_GENDER,
            'Total sales profit by gender': I.PROFITS_BY_GENDER
        }

        # Loads every admin statistic
        for key in self.queries:
            self.view.ui.Statistics_StatisticsInput.addItem(key)

        self.view.ui.Statistics_ShowButton.clicked.connect(self.loadQuery)

        # Sets up the chart
        self.chart = QChart()

        # Embeds the chart in the application
        layout = QVBoxLayout()

        chartView = QChartView(self.chart)

        layout.addWidget(chartView)
        chartView.show()

        self.view.ui.Statistics_StatisticsWidget.setLayout(layout)


    def loadQuery(self):
        '''
            loads a query and its information
        '''
        queryName = self.view.ui.Statistics_StatisticsInput.currentText()
        query = self.queries[queryName]

        result = self.model.query(query)

        self.loadChart(queryName, result)


    def loadChart(self, pTitle, pData):
        '''
            Loads a chart and embeds it in the application
        '''
        
        # Creates the chart
        self.chart.setTitle(pTitle)
        self.chart.removeAllSeries()
        
        # Creates the slices
        series = QPieSeries(self.chart)
        for i in range(len(pData)):
            slice = series.append('{} | {} | {}%'.format(str(pData[i][0]), str(pData[i][1]), str(pData[i][2])), pData[i][2])
            slice.setLabelVisible(True)
        
        self.chart.addSeries(series)