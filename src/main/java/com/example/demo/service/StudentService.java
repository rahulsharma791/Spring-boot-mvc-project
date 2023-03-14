package com.example.demo.service;

import com.example.demo.Entity.Address;
import com.example.demo.Entity.Student;
import com.example.demo.model.AddressModel;
import com.example.demo.model.FetchStudentModel;
import com.example.demo.model.StudentListModel;
import com.example.demo.model.StudentModel;
import com.example.demo.repository.AddressRepository;
import com.example.demo.repository.StudentRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private AddressRepository addressRepository;
    @Autowired
    private ModelMapper modelMapper;

    public void addStudent(StudentModel studentModel, AddressModel addressModel) throws IOException, SQLException {
        Student student = new Student();
        student.setName(studentModel.getFirstName() + " " + studentModel.getLastName());
        student.setFatherName(studentModel.getFatherName());
        student.setMotherName(studentModel.getMotherName());
        student.setEmail(studentModel.getEmail());
        student.setGender(studentModel.getGender());
        student.setQualification(studentModel.getQualification());
        student.setRollNo(studentModel.getRollNo());
        student.setDateOfBirth(studentModel.getDateOfBirth());
        student.setMaritalStatus(studentModel.getMaritalStatus());
        student.setMobileNo(studentModel.getMobileNo());

        byte[] contentPhoto = studentModel.getStudentPhoto().getBytes();
        Blob blobP = new SerialBlob(contentPhoto);
        student.setStudentPhoto(blobP);

        byte[] contentSignature = studentModel.getStudentSignature().getBytes();
        Blob blobS = new SerialBlob(contentSignature);
        student.setStudentSignature(blobS);

        Integer getAddressId = addressRepository.findExistAddress(addressModel.getPlotNo(), addressModel.getDistrict(), addressModel.getCity(), addressModel.getState(),
                addressModel.getPinCode());
        if (getAddressId == null) {
            Address address = new Address();
            address.setPlotNo(addressModel.getPlotNo());
            address.setCity(addressModel.getCity());
            address.setDistrict(addressModel.getDistrict());
            address.setState(addressModel.getState());
            address.setPinCode(addressModel.getPinCode());

            Address address1 = addressRepository.save(address);

            getAddressId = address1.getAddressId();
        }
        student.setAddressId(getAddressId);
        studentRepository.save(student);
    }

    public List<StudentListModel> allStudentList(String keyword) throws SQLException {
        List<Student> list = null;
        if (keyword == null) {
            list = studentRepository.findAll();
        }else {
            list = studentRepository.findStudentList(keyword);
        }
        List<StudentListModel> studentList = new ArrayList<>();

        for (Student student : list) {
            StudentListModel studentListModel = modelMapper.map(student, StudentListModel.class);
            Blob blobPhoto = student.getStudentPhoto();
            int blobPhotoLength = (int) blobPhoto.length();
            byte[] blobPhotoAsBytes = blobPhoto.getBytes(1, blobPhotoLength);
            studentListModel.setStudentPhotoStr(Base64.getEncoder().encodeToString(blobPhotoAsBytes));

            Blob blobSignature = student.getStudentPhoto();
            int blobSignatureLength = (int) blobSignature.length();
            byte[] blobSignatureAsBytes = blobSignature.getBytes(1, blobSignatureLength);
            studentListModel.setStudentSignatureStr(Base64.getEncoder().encodeToString(blobSignatureAsBytes));

            studentList.add(studentListModel);
        }
        return studentList;
    }
    public FetchStudentModel fetchStudentByRollNo(Integer rollNo) throws SQLException {
        Student student = studentRepository.fetchById(rollNo);
        FetchStudentModel fetchStudentModel = modelMapper.map(student, FetchStudentModel.class);

        Blob bolbPhoto = student.getStudentPhoto();
        int blobLengthOfPhoto = (int) bolbPhoto.length();
        byte[] blobPhotoAsBytes = bolbPhoto.getBytes(1, blobLengthOfPhoto);
        fetchStudentModel.setStudentPhotoStr(Base64.getEncoder().encodeToString(blobPhotoAsBytes));

        Blob bolbSignature = student.getStudentSignature();
        int blobLengthOfSignature = (int) bolbSignature.length();
        byte[] blobSignatureAsBytes = bolbSignature.getBytes(1, blobLengthOfSignature);
        fetchStudentModel.setStudentSignatureStr(Base64.getEncoder().encodeToString(blobSignatureAsBytes));

        fetchStudentModel.setSName(student.getName());

        return fetchStudentModel;
    }

    public void deleteById(Integer sRollNo) {
        studentRepository.deleteById(sRollNo);
    }

    public Boolean isEmailAlreadyExist(String email) {
        Integer count = studentRepository.emailIdExist(email);
        if (count == 0) {
            return false;
        }
        return true;
    }

    public Boolean isMobileNoExist(String mobileNo) {
        Integer count = studentRepository.mobileNoExist(mobileNo);
        if (count == 0) {
            return false;
        }
        return true;
    }
}
