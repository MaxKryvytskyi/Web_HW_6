--Знайде середній бал, який ставить певний викладач зі своїх предметів.
SELECT d.name AS discipline, ROUND(AVG(g.grade), 2) AS average_grade
FROM disciplines d 
JOIN students s ON g.student_id = s.id 
JOIN teachers t ON t.id = d.teacher_id
JOIN grades g ON g.discipline_id = d.id 
WHERE t.id = 4
GROUP BY d.name
ORDER BY d.name 