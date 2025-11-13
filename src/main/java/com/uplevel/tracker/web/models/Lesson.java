package com.uplevel.tracker.web.models;

import java.time.LocalDateTime;

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
public class Lesson {   

    public Long lessonId;
    public String title;
    public String url;
    public Integer orderIndex;
    public Integer durationMinutes;
    public LocalDateTime createdAt;
    public LocalDateTime updatedAt;
}
