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
public class Course {

    public Long courseId;
    public String title;
    public String description;
    public String difficulty;
    public Integer totalHours;
    public List<String> tags;
    public String createdBy;
    public LocalDateTime createdAt;
    public LocalDateTime updatedAt;

    public List<Module> modules;
}
