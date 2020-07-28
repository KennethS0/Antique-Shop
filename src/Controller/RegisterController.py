from ..model.Database import IConstants as I
from PyQt5 import QtWidgets
from PyQt5.QtCore import QDate, QDateTime
from datetime import date
import re

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

        self.view.ui.Register_PhoneAreaInput.setReadOnly(True)

        # Data gathering
        self.countries = self.model.query(I.GET_COUNTRIES)
        self.nationalities = self.model.query(I.GET_NATIONALITIES)
        self.areacode = ()
        self.provinces = []
        self.cantons = []
        self.districts = []
        self.communities = []

        
        # Loads initial data
        for country in self.countries:
            self.view.ui.Register_CountryInput.addItem(country[1])

        for nationality in self.nationalities:
            self.view.ui.Register_NationalityInput.addItem(nationality[1])

        # Setting events
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

        self.view.ui.Register_CountryInput.activated.connect(self.setNumber)

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

        self.view.ui.Register_RegisterButton.clicked.connect(self.registerNewUser)


    def loadData(self, pClearCombos, pParentBox, pChildBox, pArray, pInstruction, pSave):
        '''
            Loads every data from a parent combobox to a child combo box.
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


    def setNumber(self):
        '''
            Sets the number corresponding to the 
            selected country
        '''
        countryName = self.view.ui.Register_CountryInput.currentText()
        countryId = [i for i in range(len(self.countries)) if self.countries[i][1] == countryName]
        
        countryCode = self.model.query(I.GET_AREACODE, (self.countries[countryId[0]][0],))
        
        self.areacode = countryCode

        if self.areacode:
            self.view.ui.Register_PhoneAreaInput.setText(str(self.areacode[0][1]))


    def registerNewUser(self):
        # Id Validation
        id = self.view.ui.Register_IDInput.text()
        if len(id) != 10:
            self.showError('Invalid ID', 'Invalid ID (Only numbers are accepted)')
            return

        # Id validation
        try:
            id = int(id)
        except:
            self.view.ui.Register_IDInput.clear()
            self.showError('Invalid ID', 'Invalid ID (Only numbers are accepted)')
            return

        # Phone number validation

        # Email validation
        regex = '^[a-z0-9.!#$%&\'*+\/=?^_`{|}~-]+@[a-z0-9-]+(?:\.[a-z0-9-]+)*$'
        email = self.view.ui.Register_EmailInput.text()

        if not re.search(regex, email):
            self.view.ui.Register_EmailInput.clear()
            self.showError('Invalid Email', 'Please type a valid email address.')
            return

        # Date verification
        birthDate = self.view.ui.Register_BirthDateInput.date().toPyDate()
        if birthDate > date.today() or 100 < abs((birthDate.year- date.today().year)):
            self.showError('Invalid Birthdate', 'Enter a valid date.')
            return

        # Password validation
        regex = '^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$' # One upper, one lower, 8 length
        password = self.view.ui.Register_PasswordInput.text().strip()
        confirmed = self.view.ui.Register_PasswordInput_2.text().strip()

        if  not ((password == confirmed) and re.search(regex, password)):
            print(password, confirmed)
            self.view.ui.Register_PasswordInput.clear()
            self.view.ui.Register_PasswordInput_2.clear()
            self.showError('Invalid Password', 'Invalid password, please try again.')
            return
        
        

        if name and registerLastName and userName:
            model.signUp(citizenId=int(id),
                   firstName='KENNETH',
                   secondName= '',
                   lastName= 'SANCHEZ',
                   secondLastName='OCAMPO',
                   email='kenneth.sanzchez0906',
                   date=datetime.now().date(),  
                   genderId=2,
                   nationalityId=44,
                   communityId=1010106,
                   username=userName,
                   password=password) 
        else:
            self.showError('Fill all input fields.', 'You missed something.')

    def showError(self, pTitle, pMessage):
        '''
            Shows a custom error message
        '''
        msg = QtWidgets.QMessageBox()
        msg.setWindowTitle(pTitle)
        msg.setText(pMessage)
        msg.setIcon(QtWidgets.QMessageBox.Critical)
        msg.exec_()
