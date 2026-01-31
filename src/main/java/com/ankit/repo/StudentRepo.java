package com.ankit.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ankit.entity.Student;

public interface StudentRepo extends JpaRepository<Student,Integer>{

}
