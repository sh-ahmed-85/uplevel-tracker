package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.Lesson;

public interface LessonRepository extends JpaRepository<Lesson, Long> {

}
