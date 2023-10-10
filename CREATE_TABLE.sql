DROP TABLE IF EXISTS [groups]
CREATE TABLE [groups] (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	name STRING UNIQUE
);

DROP TABLE IF EXISTS teachers
CREATE TABLE teachers (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	fullname STRING
);

DROP TABLE IF EXISTS students
CREATE TABLE students (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	fullname STRING,
	group_id REFERENCES [groups] (id)
);


DROP TABLE IF EXISTS disciplines
CREATE TABLE disciplines (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	name STRING,
	teacher_id REFERENCES teachers (id)
);

DROP TABLE IF EXISTS grades
CREATE TABLE grades (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	discipline_id REFERENCES disciplines (id),
	student_id REFERENCES students (id),
	grade INTEGER,
	date_of DATE
);








INSERT INTO genders (name)
VALUES ("male"), ("female");

INSERT INTO users (name, email, password, age, gender_id)
VALUES ('Boris', 'boris@test.com', 'password', 23, 1),
('Alina', 'alina@test.com', 'password', 32, 2),
('Maksim', 'maksim@test.com', 'password', 40, 1);

INSERT INTO contacts (name, email, phone, favorite, user_id)
VALUES ('Allen Raymond', 'nulla.ante@vestibul.co.uk', '(992) 914-3792', 0, 1),
('Chaim Lewis', 'dui.in@egetlacus.ca', '(294) 840-6685', 1, 1),
('Kennedy Lane', 'mattis.Cras@nonenimMauris.net', '(542) 451-7038', 1, 2),
('Wylie Pope', 'est@utquamvel.net', '(692) 802-2949', 0, 2),
('Cyrus Jackson', 'nibh@semsempererat.com', '(501) 472-5218', 0, null);



