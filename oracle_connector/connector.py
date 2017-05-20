import cx_Oracle


def get_db_connection():
    return cx_Oracle.connect('system', 'oracle', '//127.0.0.1:1521/xe.oracle.docker')
