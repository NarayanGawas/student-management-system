package com.ankit.entity;

import java.util.List;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name="students")
@Data
public class Student {
   @Id
   @GeneratedValue(strategy =GenerationType.IDENTITY)
   private Integer id;
   
	private String name;
	private String email;
	private String course;
	private String gender;
	private String address;
	
	@ElementCollection
    private List<String> timings;

	 
	
}
