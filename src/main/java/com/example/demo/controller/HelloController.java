package com.example.demo.controller;

import com.example.demo.model.AddressModel;
import com.example.demo.model.FetchStudentModel;
import com.example.demo.model.StudentListModel;
import com.example.demo.model.StudentModel;
import com.example.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.DELETE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;


@Controller
public class HelloController {
    @Autowired
    private StudentService service;

    @GetMapping({"/index", "/"})
    public String hello() {
        return "welcome";
    }

    @GetMapping("/register_form")
    public String register() {
        return "register_form";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String submitForm(@ModelAttribute("student") StudentModel studentModel, @ModelAttribute("address") AddressModel addressModel) throws SQLException, IOException {
        service.addStudent(studentModel, addressModel);
        return "register_form";
    }

    @GetMapping("/student_list")
    public String studentList(Model model, String keyword, Pageable pageable) throws SQLException {
        model.addAttribute("students", service.allStudentList(keyword));
        model.addAttribute("searchText", keyword);
        return "student_list";
    }

    @ResponseBody
    @RequestMapping(value = "/studentList/{keyword}", method = GET)
    public List<StudentListModel> studentList(@PathVariable(required = false) String keyword) throws SQLException {
        return service.allStudentList(keyword);
    }


    @ResponseBody
    @GetMapping("/fetch_By_Id/{rollNumber}")
    public FetchStudentModel fetchStudentByRollNo(@PathVariable Integer rollNumber) throws SQLException {
        return service.fetchStudentByRollNo(rollNumber);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteById/{sRollNumber}", method = DELETE)
    public void deleteById(@PathVariable Integer sRollNumber) {
        service.deleteById(sRollNumber);
    }

    @ResponseBody
    @RequestMapping(value = "/emailAlreadyExist/{email}", method = GET)
    public Boolean emailAlreadyExist(@PathVariable String email) {
        return service.isEmailAlreadyExist(email);
    }

    @ResponseBody
    @RequestMapping(value = "/mobileNoAlreadyExist/{mobileNo}", method = GET)
    public Boolean isMobileNoAlreadyExist(@PathVariable String mobileNo) {
        return service.isMobileNoExist(mobileNo);
    }

    @GetMapping("/roughWork")
    public String roughwork() {
        return "roughWork";
    }
}
