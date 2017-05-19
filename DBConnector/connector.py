import cx_Oracle

from SUBD_Project.settings import MY_DATABASE


def get_db_connection():
   return cx_Oracle.connect('system', 'oracle', '//192.168.99.100:32769/xe.oracle.docker')
   # return cx_Oracle.connect('localhost:1521/XE')

print get_db_connection()
