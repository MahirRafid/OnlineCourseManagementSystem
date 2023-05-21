package com.login.model;

public class Course {
    String CourseCode;
    String CourseName;
	public String getCourseCode() {
		return CourseCode;
	}
	public void setCourseCode(String courseCode) {
		CourseCode = courseCode;
	}
	public String getCourseName() {
		return CourseName;
	}
	public void setCourseName(String courseName) {
		CourseName = courseName;
	}
	@Override
	public String toString() {
		return "Course [CourseCode=" + CourseCode + ", CourseName=" + CourseName + "]";
	}
	
}
