package com.uplevel.tracker.data.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uplevel.tracker.data.entity.Note;

public interface NoteRepository extends JpaRepository<Note, Long> {

}
