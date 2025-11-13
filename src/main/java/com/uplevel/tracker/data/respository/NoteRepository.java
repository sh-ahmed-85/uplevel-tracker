package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.NoteEntity;

public interface NoteRepository extends JpaRepository<NoteEntity, Long> {

}
