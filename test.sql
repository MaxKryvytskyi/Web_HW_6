--1 Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
--
--SELECT s.fullname AS student_name, ROUND(AVG(g.grade),2) AS average_grade
--FROM grades g 
--JOIN students s ON s.id = g.student_id 
--GROUP BY s.fullname 
--ORDER BY average_grade DESC 
--LIMIT 5



--2 Знайти студента із найвищим середнім балом з певного предмета.
--
--SELECT s.fullname AS student_name, ROUND(AVG(g.grade),2) AS average_grade, d.name AS discipline 
--FROM grades g 
--JOIN students s ON s.id = g.student_id
--JOIN disciplines d ON d.id = g.discipline_id 
--WHERE d.id = 3
--GROUP BY s.fullname 
--ORDER BY average_grade DESC 
--LIMIT 1
 


--3 Знайти середній бал у групах з певного предмета.
--
--SELECT d.name AS discipline, gr.name AS group_name, ROUND(AVG(g.grade), 2) AS average_grade
--FROM grades g 
--JOIN students s ON s.id = g.student_id 
--JOIN disciplines d ON d.id = g.discipline_id
--JOIN [groups] gr ON gr.id = s.group_id
--WHERE d.id = 3
--GROUP BY gr.name, d.name  
--ORDER BY average_grade DESC;



--4 Знайти середній бал на потоці (по всій таблиці оцінок).
--
--SELECT ROUND(AVG(g.grade),2) AS average_grade
--FROM grades g 



--5 Знайти які курси читає певний викладач.
--
--SELECT d.name AS discipline
--FROM disciplines d 
--JOIN teachers t ON t.id = d.teacher_id
--WHERE t.id = 1



--6 Знайти список студентів у певній групі.
--
--SELECT gr.name AS group_name, s.fullname AS student_name
--FROM students s 
--JOIN [groups] gr ON s.group_id = gr.id 
--WHERE gr.id = 1
--ORDER BY s.fullname 



--7 Знайти оцінки студентів у окремій групі з певного предмета.
--
-- SELECT gr.name AS group_name, s.fullname AS student_name, d.name AS discipline, g.grade 
-- FROM students s 
-- JOIN grades g ON g.student_id = s.id 
-- JOIN disciplines d ON d.id = g.discipline_id 
-- JOIN [groups] gr ON s.group_id = gr.id
-- WHERE gr.id = 2 AND d.id = 2
-- ORDER BY s.fullname



--8 Знайти середній бал, який ставить певний викладач зі своїх предметів.
--
--SELECT d.name AS discipline, ROUND(AVG(g.grade), 2) AS average_grade
--FROM disciplines d 
--JOIN students s ON g.student_id = s.id 
--JOIN teachers t ON t.id = d.teacher_id
--JOIN grades g ON g.discipline_id = d.id 
--WHERE t.id = 4
--GROUP BY d.name
--ORDER BY d.name 



--9 Знайти список курсів, які відвідує студент.
--
--SELECT DISTINCT d.name AS discipline
--FROM students s 
--JOIN grades g ON g.student_id = s.id 
--JOIN disciplines d ON d.id = g.discipline_id 
--WHERE s.id = 19
--ORDER BY d.name



--10 Список курсів, які певному студенту читає певний викладач.
--
--SELECT DISTINCT d.name AS discipline, t.fullname AS teacher_name
--FROM students s
--JOIN teachers t ON d.teacher_id = t.id 
--JOIN grades g ON g.student_id = s.id 
--JOIN disciplines d ON d.id = g.discipline_id 
--WHERE s.id = 20 AND d.teacher_id = 1
--ORDER BY d.name



--11 Середній бал, який певний викладач ставить певному студентові.
--
-- SELECT d.name AS discipline, t.fullname AS teacher_name, s.fullname AS student_name, ROUND(AVG(g.grade), 2) AS average_grade 
-- FROM students s
-- JOIN teachers t ON d.teacher_id = t.id 
-- JOIN grades g ON g.student_id = s.id 
-- JOIN disciplines d ON d.id = g.discipline_id 
-- WHERE s.id = 1 AND d.teacher_id = 1
-- ORDER BY d.name



--12 Оцінки студентів у певній групі з певного предмета на останньому занятті.
--
-- SELECT g.grade, gr.name AS group_name, s.fullname AS student_name, d.name AS discipline, g.date_of 
-- FROM grades g
-- JOIN students s ON s.id = g.student_id
-- JOIN groups gr ON s.group_id = gr.id
-- JOIN disciplines d ON d.id = g.discipline_id 
-- WHERE gr.id = 1 AND d.id = 8 AND g.date_of = (SELECT MAX(date_of) FROM grades WHERE student_id = s.id AND discipline_id = d.id)
-- ORDER BY g.date_of DESC ;