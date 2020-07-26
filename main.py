from src.Controller.LogInController import LoginController
from src.view.App import MainWindow
from src.model.Database import Database as dbm

if __name__ == '__main__':
    # try:
    #     # db.signUp(citizenId=1178709336,
    #     #            firstName='KENNETH',
    #     #            secondName= '',
    #     #            lastName= 'SANCHEZ',
    #     #            secondLastName='OCAMPO',
    #     #            email='kenneth.sanzchez0906',
    #     #            date=datetime.now().date(),  
    #     #            genderId=2,
    #     #            nationalityId=44,
    #     #            communityId=1010106,
    #     #            username='kenneths01',
    #     #            password='Passwordxd')

    #     db.logIn('KennethS0', 'Passwordxd')
    #     db.revokeAdmin('KennethS01')

    # except Exception as err:
    #     print(err)           
    model = dbm.Database.getInstance()
    LoginController(model)