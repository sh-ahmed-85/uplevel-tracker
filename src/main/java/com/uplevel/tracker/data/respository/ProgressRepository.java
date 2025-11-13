package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.ProgressEntity;

public interface ProgressRepository extends JpaRepository<ProgressEntity, Long> {

}
