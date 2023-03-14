package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class StudentModel implements Serializable {
    private String firstName;
    private String lastName;
    private String fatherName;
    private String motherName;
    private String email;
    private String gender;
    private String qualification;
    private String rollNo;
    private String dateOfBirth;
    private String maritalStatus;
    private MultipartFile studentPhoto;
    private MultipartFile studentSignature;
    private String mobileNo;

}
