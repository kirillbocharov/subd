import cx_Oracle

from SUBD_Project.settings import MY_DATABASE


def get_db_connection():
   return cx_Oracle.connect('SYSTEM', 'iLsa4vyR8eaxM', 'localhost:1521/XE')
   # return cx_Oracle.connect('localhost:1521/XE')

print get_db_connection();
