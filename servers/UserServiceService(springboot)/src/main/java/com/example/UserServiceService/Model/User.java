package com.example.UserServiceService.Model;


import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document("user")
public class User {

    @JsonSerialize(using = ToStringSerializer.class)
    @Id
    ObjectId id;

    String name;


    String image;

    Integer age;

    String email;

    String password;

    public User(String name, String email, String password, Integer age) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.age = age;
    }

    public ObjectId getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getAge() {
        return age;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getImage() {
        return image;
    }

    @DBRef
    private List<Medication> medications;


    @DBRef
    private List<MedicalReport> medicalReports;
    @DBRef
    private List<Appointment> appointments;
    @DBRef
    private List<Payment> payments;
    @DBRef
    private List<VirtualConsultation> virtualConsultations;




}
