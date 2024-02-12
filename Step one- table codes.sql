-- Drop tables if needed
DROP TABLE IF EXISTS "departments";
DROP TABLE IF EXISTS "dep_emp";
DROP TABLE IF EXISTS "dept_manager";
DROP TABLE IF EXISTS "employees";
DROP TABLE IF EXISTS "salaries";
DROP TABLE IF EXISTS "titles";

--Creating all tables (import in same order)

CREATE TABLE "departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(30)   NOT NULL,
    "birth_date" VARCHAR(30),
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(30)   NOT NULL,
    "hire_date" VARCHAR(30),
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     ),
    CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
        REFERENCES "titles" ("title_id")
);

CREATE TABLE "dep_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_dep_emp" PRIMARY KEY (
        "emp_no","dept_no"
     ),
    CONSTRAINT "fk_dep_emp_emp_no" FOREIGN KEY("emp_no")
        REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dep_emp_dept_no" FOREIGN KEY("dept_no")
        REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     ),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
        REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
        REFERENCES "employees" ("emp_no")
);


CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL PRIMARY KEY,
    "salary" INT   NOT NULL,
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
        REFERENCES "employees" ("emp_no")
);

--Check tables if needed
	--SELECT * FROM salaries
	--SELECT * FROM dept_manager
	--SELECT * FROM dep_emp
	--SELECT * FROM employees
	--SELECT * FROM titles
	--SELECT * FROM departments