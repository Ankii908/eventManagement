package com.management.eventManagement.service;

import java.util.List;
import java.util.Set;

import com.management.eventManagement.entity.Booking;
import com.management.eventManagement.entity.Events;

public interface BookingService {
    Booking bookEvent(String username, Events event, String userEmail);
    boolean isAlreadyBooked(String username, Long eventId);
    Set<Long> getBookedEventIds(String username);
	List<Booking> getUserBookings(String username);
	List<Booking> getUsersByEventId(Long eventId);
}