from DB_connect import connection

create_users_table = """
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	password VARCHAR(50),
	age NUMERIC CHECK (age > 0 AND age < 130)
);
"""


if __name__ == "__main__":
    with connection() as conn:
        c = conn.cursor()
        c.execute(create_users_table)
        c.close()