from sqlite3 import connect, Error
from contextlib import contextmanager

@contextmanager
def connection():
    conn = None
    try:
        conn = connect("hw_06.db")
        yield conn
        conn.commit()
    except Error as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()