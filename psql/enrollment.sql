-- Create the database if it doesn't exist
DROP DATABASE IF EXISTS enrollmentdb;
CREATE DATABASE enrollmentdb;

-- Use the database
\c enrollmentdb;

-- Enrollment / Student Practice Dataset
DROP TABLE IF EXISTS enrollments CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS students CASCADE;

-- Create schema and tables
CREATE schema IF NOT EXISTS enrollment;

CREATE TABLE enrollment.students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    email VARCHAR(120),
    city VARCHAR(80),
    country VARCHAR(80)
);

CREATE TABLE enrollment.courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(120),
    department VARCHAR(80),
    credits INT
);

CREATE TABLE enrollment.enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT REFERENCES enrollment.students(student_id),
    course_id INT REFERENCES enrollment.courses(course_id),
    enrollment_date DATE,
    grade CHAR(1)
);

INSERT INTO
    enrollment.students
VALUES
    (
        1,
        'John',
        'Korhonen',
        'Male',
        '2001-06-15',
        'john.k@email.com',
        'Helsinki',
        'Finland'
    ),
    (
        2,
        'Aino',
        'Virtanen',
        'Female',
        '2002-02-19',
        'aino.v@email.com',
        'Oulu',
        'Finland'
    ),
    (
        3,
        'Mika',
        'Laine',
        'Male',
        '2000-12-03',
        'mika.l@email.com',
        'Tampere',
        'Finland'
    ),
    (
        4,
        'Sara',
        'Niemi',
        'Female',
        '2003-08-21',
        'sara.n@email.com',
        'Turku',
        'Finland'
    ),
    (
        5,
        'James',
        'Walker',
        'Male',
        '2001-11-30',
        'james.w@email.com',
        'London',
        'UK'
    ),
    (
        6,
        'Julia',
        'Walker',
        'Female',
        '2004-01-12',
        'julia.w@email.com',
        'Helsinki',
        'Finland'
    ),
    (
        7,
        'Emma',
        'Johansson',
        'Female',
        '2002-05-05',
        'emma.j@email.com',
        'Stockholm',
        'Sweden'
    ),
    (
        8,
        'Noah',
        'Lindberg',
        'Male',
        '2001-09-17',
        'noah.l@email.com',
        'Oulu',
        'Finland'
    ),
    (
        9,
        'Liam',
        'Davis',
        'Male',
        '1999-10-26',
        'liam.d@email.com',
        'Berlin',
        'Germany'
    ),
    (
        10,
        'Olivia',
        'Brown',
        'Female',
        '2003-03-08',
        'olivia.b@email.com',
        'Helsinki',
        'Finland'
    ),
    (
        11,
        'Jasper',
        'Miettinen',
        'Male',
        '2002-07-22',
        'jasper.m@email.com',
        'Hameenlinna',
        'Finland'
    ),
    (
        12,
        'Hanna',
        'Koskinen',
        'Female',
        '2000-04-14',
        'hanna.k@email.com',
        'Helsinki',
        'Finland'
    ),
    (
        13,
        'Petra',
        'Aalto',
        'Female',
        '2001-01-09',
        'petra.a@email.com',
        'Oulu',
        'Finland'
    ),
    (
        14,
        'Karl',
        'Svensson',
        'Male',
        '2001-12-12',
        'karl.s@email.com',
        'Munich',
        'Germany'
    ),
    (
        15,
        'Mona',
        'Ibrahim',
        'Female',
        '2002-11-11',
        'mona.i@email.com',
        'Espoo',
        'Finland'
    ),
    (
        16,
        'Lucas',
        'Schneider',
        'Male',
        '2001-08-22',
        'lucas.s@email.com',
        'Zurich',
        'Switzerland'
    ),
    (
        17,
        'Sofia',
        'Garcia',
        'Female',
        '2003-04-23',
        'sofia.g@email.com',
        'Madrid',
        'Spain'
    ),
    (
        18,
        'Elias',
        'Andersson',
        'Male',
        '2002-08-30',
        'elias.a@email.com',
        'Gothenburg',
        'Sweden'
    ),
    (
        19,
        'Anna',
        'Ivanova',
        'Female',
        '2000-10-10',
        'anna.i@email.com',
        'Moscow',
        'Russia'
    ),
    (
        20,
        'Mateo',
        'Silva',
        'Male',
        '2001-05-05',
        'mateo.s@email.com',
        'Lisbon',
        'Portugal'
    ),
    (
        21,
        'Lea',
        'Dubois',
        'Female',
        '2002-03-15',
        'lea.d@email.com',
        'Paris',
        'France'
    ),
    (
        22,
        'Oscar',
        'Martinez',
        'Male',
        '2003-07-07',
        'oscar.m@email.com',
        'Barcelona',
        'Spain'
    ),
    (
        23,
        'Mia',
        'Schmidt',
        'Female',
        '2001-09-09',
        'mia.s@email.com',
        'Berlin',
        'Germany'
    ),
    (
        24,
        'Noah',
        'Rossi',
        'Male',
        '2000-11-11',
        'noah.r@email.com',
        'Rome',
        'Italy'
    ),
    (
        25,
        'Ella',
        'Nielsen',
        'Female',
        '2002-01-01',
        'ella.n@email.com',
        'Copenhagen',
        'Denmark'
    ),
    (
        26,
        'Leo',
        'Novak',
        'Male',
        '2003-02-02',
        'leo.n@email.com',
        'Prague',
        'Czech Republic'
    ),
    (
        27,
        'Sofia',
        'Popescu',
        'Female',
        '2001-03-03',
        'sofia.p@email.com',
        'Bucharest',
        'Romania'
    ),
    (
        28,
        'Jakub',
        'Kowalski',
        'Male',
        '2002-04-04',
        'jakub.k@email.com',
        'Warsaw',
        'Poland'
    ),
    (
        29,
        'Emma',
        'Horvath',
        'Female',
        '2000-05-05',
        'emma.h@email.com',
        'Budapest',
        'Hungary'
    ),
    (
        30,
        'David',
        'Petrov',
        'Male',
        '2001-06-06',
        'david.p@email.com',
        'Sofia',
        'Bulgaria'
    );

INSERT INTO
    enrollment.courses
VALUES
    (1, 'Database Systems', 'Computer Science', 5),
    (2, 'Web Development', 'Computer Science', 5),
    (3, 'Data Structures', 'Computer Science', 4),
    (4, 'Calculus I', 'Mathematics', 5),
    (5, 'Statistics', 'Mathematics', 4),
    (6, 'Academic Writing', 'Language Studies', 3),
    (7, 'Cybersecurity Basics', 'Computer Science', 4),
    (8, 'Linear Algebra', 'Mathematics', 5),
    (9, 'Digital Marketing', 'Business', 3),
    (10, 'Physics I', 'Science', 5),
    (11, 'Chemistry', 'Science', 4),
    (12, 'Biology', 'Science', 4),
    (13, 'Philosophy', 'Humanities', 3),
    (14, 'World History', 'Humanities', 4),
    (15, 'Economics', 'Business', 4),
    (16, 'Programming I', 'Computer Science', 5),
    (17, 'Discrete Math', 'Mathematics', 4),
    (18, 'Art History', 'Arts', 3),
    (19, 'Music Theory', 'Arts', 3),
    (20, 'Environmental Science', 'Science', 4),
    (21, 'Business Ethics', 'Business', 3);

INSERT INTO
    enrollment.enrollments
VALUES
    (1, 1, 1, '2024-01-10', 'A'),
    (2, 1, 2, '2024-01-10', 'B'),
    (3, 2, 1, '2024-01-12', 'A'),
    (4, 2, 3, '2024-01-12', 'B'),
    (5, 3, 1, '2024-01-15', 'C'),
    (6, 3, 4, '2024-01-15', 'B'),
    (7, 4, 2, '2024-01-20', 'A'),
    (8, 5, 5, '2024-01-21', 'B'),
    (9, 6, 1, '2024-01-25', 'A'),
    (10, 6, 2, '2024-01-25', 'A'),
    (11, 7, 6, '2024-02-01', 'B'),
    (12, 8, 2, '2024-02-04', 'C'),
    (13, 8, 7, '2024-02-04', 'B'),
    (14, 9, 8, '2024-02-09', 'A'),
    (15, 10, 1, '2024-02-10', 'B'),
    (16, 10, 3, '2024-02-10', 'A'),
    (17, 11, 4, '2024-02-13', 'B'),
    (18, 12, 1, '2024-02-15', 'A'),
    (19, 13, 2, '2024-02-18', 'A'),
    (20, 13, 5, '2024-02-18', 'B'),
    (21, 14, 3, '2024-02-22', 'C'),
    (22, 15, 6, '2024-02-25', 'A'),
    (23, 16, 10, '2024-03-01', 'B'),
    (24, 17, 11, '2024-03-02', 'A'),
    (25, 18, 12, '2024-03-03', 'C'),
    (26, 19, 13, '2024-03-04', 'B'),
    (27, 20, 14, '2024-03-05', 'A'),
    (28, 21, 15, '2024-03-06', 'B'),
    (29, 22, 16, '2024-03-07', 'A'),
    (30, 23, 17, '2024-03-08', 'C'),
    (31, 24, 18, '2024-03-09', 'B'),
    (32, 25, 19, '2024-03-10', 'A'),
    (33, 26, 20, '2024-03-11', 'B'),
    (34, 27, 21, '2024-03-12', 'A'),
    (35, 28, 1, '2024-03-13', 'C'),
    (36, 29, 2, '2024-03-14', 'B'),
    (37, 30, 3, '2024-03-15', 'A');