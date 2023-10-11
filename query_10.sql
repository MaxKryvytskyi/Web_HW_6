--Знайде список курсів, які певному студенту читає певний викладач.
SELECT DISTINCT d.name AS discipline, t.fullname AS teacher_name
FROM students s
JOIN teachers t ON d.teacher_id = t.id 
JOIN grades g ON g.student_id = s.id 
JOIN disciplines d ON d.id = g.discipline_id 
WHERE s.id = 20 AND d.teacher_id = 1
ORDER BY d.name