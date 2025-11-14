CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT
);

CREATE TABLE Subjects (
    subject_id INTEGER PRIMARY KEY,
    subject_name TEXT
);

CREATE TABLE Marks (
    student_id INTEGER,
    subject_id INTEGER,
    marks INTEGER,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);
