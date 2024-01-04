
{{ config(materialized='table') }}

with departments as (
    select * from {{ source('depts', 'departments') }}
), 

emp_depts as (
    select e.emp_no, e.first_name, e.last_name, departments.dept_name from {{ source("employees", "employees") }} e join {{ source('depts', 'dept_emp') }} d using(emp_no) join departments using(dept_no)
)

select * from emp_depts