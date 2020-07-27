from ..model.Database import IConstants as I

class RegisterController:
    '''
        Connects the login view to the model.
    '''

    def __init__(self, pView, pModel):
        '''
            Connects the databse model to the view
        '''
        self.view = pView
        self.model = pModel

        # Sets the events
        self.view.ui.Register_RegisterButton.clicked.connect(self.registerNewUser)

        self.countries = self.model.query(I.GET_COUNTRIES)
        self.provinces = []
        self.cantons = []
        self.districts = []
        self.communities = []

        for country in self.countries:
            self.view.ui.Register_CountryInput.addItem(country[1])

        self.view.ui.Register_CountryInput.activated.connect(
            lambda: self.loadData([self.view.ui.Register_ProvinceInput,
                                   self.view.ui.Register_CantonInput,
                                   self.view.ui.Register_DistrictInput,
                                   self.view.ui.Register_CommunityInput],
                                   self.view.ui.Register_CountryInput,
                                   self.view.ui.Register_ProvinceInput,
                                   self.countries,
                                   I.GET_PROVINCES,
                                   self.provinces))

        self.view.ui.Register_ProvinceInput.activated.connect(
            lambda: self.loadData([self.view.ui.Register_CantonInput,
                                   self.view.ui.Register_DistrictInput,
                                   self.view.ui.Register_CommunityInput],
                                   self.view.ui.Register_ProvinceInput,
                                   self.view.ui.Register_CantonInput,
                                   self.provinces,
                                   I.GET_CANTONS,
                                   self.cantons))


        self.view.ui.Register_CantonInput.activated.connect(
            lambda: self.loadData([self.view.ui.Register_DistrictInput,
                                   self.view.ui.Register_CommunityInput],
                                   self.view.ui.Register_CantonInput,
                                   self.view.ui.Register_DistrictInput,
                                   self.cantons,
                                   I.GET_DISTRICTS,
                                   self.districts))

        self.view.ui.Register_DistrictInput.activated.connect(
            lambda: self.loadData([self.view.ui.Register_CommunityInput],
                                   self.view.ui.Register_DistrictInput,
                                   self.view.ui.Register_CommunityInput,
                                   self.districts,
                                   I.GET_COMMUNITIES,
                                   self.communities))

        # self.view.ui.Register_

    def loadData(self, pClearCombos, pParentBox, pChildBox, pArray, pInstruction, pSave):
        '''
            Loads every community form the selected district.
        '''
        pSave.clear()
        for combo in pClearCombos:
            combo.clear()

        dataName = pParentBox.currentText()
        dataId = [i for i in range(len(pArray)) if pArray[i][1] == dataName]

        queriedData = self.model.query(pInstruction, (pArray[dataId[0]][0],))

        for result in queriedData:
            pChildBox.addItem(result[1])
        
        pSave += queriedData
        


    def registerNewUser(self):
        id = self.view.ui.Register_IDInput.text()
        try:
            id = int(id)
        except Exception as err:
            print(str(err))
            self.showError('Invalid ID', err)




    def showError(self, pTitle, pMessage):
        msg = QtWidgets.QMessageBox()
        msg.setWindowTitle(pTitle)
        msg.setText(pMessage)
        msg.setIcon(QtWidgets.QMessageBox.Critical)
        msg.exec_()
