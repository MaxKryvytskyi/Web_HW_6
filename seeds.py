from faker import Faker
from random import randint
from sqlite3 import connect, Error
from datetime import datetime, date, timedelta
fake = Faker("uk_UA")

groups = ["Спарта", "Зодіак", "Творці"]

students_numbers = randint(30, 50)

disciplines = [
    "Алгоритми та структури даних",
    "Аналіз даних",
    "Бази даних",
    "Інтерфейс користувача",
    "Мережеве програмування",
    "Основи програмування",
    "Системне програмування",
    "Штучний інтелект"
    
]

TEACHERS_NUMBERS = 4

conn = connect("hw.db")
cur = conn.cursor()

def seeds_teachers():
    teachers = [fake.name() for _ in range(TEACHERS_NUMBERS)]
    sql = "INSERT INTO teachers(fullname) VALUES(?);"
    cur.executemany(sql, zip(teachers, ))

def seeds_disciplines():
    sql = "INSERT INTO disciplines(name, teacher_id) VALUES(?, ?);"
    cur.executemany(sql, zip(disciplines, iter(randint(1, TEACHERS_NUMBERS) for _ in range(len(disciplines)))))

def seeds_groups():
    sql = "INSERT OR IGNORE INTO groups(name) VALUES(?);"
    cur.executemany(sql, zip(groups,))

def seeds_students():
    students = [fake.name() for _ in range(students_numbers)]
    sql = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"
    cur.executemany(sql, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))

def seed_grades():
    start_date = datetime.strptime("2023-04-01", "%Y-%m-%d")
    end_date = datetime.strptime("2024-04-01", "%Y-%m-%d")
    sql = "INSERT INTO grades(discipline_id, student_id, grade, date_of) VALUES(?, ?, ?, ?);"

    def get_list_date(start: date, end: date) -> list[date]:
        result = []
        current_date = start
        while current_date <= end:
            if current_date.isoweekday() < 6:
                result.append(current_date)
            current_date += timedelta(1)
        return result

    list_dates = get_list_date(start_date, end_date)

    grades = []
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, students_numbers) for _ in range(5)]
        for student in random_students:
            grades.append((random_discipline, student, randint(1, 12), day.date()))
    cur.executemany(sql, grades)


if __name__ == "__main__":
    try:
        seeds_groups()
        seeds_disciplines()
        seeds_students()
        seeds_teachers()
        seed_grades()
        conn.commit()
    except Error as error:
        print(error)
    finally:
        conn.close()