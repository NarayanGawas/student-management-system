package com.ankit.service;

import java.util.List;
import java.util.Optional;

import com.ankit.binding.Student;

public interface StudentService {

	String saveStudent(Student student);
	
	List<String> getAllCourse();
	
	List<String>getAlltimings();
	List<com.ankit.entity.Student> getAllStudent();
	
	com.ankit.entity.Student	getStudentById(int id);

	String editStudent(com.ankit.entity.Student dto);

	void delete(int id);
	
}
