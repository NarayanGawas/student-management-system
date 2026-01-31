package com.ankit.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ankit.binding.Student;
import com.ankit.repo.StudentRepo;
import com.ankit.service.StudentService;

@Service
public class StudentServiceimpl implements StudentService {
    
	@Autowired
	StudentRepo repo;
	@Override
	public String saveStudent(Student student) {

	    com.ankit.entity.Student entity = new com.ankit.entity.Student();

	    // ✅ copy all common fields
	    BeanUtils.copyProperties(student, entity);

	    // ✅ set timings manually ONLY if needed
	    entity.setTimings(student.getTimings());

	    repo.save(entity);

	    return "student save successful";
	}

	
	
	@Override
	public List<String> getAllCourse() {
		// TODO Auto-generated method stub
		return Arrays.asList("java full","python","cpp","html");
	}


	@Override
	public List<String> getAlltimings() {
		// TODO Auto-generated method stub
		return Arrays.asList("Morning","Afternoon","Evening");
	}


	@Override
	public List<com.ankit.entity.Student> getAllStudent() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}


	@Override
	public com.ankit.entity.Student getStudentById(int id) {
		// TODO Auto-generated method stub
	Optional<com.ankit.entity.Student> byId = repo.findById(id);
	
	com.ankit.entity.Student student = byId.get();
	return student;
	}



	@Override
	public String editStudent(com.ankit.entity.Student dto) {
		// TODO Auto-generated method stub
		 repo.save(dto);
		 return "update success";
	}



	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
		repo.deleteById(id);
		
		
	}

	
	
	
	
	
	
}
