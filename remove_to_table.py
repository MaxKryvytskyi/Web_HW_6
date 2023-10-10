from faker import Faker
from DB_connect import connection

fake = Faker("uk_UA")
remove_table = """
    ALTER TABLE users DROP COLUMN phone_nambers;
"""


if __name__ == "__main__":
    with connection() as conn:
        c = conn.cursor()
        c.execute(remove_table)
        c.close()