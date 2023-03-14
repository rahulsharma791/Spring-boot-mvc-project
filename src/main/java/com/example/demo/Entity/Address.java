package com.example.demo.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "address")
@Entity
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id",nullable = false)
    private Integer addressId;
    @Column(name = "plot_no",nullable = false)
    private String plotNo;
    @Column(name = "city",nullable = false)
    private String city;
    @Column(name = "district",nullable = false)
    private String district;
    @Column(name = "state",nullable = false)
    private String state;
    @Column(name = "pin_code",nullable = false)
    private String pinCode;

}
