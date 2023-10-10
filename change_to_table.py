from faker import Faker
from DB_connect import connection

fake = Faker("uk_UA")
change_to_table = """
    ALTER TABLE users ADD COLUMN phone_number VARCHAR(20);
"""


if __name__ == "__main__":
    with connection() as conn:
        c = conn.cursor()
        c.execute(change_to_table)
        c.close()