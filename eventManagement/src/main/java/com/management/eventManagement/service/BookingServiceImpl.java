package com.management.eventManagement.service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.management.eventManagement.entity.Booking;
import com.management.eventManagement.entity.Events;
import com.management.eventManagement.entity.User;
import com.management.eventManagement.repository.BookingRepository;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Override
    public Booking bookEvent(String username,Events event, String userEmail) {
        if (bookingRepository.existsByUsernameAndEventId(
                username, event.getId())) {
            throw new RuntimeException(
                    "You have already booked this event.");
        }
        Booking booking = new Booking();
        booking.setUsername(username);
        booking.setUserEmail(userEmail);
        booking.setEventId(event.getId());
        booking.setEventName(event.getEventName());
        booking.setEventDate(event.getEventDate());
        booking.setEventLocation(event.getEventLocation());
        booking.setBookingDate(LocalDateTime.now());
        return bookingRepository.save(booking);
    }

    @Override
    public boolean isAlreadyBooked(String username, Long eventId) {

        return bookingRepository.existsByUsernameAndEventId(
                username, eventId);
    }

    @Override
    public Set<Long> getBookedEventIds(String username) {
        List<Booking> bookings =
                bookingRepository.findByUsername(username);
        Set<Long> eventIds = new HashSet<>();

        for (Booking booking : bookings) {
            eventIds.add(booking.getEventId());
        }
        return eventIds;
    }

    @Override
    public List<Booking> getUserBookings(String username) {
        return bookingRepository.findByUsername(username);
    }
    
  

    @Override
    public List<Booking> getUsersByEventId(Long eventId) {

        List<Booking> bookings =
                bookingRepository.findByEventId(eventId);

        return bookings;
    }
}