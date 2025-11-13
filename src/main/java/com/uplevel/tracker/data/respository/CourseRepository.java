package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.CourseEntity;

public interface CourseRepository extends JpaRepository<CourseEntity, Long> {
}
