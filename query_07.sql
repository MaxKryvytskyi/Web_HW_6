--Знайде оцінки студентів у окремій групі з певного предмета.
SELECT gr.name AS group_name, s.fullname AS student_name, d.name AS discipline, g.grade 
FROM students s 
JOIN grades g ON g.student_id = s.id 
JOIN disciplines d ON d.id = g.discipline_id 
JOIN [groups] gr ON s.group_id = gr.id
WHERE gr.id = 2 AND d.id = 2
ORDER BY s.fullname