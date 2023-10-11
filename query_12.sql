--Знайде оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT g.grade, gr.name AS group_name, s.fullname AS student_name, d.name AS discipline, g.date_of 
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN groups gr ON s.group_id = gr.id
JOIN disciplines d ON d.id = g.discipline_id 
WHERE gr.id = 1 AND d.id = 8 AND g.date_of = (SELECT MAX(date_of) FROM grades WHERE student_id = s.id AND discipline_id = d.id)
ORDER BY g.date_of DESC ;