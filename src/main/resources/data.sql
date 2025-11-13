INSERT INTO users (username, password, enabled) values ('user', '{bcrypt}$2a$10$vw1gshpK4ipr97fWf1IBb.EhrqYcQxIQVpx.P3.3eVYUAAPRYSnAG', true);
INSERT INTO users (username, password, enabled) values ('admin', '{bcrypt}$2a$10$vw1gshpK4ipr97fWf1IBb.EhrqYcQxIQVpx.P3.3eVYUAAPRYSnAG', true);

INSERT INTO authorities (user_id, authority) values (1, 'ROLE_USER');
INSERT INTO authorities (user_id, authority) values (2, 'ROLE_USER');
INSERT INTO authorities (user_id, authority) values (2, 'ROLE_ADMIN');

INSERT INTO courses (title, description, difficulty, total_hours, tags, created_by) values ('Course 1', 'Description 1', 'BEGINNER', 10, 'TAG1,TAG2', 1);
INSERT INTO courses (title, description, difficulty, total_hours, tags, created_by) values ('Course 2', 'Description 2', 'INTERMEDIATE', 20, 'TAG3,TAG4', 1);
INSERT INTO courses (title, description, difficulty, total_hours, tags, created_by) values ('Course 3', 'Description 3', 'ADVANCED', 30, 'TAG5,TAG6', 2);

INSERT INTO modules (title, course_id, order_index) values ('Module 1', 1, 1);
INSERT INTO modules (title, course_id, order_index) values ('Module 2', 1, 2);
INSERT INTO modules (title, course_id, order_index) values ('Module 3', 1, 3);

INSERT INTO lessons (title, url, module_id, order_index, duration_minutes) values ('Lesson 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, 1, 10);
INSERT INTO lessons (title, url, module_id, order_index, duration_minutes) values ('Lesson 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, 2, 10);
INSERT INTO lessons (title, url, module_id, order_index, duration_minutes) values ('Lesson 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, 3, 10);

INSERT INTO enrollments (user_id, course_id, status, progress_percentage, target_date, start_date, end_date) values (1, 1, 'ACTIVE', 0.5, '2025-01-01', '2025-01-01', '2025-01-01');
INSERT INTO enrollments (user_id, course_id, status, progress_percentage, target_date, start_date, end_date) values (1, 2, 'ACTIVE', 0.5, '2025-01-01', '2025-01-01', '2025-01-01');
INSERT INTO enrollments (user_id, course_id, status, progress_percentage, target_date, start_date, end_date) values (2, 3, 'ACTIVE', 0.5, '2025-01-01', '2025-01-01', '2025-01-01');

INSERT INTO lesson_progress (lesson_id, enrollment_id, completed_at) values (1, 1, '2025-01-01');
INSERT INTO lesson_progress (lesson_id, enrollment_id, completed_at) values (2, 1, '2025-01-01');
INSERT INTO lesson_progress (lesson_id, enrollment_id, completed_at) values (3, 1, '2025-01-01');

INSERT INTO notes (lesson_id, user_id, note) values (1, 1, 'Note 1');
INSERT INTO notes (lesson_id, user_id, note) values (2, 1, 'Note 2');
INSERT INTO notes (lesson_id, user_id, note) values (3, 1, 'Note 3');