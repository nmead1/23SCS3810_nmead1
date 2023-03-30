import psycopg2

params = {
    'host': 'localhost', 
    'port': 5432, 
    'dbname': 'hotels', 
    'user': 'hotel_manager',
    'password': '135791'
}

conn = psycopg2.connect(**params)
if conn: 
    print('Connection to Postgres database ' + params['dbname'] + ' was successful!')

    print('Bye!')
    cur = conn.cursor()
    sql = "INSERT INTO hotels (name, city, state) VALUES ('Broadmoor', 'Colorado Springs', 'CO');"
    cur.execute(sql)
    sql = 'SELECT * FROM hotels'
    cur.execute(sql)
    for row in cur.fetchall(): 
        print(row)
    conn.close()