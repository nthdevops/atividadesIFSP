/*
Questão 1
*/
select instructor.ID as "ID", instructor.name "Name", count(sec_id) as "Seções" 
FROM instructor natural left join teaches  group by instructor.ID;

/*
Questão 2
*/
select ID, name,
(select count(*) as "Number of sections"
from teaches t where t.id = i.id) as "Seções"
FROM instructor i;

/*
Questão 3
*/
select sec_id, if(i.name = NULL, "-", i.name)
   from (section natural left join teaches) natural left join instructor i
   where semester = "Spring" and year = "2010";
   
/*
Questão 4
*/
select a.name, format(sum(points * credits), 1), course.title from
   (((takes natural join section) natural join course) 
   natural join grade_points) natural join student a
   group by ID, name, title;

/*
Questão 5
*/
create view notas_aluno as select a.ID AS ID, format(sum(points * credits), 1) AS CR from
(((takes natural join section) natural join course) 
natural join grade_points) natural join student a
group by ID, name, title;
