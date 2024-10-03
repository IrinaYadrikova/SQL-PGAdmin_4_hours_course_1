CREATE TABLE job_applied (
    job_id INT,
    application_sent_data DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR (255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)

);
CREATE DATABASE sql_course;