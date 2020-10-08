infile1 = "mytree.ged"
infile2 = "tree.pl"

ged = open(infile1, "r", encoding="utf_8_sig")
prolog = open(infile2, 'w')
gedcom = ged.readlines()
ged.close()
#persons
persons = []
id = ""
name = ""
surname = ""
for line in gedcom:
    word = line.split(' ')
    if id == '':
        if (len(word) > 2 and word[2] == "INDI\n"): # если такая строчка - 0 @I500001@ INDI
            id = word[1] # тогда @I500001@ - id
    else:
        if (name != '' and surname != ''): # если все нашли, добавляем в persons и идем искать следующего
            persons.append([id, name+"_"+surname])
            id = ""
            name = ""
            surname = ""
        else: # пишем имя с фамилией
            if word[1] == "GIVN":
                name = word[2][:-1].lower().replace("'", "")
            if word[1] == "SURN":
                surname = word[2][:-1].lower()
            if word[1] == "_MARNM":
                surname = word[2][:-1].lower()
#get name by id
def getname(id):
    for person in persons:
        if person[0] == id:
            return person[1]
# раскидываем аналогично на семьи
fams = []
husb = ""
wife = ""
chil = []
for line in gedcom:
    word = line.split(' ')
    if word[1] == "HUSB":
        husb = word[2][:-1]
    if word[1] == "WIFE":
        wife = word[2][:-1]
    if word[1] == "CHIL":
        chil.append(word[2][:-1])
    if (len(word) > 2 and word[2] == "FAM\n" and (husb != '' or wife != '')):
        fams.append([husb, wife, chil])
        husb = ''
        wife = ''
        chil = []
#write to file
prolog.write("%fathers\n")
fam = []
for fam in fams:
    if fam[0] != '':
        for child in fam[2]:
            prolog.write("father(" + str(getname(fam[0])) + ", " + str(getname(child)) + ").\n")
prolog.write("%mothers\n")
for fam in fams:
    if fam[1] != '':
        for child in fam[2]:
            prolog.write("mother(" + str(getname(fam[1])) + ", " + str(getname(child)) + ").\n")
prolog.close()