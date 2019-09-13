/*1 - Crie as contas de usuário User_A, User_B, User_C, User_D e User_E*/
create user 'user_a'@'localhost' identified by '';
create user 'user_b'@'localhost' identified by '';
create user 'user_c'@'localhost' identified by '';
create user 'user_d'@'localhost' identified by '';
create user 'user_e'@'localhost' identified by '';

/*2 - Considere o esquema de banco de dados relacional university. Conceda os seguintes privilégios aos usuários User_A, User_B, User_C, User_D e User_E.      A) O User_A pode recuperar ou modificar qualquer relação, exceto CLASSROOM, e pode conceder qualquer um desses privilégios a outros usuários.*/
grant select, update on advisor to 'user_a'@'localhost' with grant option;
grant select, update on course to 'user_a'@'localhost' with grant option;
grant select, update on department to 'user_a'@'localhost' with grant option;
grant select, update on grade_points to 'user_a'@'localhost' with grant option;
grant select, update on instructor to 'user_a'@'localhost' with grant option;
grant select, update on notas_aluno to 'user_a'@'localhost' with grant option;
grant select, update on prereq to 'user_a'@'localhost' with grant option;
grant select, update on section to 'user_a'@'localhost' with grant option;
grant select, update on student to 'user_a'@'localhost' with grant option;
grant select, update on takes to 'user_a'@'localhost' with grant option;
grant select, update on teaches to 'user_a'@'localhost' with grant option;
grant select, update on time_slot to 'user_a'@'localhost' with grant option;

/*B) Crie os comandos executados na Questão 2.a. concatenando os valores da tabela information_schema.TABLES.Lembrando que a tabela CLASSROOM não deverá ser concatenada. Execute a consulta select * from information_schema.TABLES; e verifique ops campos disponíveis.
*/
select concat("grant select, update on ", TABLE_NAME, " to 'user_a'@'localhost' with grant option;") from 
information_schema.TABLES where TABLE_SCHEMA = "university" and TABLE_NAME != "classroom";

/*C) Informe o comando para mostrar os privilégios atribuidos ao usuário User_A*/
SHOW GRANTS FOR 'user_a'@'localhost';

/*D) O User_B pode recuperar todos os atributos de INSTRUCTOR e TAKES, exceto salary e grade, respectivamente.*/
grant select (ID, name, dept_name) on instructor to 'user_b'@'localhost';
grant select (ID, course_id, sec_id, semester, year) on takes to 'user_b'@'localhost';

/*E) A User_C pode recuperar ou modificar SECTION, mas só pode recuperar e modificar os atributos course_id, sec_id, semester e year.*/
grant select (course_id, sec_id, semester, year), update (course_id, sec_id, semester, year) on section to 'user_c'@'localhost';

/*F) A User_D pode recuperar qualquer atributo de INSTRUCTOR e STUDENT e pode modificar grade_points.*/
grant select on instructor to 'user_d'@'localhost';
grant select on student to 'user_d'@'localhost';
grant update on grade_points to 'user_d'@'localhost';

/*G) A User_E pode recuperar qualquer atributo de STUDENT, mas somente para tuplas de STUDENT que tem dept_name = ‘Civil Eng.’*/
create view civilEng as (select * from student where dept_name = 'Civil Eng.');
grant select on civilEng to 'user_e'@'localhost';

/*H) Revogue os privilégios do usuário User_E*/
revoke select on civilEng from 'user_e'@'localhost';

/*I) Mostre os privilégios concedidos a todos os usuários.*/
SHOW GRANTS FOR 'pbda4'@'%';
SHOW GRANTS FOR 'debian-sys-maint'@'localhost';
SHOW GRANTS FOR 'mysql.session'@'localhost';
SHOW GRANTS FOR 'mysql.sys'@'localhost';
SHOW GRANTS FOR 'pbda4'@'localhost';
SHOW GRANTS FOR 'root'@'localhost';
SHOW GRANTS FOR 'user_a'@'localhost';
SHOW GRANTS FOR 'user_b'@'localhost';
SHOW GRANTS FOR 'user_c'@'localhost';
SHOW GRANTS FOR 'user_d'@'localhost';
SHOW GRANTS FOR 'user_e'@'localhost';

/*J) Crie os comandos executados na Questão 2.i concatenando os valores da tabela mysql.user.*/
SELECT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') FROM mysql.user;