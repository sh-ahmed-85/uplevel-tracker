
CREATE TABLE users(
    username varchar_ignorecase(50) primary key,
    password varchar_ignorecase(500) not null,
    enabled boolean not null
);

CREATE TABLE authorities(
    username varchar_ignorecase(50) not null,
    authority varchar_ignorecase(50) not null,
    foreign key (username) references users(username)
);

CREATE UNIQUE INDEX idx_auth_username on authorities(username, authority);

CREATE TABLE courses(
    id int primary key,
    title varchar_ignorecase(255) not null,
    description text not null,
    difficulty varchar_ignorecase(50) not null,
    total_hours int not null,
    tags varchar_ignorecase(255) not null,
    created_by varchar_ignorecase(50) not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    foreign key (created_by) references users(username)
);

CREATE TABLE modules(
    id int primary key,
    title varchar_ignorecase(255) not null,
    course_id int not null,
    order_index int not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    foreign key (course_id) references courses(id)
);

CREATE TABLE lessons(
    id int primary key,
    title varchar_ignorecase(255) not null,
    url varchar_ignorecase(255) null,
    module_id int not null,
    order_index int not null,
    duration_minutes int not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    foreign key (module_id) references modules(id)
);

CREATE TABLE enrollments(
    id int primary key,
    user_id int not null,
    course_id int not null,
    -- status[PLANNED|ACTIVE|PAUSED|COMPLETED]
    status varchar_ignorecase(50) not null,
    progress_percentage float not null,
    target_date timestamp not null,
    start_date timestamp not null,
    end_date timestamp not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    foreign key (user_id) references users(username),
    foreign key (course_id) references courses(id)
);

CREATE TABLE lesson_progress(
    id int primary key,
    lesson_id int not null,
    enrollment_id int not null,
    completed_at timestamp null,
    foreign key (lesson_id) references lessons(id),
    foreign key (enrollment_id) references enrollments(id)
);

CREATE TABLE notes(
    id int primary key,
    lesson_id int not null,
    user_id int not null,
    note text not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    foreign key (lesson_id) references lessons(id),
    foreign key (user_id) references users(username)
);