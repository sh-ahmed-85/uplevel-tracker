package com.uplevel.tracker.web.models;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Module {
    public Long moduleId;
    public String title;
    public Course course;
    public List<Lesson> lessons;
    public LocalDateTime createdAt;
    public LocalDateTime updatedAt;
    
}
