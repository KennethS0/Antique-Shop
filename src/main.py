import model.Database.Database as dbm
from datetime import datetime

if __name__ == '__main__':
    db = dbm.Database.getInstance()
    
    db.connect('ge', 'ge', 'localhost', 'ge')

    cursor = db.connection.cursor()

    try:
        # db.signUp(citizenId=117870936,
        #            firstName='KENNETH',
        #            secondName= '',
        #            lastName= 'SANCHEZ',
        #            secondLastName='OCAMPO',
        #            email='kenneth.sanchez0906',
        #            date=datetime.now().date(),  
        #            genderId=2,
        #            nationalityId=44,
        #            communityId=1010106,
        #            username='kenneths0',
        #            password='Passwordxd')

        cursor.callproc('LogIn_User', ('KENNETHS0', 'Passwordxd'))

        for i in cursor:
            print(i)

    except Exception as err:
        print(err)           