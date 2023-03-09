p10_series=['PIC10F200', 'PIC10F202', 'PIC10F204', 'PIC10F206', 'PIC10F220', 'PIC10F222']

p12C_series = ['PIC12C508', 'PIC12C508A', 'PIC12C509', 'PIC12C509A', 'PIC12C671', 'PIC12C672', 'PIC12CE518', 'PIC12CE519', 'PIC12CE673', 'PIC12CE674']



p12F_series= ['PIC12F508', 'PIC12F509', 'PIC12F629', 'PIC12F635', 'PIC12F675', 'PIC12F683']

p16C_series=   \
['PIC16C505', 'PIC16C554', 'PIC16C558', 'PIC16C61', 'PIC16C62', 'PIC16C62A', 'PIC16C62B', 'PIC16C63', 'PIC16C63A', 'PIC16C64', 'PIC16C64A', 'PIC16C65', 'PIC16C65A', 'PIC16C65B', 'PIC16C66', 'PIC16C66A', 'PIC16C67', 'PIC16C620', 'PIC16C620A', 'PIC16C621', 'PIC16C621A', 'PIC16C622', 'PIC16C622A', 'PIC16C71', 'PIC16C71A', 'PIC16C72', 'PIC16C72A', 'PIC16C73', 'PIC16C73A', 'PIC16C73B', 'PIC16C74', 'PIC16C74A', 'PIC16C74B', 'PIC16C76', 'PIC16C77', 'PIC16C710', 'PIC16C711', 'PIC16C712', 'PIC16C716', 'PIC16C745', 'PIC16C765', 'PIC16C773', 'PIC16C774', 'PIC16C83', 'PIC16C84']

p16F_series=  \
['PIC16F505', 'PIC16F506', 'PIC16F54', 'PIC16F57', 'PIC16F59', 'PIC16F627', 'PIC16LF627A', 'PIC16F627A', 'PIC16F628', 'PIC16LF628A', 'PIC16F628A', 'PIC16F630', 'PIC16F631', 'PIC16F631-1', 'PIC16F636', 'PIC16F636-1', 'PIC16F639', 'PIC16F639-1', 'PIC16F648A', 'PIC16F676', 'PIC16F677', 'PIC16F677-1', 'PIC16F684', 'PIC16F685', 'PIC16F685-1', 'PIC16F687', 'PIC16F687-1', 'PIC16F688', 'PIC16F689', 'PIC16F689-1', 'PIC16F690', 'PIC16F690-1', 'PIC16F716', 'PIC16F72', 'PIC16F73', 'PIC16F74', 'PIC16F76', 'PIC16F77', 'PIC16F737', 'PIC16F747', 'PIC16F767', 'PIC16F777', 'PIC16F83', 'PIC16F84', 'PIC16F84A', 'PIC16F87', 'PIC16F88', 'PIC16F818', 'PIC16F819', 'PIC16F870', 'PIC16F871', 'PIC16F872', 'PIC16F873', 'PIC16F873A', 'PIC16LF873A', 'PIC16F874', 'PIC16F874A', 'PIC16F876', 'PIC16F876A', 'PIC16F877', 'PIC16F877A']


p18_series =    \
['PIC18F242', 'PIC18F248', 'PIC18F252', 'PIC18F258', 'PIC18F442', 'PIC18F448', 'PIC18F452', 'PIC18F458', 'PIC18F1220', 'PIC18F1320', 'PIC18F2220', 'PIC18F2320', 'PIC18F2321', 'PIC18F4210', 'PIC18F2331', 'PIC18F2450', 'PIC18F2455', 'PIC18F2480', 'PIC18F2510', 'PIC18F2515', 'PIC18F2520', 'PIC18F2550', 'PIC18F4550','PIC18F2580', 'PIC18F2585', 'PIC18F2610', 'PIC18F2620', 'PIC18F2680', 'PIC18F4220', 'PIC18F4320', 'PIC18F6525', 'PIC18F6621', 'PIC18F8525', 'PIC18F8621', 'PIC18F2331', 'PIC18F2431', 'PIC18F4331', 'PIC18F4431', 'PIC18F2455', 'PIC18F2550', 'PIC18F4455', 'PIC18F4580', 'PIC18F2580', 'PIC18F2420', 'PIC18F2520', 'PIC18F2620', 'PIC18F6520', 'PIC18F6620', 'PIC18F6720', 'PIC18F6585', 'PIC18F6680', 'PIC18F8585', 'PIC18F8680']

while(1):
    print("Which series you want to search for? (10, 12C, 12F, 16C, 16C or 18F)")
    series=input().upper()
    if series not in ('10, 12F,12C, 16C, 16F or 18F'):
        print('Invalid series try again \n \n ')
        continue
    elif series =='C': break
    print("Enter the part number of the microcontroller:")
    part_number=input().upper()
    micro='PIC'+series+part_number
    print('\n')
    if series=='10':
        if micro in p10_series: print("{} is supported".format(micro))
        else: print("Not supported")
    elif series=='12F':
        if micro in p12F_series: print("{} is supported".format(micro))
        else: print("Not supported")
    elif series=='12C':
        if micro in p12C_series: print("{} is supported".format(micro))
        else: print("Not supported")
    elif series=='16F':
        if micro in p16F_series: print("{} is supported".format(micro))
        else: print("Not supported")
    elif series=='18F':
        if micro in p18_series: print("{} is supported".format(micro))
        else: print("Not supported")

    print('\n \n "New search" \n \n')
