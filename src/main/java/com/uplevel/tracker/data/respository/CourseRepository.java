package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
