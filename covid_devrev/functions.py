def check_cred_user(cur,username,password):
    if password:
        query = "SELECT * FROM userdetails WHERE username = %s AND password = %s"
        values = (username, password)
        cur.execute(query, values)
        result = cur.fetchone()
        if result:
            return True
        else:
            return False
    else:
        query = "SELECT * FROM userdetails WHERE username = %s"
        values = (username,)
        cur.execute(query, values)
        result = cur.fetchone()
        if result:
            return True
        else:
            return False


def check_cred_admin(cur,username,password):
    query = "SELECT * FROM admindetails WHERE username = %s AND password = %s"
    values = (username, password)
    cur.execute(query, values)
    result = cur.fetchone()
    if result:
        return True
    else:
        return False


def check_valid(password,cnfpassword):
    if password==cnfpassword:
        return 0
    else:
        return 1


def add_user(cur,username,password,email):
    query="INSERT INTO userdetails values(%s,%s,%s)"
    values=(username,password,email)
    cur.execute(query,values)


def check_covid(cur,flino):
    query = "SELECT * FROM coviddetails WHERE covidno = %s"
    values = (flino,)
    cur.execute(query, values)
    result = cur.fetchone()
    if result:
        return True
    else:
        return False


def add_covid(cur,flino,date,time,st,dest):
    query="INSERT INTO coviddetails values(%s,%s,%s,%s,%s,60)"
    values=(flino,date,time,st,dest)
    cur.execute(query,values)


def del_covid(cur,flino):
    query="DELETE FROM coviddetails WHERE covidno= %s"
    values=(flino,)
    cur.execute(query,values)
    query="DELETE FROM bookings WHERE covidno= %s"
    values=(flino,)
    cur.execute(query,values)


def view_bookings(cur,covidno):
    cur.execute('SELECT username,covidno,date,time,destination from bookings natural join coviddetails where covidno = %s',(covidno,))
    rows = cur.fetchall()
    return rows


def search(cur,date,dept,dest,nos):
    query='SELECT * from coviddetails where date=%s and destination=%s and availableseats >= %s'
    values=(date,dept,dest,nos)
    cur.execute(query,values)
    rows=cur.fetchall()
    return rows


def book_seats(cur,username,covidno,nos):
    query="INSERT INTO bookings values(%s,%s)"
    values=(username,covidno)
    for i in range(int(nos)):
        cur.execute(query,values)


def my_bookings(cur,uname):
    cur.execute('SELECT covidno,date,time,destination from bookings natural join coviddetails where username = %s',(uname,))
    rows=cur.fetchall()
    return rows