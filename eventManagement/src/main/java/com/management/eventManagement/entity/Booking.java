package com.management.eventManagement.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;


@Entity
@Data
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;

    private String userEmail;

    private Long eventId;

    private String eventName;

    private LocalDate eventDate;

    private String eventLocation;

    private LocalDateTime bookingDate;
    
    

    
}