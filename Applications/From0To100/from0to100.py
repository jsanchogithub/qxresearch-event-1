###############################################################################################
# S1 - --- - Wellcome
# S1 - 001 - Wellcome
###############################################################################################
# S2 - --- - Intro
# S2 - 002 - Install Python 3
# S2 - 003 - Install PyCharm
# S2 - 004 - Some advices
# S2 - 005 - Python 'characteristics'

"""
from PyPDF4 import PdfFileMerger
import os 
#var = os.getcwd() For extracting from enother folder
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
# Modify the XML
for person in root.findall('person'):
    age = person.find('age')
    new_age = int(age.text) + 5
    age.text = str(new_age)

# Write the modified XML to a new file
tree.write('modified_data.xml')
"""

print('XML processing completed. Modified data written to "modified_data.xml".')
