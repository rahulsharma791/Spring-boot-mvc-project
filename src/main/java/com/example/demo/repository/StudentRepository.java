package com.example.demo.repository;

import com.example.demo.Entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {
    @Query("select s from Student s where cast(s.sRollNo as string ) like %:keyword% or s.name like %:keyword% or s.email like %:keyword%")
    public List<Student> findStudentList(@Param("keyword") String keyword);

    @Query("select s from Student s where s.sRollNo = :id")
    public Student fetchById(@Param("id") Integer rollNo);

    @Query("select count(s) from Student s where s.email = :email")
    public Integer emailIdExist(@Param("email") String emailId);

    @Query("select count(s) from Student s where s.mobileNo = :mobileNo")
    public Integer mobileNoExist(@Param("mobileNo") String mobileNo);

}
