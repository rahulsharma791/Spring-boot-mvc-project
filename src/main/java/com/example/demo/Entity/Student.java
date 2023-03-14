package com.example.demo.Entity;


import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.sql.Blob;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "student")
@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_rollNo")
    private Integer sRollNo;
    @Column(name = "sname", nullable = false)
    private String name;
    @Column(name = "father_name", nullable = false)
    private String fatherName;
    @Column(name = "mother_name", nullable = false)
    private String motherName;
    @Column(name = "email_address", nullable = false)
    private String email;
    @Column(name = "gender", nullable = false)
    private String gender;
    @Column(name = "qualification", nullable = false)
    private String qualification;
    @Column(name = "b.tech_roll_number", nullable = false)
    private String rollNo;
    @Column(name = "death_of_birth", nullable = false)
    private String dateOfBirth;
    @Column(name = "marital_status", nullable = false)
    private String maritalStatus;
    @Lob
    @Column(name = "student_photo",columnDefinition = "BLOB",nullable = false)
    private Blob studentPhoto;

    @Transient
    private String studentPhotoStr;

    @Lob
    @Column(name = "student_signature",columnDefinition = "BLOB",nullable = false)
    private Blob studentSignature;

    @Column(name = "mobile_number",nullable = false)
    private String mobileNo;
    @Column(name = "address_id", nullable = false)
    private Integer addressId;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_id", referencedColumnName = "address_id", insertable = false, updatable = false)
    private Address address;
}
