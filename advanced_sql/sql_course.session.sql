CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);


INSERT INTO job_applied
(
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES (1,
    '2024-02-01',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'submitted'
),
(2, '2024-03-10', false, 'resume_02.pdf', false, NULL, 'in review'),
(3, '2024-04-15', true, 'resume_03.pdf', true, 'cover_letter_03.pdf', 'interviewing'),
(4, '2024-05-20', true, 'resume_04.pdf', true, 'cover_letter_04.pdf', 'submitted'),
(5, '2024-06-05', false, 'resume_05.pdf', false, NULL, 'withdrawn');

ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied
SET contact = 'Jennifer Mazibuko'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Thabo Nkosi'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Lerato Mokoena'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Sipho Dlamini'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Nomvula Khumalo'
WHERE job_id = 5;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

-- DROP TABLE job_applied

SELECT * FROM job_applied;

