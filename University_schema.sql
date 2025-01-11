-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

-- Step 2: Create the Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Step 3: Create the Professors Table
CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Step 4: Create the Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    date_of_birth DATE,
    enrollment_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL
);

-- Step 5: Create the Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    professor_id INT,
    credits INT CHECK (credits > 0),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id) ON DELETE SET NULL
);

-- Step 6: Create the Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Step 7: Insert Sample Data into Departments
INSERT INTO Departments (department_id, department_name) VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');

-- Step 8: Insert Sample Data into Professors
INSERT INTO Professors (professor_id, first_name, last_name, email, phone) VALUES
    (1, 'Alice', 'Johnson', 'alice.j@example.com', '1234567890'),
    (2, 'Bob', 'Smith', 'bob.smith@example.com', '9876543210'),
    (3, 'Charlie', 'Brown', 'charlie.b@example.com', '4567891230');

-- Step 9: Insert Sample Data into Students
INSERT INTO Students (student_id, first_name, last_name, email, phone, date_of_birth, enrollment_date, department_id) VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1112223333', '2000-01-01', '2023-09-01', 1),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '4445556666', '1999-05-15', '2023-09-01', 2),
    (3, 'Emily', 'Davis', 'emily.davis@example.com', '7778889999', '2001-07-20', '2023-09-01', 3);

-- Step 10: Insert Sample Data into Courses
INSERT INTO Courses (course_id, course_name, department_id, professor_id, credits) VALUES
    (1, 'Database Systems', 1, 1, 4),
    (2, 'Linear Algebra', 2, 2, 3),
    (3, 'Quantum Mechanics', 3, 3, 5);

-- Step 11: Insert Sample Data into Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, grade) VALUES
    (1, 1, 1, '2023-09-10', 'A'),
    (2, 2, 2, '2023-09-12', 'B'),
    (3, 3, 3, '2023-09-15', 'A');
