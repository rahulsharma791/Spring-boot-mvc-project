package com.example.demo.repository;

import com.example.demo.Entity.Address;
import com.example.demo.Entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends JpaRepository<Address, Integer> {

    @Query("select a.addressId from Address a where a.plotNo = :plot and a.district = :district and a.city = :city and a.state = :state and a.pinCode = :pinCode")
    public Integer findExistAddress(@Param("plot") String plotNo, @Param("district") String district, @Param("city") String city, @Param("state") String state,
                                    @Param("pinCode") String pinCode);


}
