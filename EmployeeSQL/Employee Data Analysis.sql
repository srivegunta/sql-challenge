-- Data Table Import Order as per Schema Order
-- 1. "Titles"
-- 2. "Employees"
-- 3. "Department"
-- 4. "Salaries"
-- 5. "Dept_Manager"
-- 6. "Dept_Emp"
-- Import Criteria 
-- Encoding - UTF8 
-- Demiliter - ","
-- Header - YES

-- Employee Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select e."Emp_No",
	   e."Last_Name",
	   e."First_Name",
	   e."Sex",
	   s."Salary"
from "Employees" E  
     INNER JOIN "Salaries" S on e."Emp_No" = s."Emp_No";
	 
-- 2. List first name, last name, and hire date for employees who were hired in 1986.

Select "First_Name",
	   "Last_Name",
	   "Hire_Date"
from "Employees"
WHERE RIGHT("Hire_Date",4) = '1986';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

Select d."Dept_No",
	  d."Dept_Name",
	   m."Emp_No",
	   e."Last_Name",
	   e."First_Name"
from "Department" d	
     inner join "Dept_Manager" m on d."Dept_No" = m."Dept_No"
	 left join "Employees" e on m."Emp_No" = e."Emp_No";

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
	   
Select e."Emp_No",
	   e."Last_Name",
	   e."First_Name",
	   d."Dept_Name"
from "Employees" E  
	 INNER JOIN "Dept_Emp" DE on e."Emp_No" = de."Emp_No"
     LEFT JOIN "Department" D on de."Dept_No" = d."Dept_No";
		
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and 
-- last names begin with "B."	
Select "First_Name",
	   "Last_Name",
	   "Sex"
from "Employees"
WHERE "First_Name" = 'Hercules' and substring("Last_Name",1,1) = 'B';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select e."Emp_No",
	   e."Last_Name",
	   e."First_Name",
	   d."Dept_Name"
from "Employees" E  
	 INNER JOIN "Dept_Emp" DE on e."Emp_No" = de."Emp_No"
     LEFT JOIN "Department" D on de."Dept_No" = d."Dept_No"
WHERE d."Dept_Name" = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select e."Emp_No",
	   e."Last_Name",
	   e."First_Name",
	   d."Dept_Name"
from "Employees" E  
	 INNER JOIN "Dept_Emp" DE on e."Emp_No" = de."Emp_No"
     LEFT JOIN "Department" D on de."Dept_No" = d."Dept_No"
WHERE d."Dept_Name" in ('Sales','Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select e."Last_Name",count(*)
from "Employees" E
group by e."Last_Name"
order by count(*) desc ;