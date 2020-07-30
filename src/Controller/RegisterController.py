from ..model.Database import IConstants as I
from PyQt5 import QtWidgets
import re
from datetime import date

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
        self.phoneTypes = self.model.query(I.GET_PHONE_TYPES)
        self.genders = self.model.query(I.GET_GENDERS)

        # Loads initial data
        for country in self.countries:
            self.view.ui.Register_CountryInput.addItem(country[1])

        for nationality in self.nationalities:
            self.view.ui.Register_NationalityInput.addItem(nationality[1])

        for phoneType in self.phoneTypes:
            self.view.ui.Register_PhoneTypeInput.addItem(phoneType[1])

        for gender in self.genders:
            self.view.ui.Register_GenderInput.addItem(gender[1])

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

        self.view.ui.Register_CancelButton.clicked.connect(self.clearAll)

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
        try: 
            id = self.view.ui.Register_IDInput.text()

            # Number validation
            if len(id) != 9:
                self.view.ui.Register_IDInput.clear()
                self.showError('Invalid ID', 'Please put a valid id (10 digits long)')
                return
            
            try:
                id = int(id)
            except:
                self.view.ui.Register_IDInput.clear()
                self.showError('Invalid ID', 'Invalid ID (Only numbers are accepted)')
                return

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
            confirmed = self.view.ui.Register_ConfirmPasswordInput.text().strip()

            if  not ((password == confirmed) and re.search(regex, password)):
                self.view.ui.Register_PasswordInput.clear()
                self.view.ui.Register_ConfirmPasswordInput.clear()
                self.showError('Invalid Password', 'Invalid password, please try again.')
                return

            # Phone Number validation
            phone = self.view.ui.Register_PhoneInput.text().strip()

            if len(phone) != 8:
                self.showError('Invalid Number', 'Please enter a valid phone number')
                return

            try:
                phone = int(phone)
            except:
                self.view.ui.Register_IDInput.clear()
                self.showError('Invalid ID', 'Invalid ID (Only numbers are accepted)')
                return

            # Usernames
            usernameInput = self.view.ui.Register_UsernameInput.text().strip()

            firstNameIn = self.view.ui.Register_FirstnameInput.text().strip()
            secondNameIn = self.view.ui.Register_SecondnameInput.text().strip()
            lastNameIn = self.view.ui.Register_LastnameInput.text().strip()
            secondLastNameIn = self.view.ui.Register_SecondlastnameInput.text().strip()

            # Name validation 
            if re.search(r'\d', firstNameIn) or re.search(r'\d', secondNameIn) or re.search(r'\d', lastNameIn) or re.search(r'\d', secondLastNameIn):
                self.showError('Invalid Name', 'Names cant have numbers.')
                return

            if not usernameInput or not firstNameIn or not lastNameIn:
                self.showError('Empty fields detected', 'Make sure you have a username, a first name and a last name')
                return
            elif len(usernameInput) < 5:
                self.showError('Username is too short', 'Try a longer username')

            # Checks if number exists and if it is a mobile number (has to be unique)
            countryName = self.view.ui.Register_CountryInput.currentText()
            provinceName = self.view.ui.Register_ProvinceInput.currentText()
            cantonName = self.view.ui.Register_CantonInput.currentText()
            districtName = self.view.ui.Register_DistrictInput.currentText()
            communityName = self.view.ui.Register_CommunityInput.currentText()
            communityId = self.model.query(I.GET_COMMUNITY_ID, (countryName,
                                                                provinceName,
                                                                cantonName,
                                                                districtName,
                                                                communityName))

            nationalityName = self.view.ui.Register_NationalityInput.currentText()
            nationalityId = self.model.query(I.GET_NATIONALITY_ID, (nationalityName, ))

            genderName = self.view.ui.Register_GenderInput.currentText()
            genderId = self.model.query(I.GET_GENDER_ID, (genderName,))

            phoneTypeName = self.view.ui.Register_PhoneTypeInput.currentText()
            phoneTypeId = self.model.query(I.GET_PHONE_TYPE_ID, (phoneTypeName, ))



            if self.view.ui.Register_PhoneTypeInput.currentText().upper() == 'MOBILE':
                unique = self.model.query(I.CHECK_UNIQUE_MOBILE, (self.areacode[0][0], phone))
                if unique:
                    self.showError('Phone already registered.', 'Try with another phone number.')
                    return
                    
            # Insertion of person and useraccount
            self.model.signUp(citizenId=int(id),
                       firstName=firstNameIn,
                       secondName=secondNameIn,
                       lastName=lastNameIn,
                       secondLastName=secondLastNameIn,
                       email=email,
                       date=birthDate,  
                       genderId=genderId[0][0],
                       nationalityId=nationalityId[0][0],
                       communityId=communityId[0][0],
                       username=usernameInput,
                       password=password,
                       phonenumber=phone,
                       phonetype=phoneTypeId[0][0],
                       areacode=self.areacode[0][0])

            self.model.commit()
            # Clears all the information that was inside
            self.clearAll()

            # Changes view to login
            self.view.showLogin()

        except Exception as err:
            print(err)

    def showError(self, pTitle, pMessage):
        '''
            Shows a custom error message
        '''
        msg = QtWidgets.QMessageBox()
        msg.setWindowTitle(pTitle)
        msg.setText(pMessage)
        msg.setIcon(QtWidgets.QMessageBox.Critical)
        msg.exec_()


    def clearAll(self):
        '''
            Clears all the information that was given as input
        '''
        self.view.ui.Register_IDInput.clear()
        self.view.ui.Register_EmailInput.clear()
        self.view.ui.Register_PhoneInput.clear()
        self.view.ui.Register_FirstnameInput.clear()
        self.view.ui.Register_SecondnameInput.clear()
        self.view.ui.Register_LastnameInput.clear()
        self.view.ui.Register_SecondlastnameInput.clear()
        self.view.ui.Register_UsernameInput.clear()
        self.view.ui.Register_PasswordInput.clear()
        self.view.ui.Register_ConfirmPasswordInput.clear()
        self.view.showLogin()
