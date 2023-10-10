from faker import Faker
from random import randint

from DB_connect import connection

fake = Faker("uk_UA")
insert_to_user = """
INSERT INTO users(name, email, password, age) VALUES (%s, %s, %s, %s);
"""


if __name__ == "__main__":
    with connection() as conn:
        c = conn.cursor()
        for _ in range(1000):
            c.execute(insert_to_user, (fake.name(), fake.email(), fake.password(), randint(1, 129)))
        c.close()