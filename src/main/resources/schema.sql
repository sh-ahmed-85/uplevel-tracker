
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(500) NOT NULL,
    enabled BOOLEAN NOT NULL
);

CREATE TABLE authorities(
    user_id INT NOT NULL,
    authority VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE UNIQUE INDEX idx_auth_user_id on authorities(user_id, authority);

CREATE TABLE courses(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    difficulty VARCHAR(50) NOT NULL,
    total_hours INT NOT NULL,
    tags VARCHAR(255) NOT NULL,
    created_by INT NOT NULL REFERENCES users(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE modules(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) not null,
    course_id INT NOT NULL REFERENCES courses(id),
    order_index INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE lessons(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) not null,
    url VARCHAR(255) null,
    module_id INT NOT NULL REFERENCES modules(id),
    order_index INT NOT NULL,
    duration_minutes INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE enrollments(
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    course_id INT NOT NULL REFERENCES courses(id),
    -- status[PLANNED|ACTIVE|PAUSED|COMPLETED]
    status VARCHAR(50) NOT NULL,
    progress_percentage FLOAT NOT NULL,
    target_date TIMESTAMP NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE lesson_progress(
    id SERIAL PRIMARY KEY,
    lesson_id INT NOT NULL REFERENCES lessons(id),
    enrollment_id INT NOT NULL REFERENCES enrollments(id),
    completed_at TIMESTAMP NULL,
    UNIQUE (lesson_id, enrollment_id)
);

CREATE TABLE notes(
    id SERIAL PRIMARY KEY,
    lesson_id int not null REFERENCES lessons(id),
    user_id INT NOT NULL REFERENCES users(id),
    note TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);