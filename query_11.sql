--Знайде середній бал, який певний викладач ставить певному студентові.
SELECT ROUND(AVG(g.grade), 2) AS average_grade, t.fullname AS teacher_name, s.fullname AS student_name 
FROM students s
JOIN teachers t ON d.teacher_id = t.id 
JOIN grades g ON g.student_id = s.id 
JOIN disciplines d ON d.id = g.discipline_id 
WHERE s.id = 1 AND d.teacher_id = 1
ORDER BY d.name