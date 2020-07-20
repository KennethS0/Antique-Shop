import csv

# Reads a .csv file and returns its reader
def read_csv(pFile):
    with open(pFile, "r", encoding='utf-8') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        info = []

        for row in csv_reader:
            info.append(row)

        return info[1:]


# Generates a .sql file with the specific inserts
def generateInsert(pFileName, pTable, pColumns, pValues):
    
    file = open(pFileName, 'a', encoding='utf-8')

    columns= ', '.join(pColumns)

    file.write("INSERT ALL\n")

    for row in pValues:
        values = ', '.join(row)
        string = ' ' * 3 + 'INTO {}({}) VALUES ({})'.format(pTable, columns, values) + '\n'
        file.write(string)

    file.write('SELECT * FROM DUAL;')
    file.close()
