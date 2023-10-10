from faker import Faker
from DB_connect import connection

fake = Faker("uk_UA")
update_to_table = """
    UPDATE users SET phone_number = %s WHERE id = %s;
"""


if __name__ == "__main__":
    with connection() as conn:
        c = conn.cursor()
        for id_ in range(1, 1001):
            c.execute(update_to_table, (fake.phone_number(), id_))
        c.close()