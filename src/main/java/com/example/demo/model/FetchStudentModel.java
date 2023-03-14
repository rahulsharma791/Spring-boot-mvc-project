package com.example.demo.model;

import com.example.demo.Entity.Address;
import lombok.*;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.sql.Blob;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FetchStudentModel {

    private Integer sRollNo;
    private String sName;
    private String fatherName;
    private String motherName;
    private String email;
    private String gender;
    private String qualification;
    private String rollNo;
    private String dateOfBirth;
    private String maritalStatus;
    private String studentPhotoStr;
    private String studentSignatureStr;
    private String mobileNo;

    private Integer addressId;

    private Address address;
}
