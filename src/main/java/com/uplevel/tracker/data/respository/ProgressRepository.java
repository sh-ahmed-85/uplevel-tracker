package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.Progress;

public interface ProgressRepository extends JpaRepository<Progress, Long> {

}
