
{{ config(materialized='table') }}

select e.emp_no, e.first_name, e.last_name, s.salary from {{ source('employees', 'employees') }} e join {{ source('employees', 'salaries') }} s using(emp_no)