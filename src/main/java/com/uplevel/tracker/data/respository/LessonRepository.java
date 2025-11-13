package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.LessonEntity;

public interface LessonRepository extends JpaRepository<LessonEntity, Long> {

}
