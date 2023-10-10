from pprint import pprint
from DB_connect import connection
from random import randint

import sys
sys.stdout.reconfigure(encoding='utf-8')


select_to_table = """
    SELECT * FROM users WHERE id=%s;
"""

select = """
    SELECT id, name, age
    FROM users
    WHERE age > 99
    ORDER BY name
    LIMIT 100
"""

select_regux = """
    SELECT id, name, age
    FROM users
    WHERE name SIMILAR TO '%(Тим|тим)%'
    ORDER BY name
    LIMIT 100

"""

if __name__ == "__main__":
    with connection() as conn:
        c = conn.cursor()
        # c.execute(select_to_table, (111,))
        # print(c.fetchone())
        c.execute(select_to_table, (randint(1, 1000),))
        pprint(c.fetchall())
        c.close()