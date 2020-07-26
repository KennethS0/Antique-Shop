import model.Database.Database as dbm
from datetime import datetime

if __name__ == '__main__':
    db = dbm.Database.getInstance()
    
    db.connect('ge', 'ge', 'localhost', 'ge')

    cursor = db.connection.cursor()

    try:
        # db.signUp(citizenId=1178709336,
        #            firstName='KENNETH',
        #            secondName= '',
        #            lastName= 'SANCHEZ',
        #            secondLastName='OCAMPO',
        #            email='kenneth.sanzchez0906',
        #            date=datetime.now().date(),  
        #            genderId=2,
        #            nationalityId=44,
        #            communityId=1010106,
        #            username='kenneths01',
        #            password='Passwordxd')

        db.logIn('KennethS0', 'Passwordxd')
        db.revokeAdmin('KennethS01')

        

    except Exception as err:
        print(err)           