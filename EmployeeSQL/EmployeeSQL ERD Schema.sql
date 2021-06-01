-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Wpp9Gq
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Employee Schema

CREATE TABLE "Titles" (
    "Title_ID" VARCHAR(5)   NOT NULL,
    "Title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_ID"
     )
);

CREATE TABLE "Employees" (
    "Emp_No" INTEGER   NOT NULL,
    "Emp_Title" VARCHAR(5)   NOT NULL,
    "Birth_Date" varchar(10)   NOT NULL,
    "First_Name" VARCHAR(50)   NOT NULL,
    "Last_Name" VARCHAR(50)   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    "Hire_Date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Department" (
    "Dept_No" VARCHAR(4)   NOT NULL,
    "Dept_Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Salaries" (
    "Emp_No" INTEGER   NOT NULL,
    "Salary" money   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_No" INTEGER   NOT NULL,
    "Dept_No" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "Emp_No","Dept_No"
     )
);

CREATE TABLE "Dept_Manager" (
    "Dept_No" VARCHAR(4)   NOT NULL,
    "Emp_No" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "Dept_No","Emp_No"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title" FOREIGN KEY("Emp_Title")
REFERENCES "Titles" ("Title_ID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Department" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Department" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

