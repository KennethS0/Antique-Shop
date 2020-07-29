from PyQt5.QtChart import QChart, QChartView, QPieSeries, QPieSlice, QLegend
from PyQt5.Qt import QVBoxLayout

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

        # Loads every admin statistic
        self.view.ui.
        

    def loadChart(self, pTitle, pData):
        '''
            Loads a chart and embeds it in the application
        '''
        # Creates the chart
        chart = QChart()
        chart.setTitle(pTitle)

        # Creates the slices
        series = QPieSeries(chart)
        
        for name, value in pData:
            slice = series.append(name, value)
            slice.setLabelVisible(True)

        chart.addSeries(series)
        chart.createDefaultAxes()

        # Embeds the chart in the application
        layout = QVBoxLayout()

        chartView = QChartView(chart)

        layout.addWidget(chartView)
        chartView.show()

        self.view.ui.Statistics_StatisticsWidget.setLayout(layout)