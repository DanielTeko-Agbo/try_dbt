
{{ config(materialized='table') }}

select e.emp_no, s.title, e.first_name, e.last_name from {{ source('employees', 'employees') }} e join {{ source('employees', 'titles') }} s on e.emp_title_id = s.title_id