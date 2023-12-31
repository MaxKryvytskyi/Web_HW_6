from connect_db import connection

create_table_groups = """
CREATE TABLE [groups] (
 	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
 	name STRING UNIQUE
);"""

create_table_teachers = """
CREATE TABLE teachers (
 	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
 	fullname STRING
);"""

create_table_students = """
CREATE TABLE students (
 	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
 	fullname STRING,
 	group_id REFERENCES [groups] (id)
);"""

create_table_disciplines = """
CREATE TABLE disciplines (
 	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
 	name STRING,
 	teacher_id REFERENCES teachers (id)
);"""

create_table_grades = """
CREATE TABLE grades (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	discipline_id REFERENCES disciplines (id),
	student_id REFERENCES students (id),
	grade INTEGER,
	date_of DATE
);"""


if __name__ == "__main__":
    with connection() as conn:
        c = conn.cursor()
        c.execute(create_table_groups)
        c.execute(create_table_teachers)
        c.execute(create_table_students)
        c.execute(create_table_disciplines)
        c.execute(create_table_grades)
        conn.commit()
        c.close()