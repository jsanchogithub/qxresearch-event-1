###############################################################################################
# S1 - --- - Wellcome
# S1 - 001 - Wellcome
###############################################################################################
# S2 - --- - Intro
# S2 - 002 - Install Python 3
# S2 - 003 - Install PyCharm
# S2 - 004 - Some advices
# S2 - 005 - Python 'characteristics'
# S2 - 006 - 'Hello World' with Pyton  (007 & 008) is the same
###############################################################################################
# S3 - --- - Variables
# S3 - 009 - Variables in Python
# S3 - 010 - Variables in Python - 2
# S3 - 011 - Memory addresses and Variables in Python (012 & 013)
###############################################################################################
# S4 - --- - Datatypes
# S4 - 014 - Datatypes in Python
# S4 - 015 - Summary of Datatypes in Python
# S4 - 016 - String processing
# S4 - 017 - String processing - 2
# S4 - 018 - Boolean types
# S4 - 019 - User entry processing (input)
# S4 - 020 - User entry processing (input) - 2 (021 & 022 & 023 & 024)
###############################################################################################
# S5 - --- - Operators
# S5 - 025 - Operators in Python (026 & 027 & 028)
# S5 - 029 - Assignment operators
# S5 - 030 - Comparison operators
# S5 - 031 - even (par) and odd numbers (even)


###############################################################################################
""""""
print('S2 - 006 - "Hello World" with Pyton')
print("Hello World")
# remember:
# - Missing parentheses in call to 'print'.
# - In execution you can see Python.exe path (venv o this case).
""""""
###############################################################################################
""""""
print('S3 - 009 - Variables in Python')
myVar = "Hello World"
print(myVar)
# remember:
# - There's no need of declare vars types. Anytime, we can change the type.
# - no space required to pass the parameters
# - Respect uppercase & lowercase
""""""
###############################################################################################
print('S3 - 010 - Variables in Python - 2')
x = 1
y = 2
z = x + y
print(z)
###############################################################################################
print('S3 - 011 - Memory addresses and Variables in Python')
print(id(x))
# remember:
# - Memory addresses change in every execution
###############################################################################################
print('S4 - 014 - Datatypes in Python')
print(type(x))
###############################################################################################
print('S4 - 015 - Summary of Datatypes in Python')
x = 10
print(type(x))  # int
x = 10.5
print(type(x))  # float
x = "Hello"
print(type(x))  # str
x = True
print(type(x))  # bool
###############################################################################################
print('S4 - 016 - String processing')
vCountry1p = "Azerbaijão"
vCountry1e = "Azerbaijan"
vCapital1p = "Baku"
vCapital1e = "Baku"
vCountry2e = "Armenia"
vCapital2e = "Erevan"
print("Armenia's Capital is "+vCapital2e)  # concatenation
print("Armenia's Capital is ""Erevan")  # concatenation
###############################################################################################
print('# S4 - 017 - String processing - 2')
print("Armenia's Capital is", vCapital2e)  # concatenation 2
# whitespace after ' . It adds whitespace between the arguments
# Sobrecarga de operadores: + adds two numbers, or concats two strings.
# cast
print("Addition:", int("1")+int("2"))
# https://peps.python.org/pep-0008/
###############################################################################################
print('S4 - 018 - Boolean types')
# myBool = True
# print(myBool)
myBool = 3 < 2
print(myBool)
if myBool:
    print(myBool)   # indentation marks the if block
else:
    print("It is False!")   # indentation marks the if block

print("End...")
###############################################################################################
print('S4 - 019 - User entry processing - Input function')
if False:
    result = input("Enter Capital name: ")
    print(result)
###############################################################################################
print('S4 - 020 - User entry processing (input) - 2')
if False:
    n1 = int(input("n1: "))
    n2 = int(input("n2: "))
    print(n1+n2)
###############################################################################################
print('S5 - 025 - Operators in Python')
# +, -, /, *, Integer div //, Exponentiation **, Modulo/Remainder %
# string interpolation (interpolacion): replace variables ins a string
varA = 3
varB = 2
resD = 3 / 2
resDint = 3 // 2
resM = 3 % 2
print(f'resD = {resD}')
print(f'resDint = {resDint}')
print(f'resM = {resM}')
###############################################################################################
print('S5 - 029 - Assignment operators')
x = 5
x += 1
print(x)
x /= 2
print(x)
###############################################################################################
print('S5 - 030 - Comparison operators')
a = 4
b = 2
result = a == b   # first evaluate right side
print(f'result == {result}')
result = a >= b   # first evaluate right side
print(f'result == {result}')
###############################################################################################
print('S5 - 031 - even (par) and odd numbers (even)')



"""
from PyPDF4 import PdfFileMerger
import os 
#var = os.getcwd() For extracting from another folder
merger = PdfFileMerger()
for items in os.listdir():
  if items.endswith('.pdf'):
    merger.append(items)
merger.write("Final_pdf4.pdf")
merger.close()
#
for items in os.listdir():
  if items != ( 'Final_pdf4.pdf') and items.endswith('.pdf'):
    os.remove(items)
"""
"""
import xml.etree.ElementTree as ET

# Load the XML file
tree = ET.parse('FAT0087R.xml')
root = tree.getroot()

# Access elements and their values
for person in root.findall('userParameter'):
    name = person.find('name').text
    age = person.find('datatype').text
    print(f'Name: {name}, Age: {age}')
"""
"""
# Modify the XML
for person in root.findall('person'):
    age = person.find('age')
    new_age = int(age.text) + 5
    age.text = str(new_age)

# Write the modified XML to a new file
tree.write('modified_data.xml')
"""

# print('XML processing completed. Modified data written to "modified_data.xml".')
