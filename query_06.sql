--Знайде список студентів у певній групі.
SELECT gr.name AS group_name, s.fullname AS student_name
FROM students s 
JOIN [groups] gr ON s.group_id = gr.id 
WHERE gr.id = 1
ORDER BY s.fullname 