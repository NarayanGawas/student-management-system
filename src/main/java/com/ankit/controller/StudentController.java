package com.ankit.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ankit.binding.Student;
import com.ankit.repo.StudentRepo;
import com.ankit.service.StudentService;

@Controller
public class StudentController {

    private final StudentRepo studentRepo;

    @Autowired
    StudentService service;

    StudentController(StudentRepo studentRepo) {
        this.studentRepo = studentRepo;
    }

    @GetMapping("/students")
    public String getAllStudents(Model model) {

        model.addAttribute("students", service.getAllStudent());
        return "students";   // ✅ FIXED HERE
    }
    
    @GetMapping("/delete")
    public String deleteStudent(@RequestParam int id) {
    	service.delete(id);
    	
    	return "redirect:/students";
    }
    
    
    
    
    @GetMapping("/edit")
    public String editform(@RequestParam("id") int id, Model model) {
    
    	 com.ankit.entity.Student student = service.getStudentById(id);
    	 
    	 Student dto = new Student();
    	 
    	 BeanUtils.copyProperties(student,dto);
    	 
    	 
//    	Student s1 = new Student(); //empty...
    model.addAttribute("student",dto);
    model.addAttribute("courses", service.getAllCourse());
    model.addAttribute("timings", service.getAlltimings());

    	return "edit-form";
    }
    
    @PostMapping("/edit-student")
    public String editStudent(com.ankit.entity.Student dto) {

       System.err.println(dto);
       service.editStudent(dto);
        return "redirect:/students";
    }

    
    
    

    @GetMapping("/")
    public String getStudentform(Model model) {

        Student s1 = new Student();

        model.addAttribute("student", s1);
        model.addAttribute("courses", service.getAllCourse());
        model.addAttribute("timings", service.getAlltimings());

        return "student-form";
    }

    @PostMapping("/save")
    public String saveStudent(Student student, Model model) {

        String msg = service.saveStudent(student);
        model.addAttribute("msg", msg);

        Student s1 = new Student();
        model.addAttribute("student", s1);
        model.addAttribute("courses", service.getAllCourse());
        model.addAttribute("timings", service.getAlltimings());

        return "student-form";
    }
}
