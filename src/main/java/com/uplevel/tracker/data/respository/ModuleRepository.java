package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.ModuleEntity;

public interface ModuleRepository extends JpaRepository<ModuleEntity, Long> {

}
