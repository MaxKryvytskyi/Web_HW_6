--Знайде список курсів, які відвідує студент.
SELECT DISTINCT d.name AS discipline
FROM students s 
JOIN grades g ON g.student_id = s.id 
JOIN disciplines d ON d.id = g.discipline_id 
WHERE s.id = 19
ORDER BY d.name