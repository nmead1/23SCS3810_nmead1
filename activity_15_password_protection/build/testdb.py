import psycopg2
import configparser as cp

config = cp.RawConfigParser()
config.read('ConfigFile.properties')
params = dict(config.items('db'))

conn = psycopg2.connect(**params)
if conn: 
    print('Connection to Postgres database ' + params['dbname'] + ' was successful!')

    print('Bye!')
    cur = conn.cursor()
    sql = 'SELECT id, name FROM employees'
    cur.execute(sql)
    for row in cur.fetchall(): 
        print(row)
    conn.close()