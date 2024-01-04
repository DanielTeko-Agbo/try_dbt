
{{ config(materialized='table')}}

with emp_salaries as (
    select salary, row_number() over(order by emp_no asc) a from {{ ref('_employee_salaries') }}
), 

emp_titles as (
    select title, row_number() over(order by emp_no asc) a from {{ ref("_employee_titles") }}
), 

emp_depts as (
    select dept_name, row_number() over(order by emp_no asc) a from {{ ref("_employee_departments") }}
), 

emps as (
    select emp_no, first_name, last_name, birth_date, sex, hire_date, row_number() over(order by emp_no asc) a from employees 
)

select 
    emp_no, 
    title, 
    first_name, 
    last_name, 
    sex, 
    dept_name, 
    salary, 
    birth_date, 
    hire_date 
from emps 
full outer join emp_salaries using (a) 
full outer join emp_titles using (a) 
full outer join emp_depts using (a)