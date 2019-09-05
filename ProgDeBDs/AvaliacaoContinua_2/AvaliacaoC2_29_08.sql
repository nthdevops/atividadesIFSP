/*
Q1
*/
create database employees;

/*
Q2
*/
use employees;
create table company(
company_name varchar(200) not null primary key,
city varchar(200)
);

/*
Q3
*/
create table employee(
person_name varchar(200) not null primary key,
street varchar(200),
city varchar(200)
);

/*
Q4
*/
create table manages(
person_name varchar(200) not null primary key,
manager_name varchar(200)
);

/*
Q5
*/
create table works(
person_name varchar(200) not null primary key,
company_name varchar(200),
salary double
);

/*
Q6
*/
alter table works
add constraint fk_works_employee_person_name
foreign key (person_name) references employee (person_name)
on delete cascade on update cascade;

/*
Q7
*/
alter table works
add constraint fk_works_company_company_name
foreign key (company_name) references company (company_name)
on delete cascade on update cascade;

/*
Q8
*/
alter table manages
add constraint fk_manages_employee_person_name
foreign key (person_name) references employee (person_name)
on delete cascade on update cascade;

/*
Q9
*/
alter table manages
add constraint fk_manages_employee_manager_name_person_name
foreign key (manager_name) references employee (person_name)
on delete cascade on update cascade;