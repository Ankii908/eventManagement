package com.management.eventManagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.management.eventManagement.entity.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

    boolean existsByUsernameAndEventId(String username, Long eventId);
    List<Booking> findByUsername(String username);
	List<Booking> findByEventId(Long eventId);
}