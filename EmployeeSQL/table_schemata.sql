create table departments (
	dept_no VARCHAR(8) primary key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

create table titles (
	title_id varchar(5) primary key not null,
	title varchar(30) not null
);

create table employees (
    emp_no INT  PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
	foreign key (emp_title_id) references titles (title_id)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);



create table salaries (
	emp_no INT primary key NOT NULL,
	salary money not null,
	foreign key (emp_no) references employees (emp_no)
);

create table dept_manager (
	dept_no varchar(8) not null,
	emp_no int not null,
	foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);
