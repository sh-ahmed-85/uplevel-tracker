package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.EnrollmentEntity;

public interface EnrollmentRepository extends JpaRepository<EnrollmentEntity, Long> {

}
