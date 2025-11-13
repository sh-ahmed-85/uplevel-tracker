package com.uplevel.tracker.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.uplevel.tracker.data.entity.CourseEntity;
import com.uplevel.tracker.web.models.Course;
import com.uplevel.tracker.web.models.Module;
import com.uplevel.tracker.web.models.Lesson;
import com.uplevel.tracker.data.respository.CourseRepository;

@Service
public class CourseService {
    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public List<Course> getAllCourses() {
        List<CourseEntity> courseEntities = courseRepository.findAll();
        return courseEntities.stream()
            .map(this::entityToModel)
            .collect(Collectors.toList());
    }

    public Course addOrUpdateCourse(Course course) {
        CourseEntity courseEntity = modelToEntity(course);
        courseEntity = courseRepository.save(courseEntity);
        return entityToModel(courseEntity);
    }

    public void deleteCourse(Long courseId) {
        courseRepository.deleteById(courseId);
    }

    private Course entityToModel(CourseEntity courseEntity) {
        Course course = new Course();
        course.setCourseId(courseEntity.getId());
        course.setTitle(courseEntity.getTitle());
        course.setDescription(courseEntity.getDescription());
        course.setDifficulty(courseEntity.getDifficulty());
        course.setTotalHours(courseEntity.getTotalHours());
        course.setTags(List.of(courseEntity.getTags().split(",")));
        course.setCreatedBy(courseEntity.getCreatedBy());
        course.setCreatedAt(courseEntity.getCreatedAt());
        course.setUpdatedAt(courseEntity.getUpdatedAt());
        course.setModules((List<Module>)courseEntity.getModules().stream().map(module -> {
            Module m = new Module();
            m.setModuleId(module.getId());
            m.setTitle(module.getTitle());
            m.setLessons(module.getLessons().stream().map(lesson -> {
                return new Lesson(
                    lesson.getId(),
                    lesson.getTitle(), lesson.getUrl(), lesson.getOrderIndex(), lesson.getDurationMinutes(), lesson.getCreatedAt(), lesson.getUpdatedAt());
            }).collect(Collectors.toList()));
            m.setCreatedAt(module.getCreatedAt());
            m.setUpdatedAt(module.getUpdatedAt());
            return m;
        }).collect(Collectors.toList()));
        return course;
    }

    private CourseEntity modelToEntity(Course course) {
        CourseEntity courseEntity = new CourseEntity();
        courseEntity.setId(course.getCourseId());
        courseEntity.setTitle(course.getTitle());
        courseEntity.setDescription(course.getDescription());
        courseEntity.setDifficulty(course.getDifficulty());
        courseEntity.setTotalHours(course.getTotalHours());
        courseEntity.setTags(course.getTags().stream().collect(Collectors.joining(",")));
        courseEntity.setCreatedBy(course.getCreatedBy());
        return courseEntity;
    }
}
