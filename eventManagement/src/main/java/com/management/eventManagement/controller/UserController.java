package com.management.eventManagement.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.management.eventManagement.entity.Events;
import com.management.eventManagement.entity.User;
import com.management.eventManagement.repository.UserRepository;
import com.management.eventManagement.service.BookingService;
import com.management.eventManagement.service.EventsService;

@Controller
public class UserController {

    @Autowired
    private EventsService eventService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private UserRepository userRepository;


    @GetMapping("/userdashboard")
    public String userdashboard( Authentication authentication, Model model) {

        String username = authentication.getName();
        model.addAttribute( "events", eventService.getAllEvents());

        Set<Long> bookedEventIds = bookingService.getBookedEventIds(username);

        model.addAttribute(  "bookedEventIds",  bookedEventIds);
        return "userdashboard";
    }


    @PostMapping("/bookEvent")
    public String bookEvent( @RequestParam("eventId") Long eventId, Authentication authentication,RedirectAttributes redirectAttributes) {
        String username = authentication.getName();
        try {
            // Get logged-in user
            User user = userRepository .findByUsername(username)
            		.orElseThrow(() ->new RuntimeException( "User not found."));

            // Get selected event
            Events event =  eventService.getEventsById(eventId);

            if (event == null) {
                redirectAttributes.addFlashAttribute( "bookingError","Event not found.");
                return "redirect:/userdashboard";
            }

            // Check duplicate booking
            if (bookingService.isAlreadyBooked(username, eventId)) {

                redirectAttributes.addFlashAttribute(
                        "bookingError",
                        "You have already booked this event.");

                return "redirect:/dashboard";
            }

            // Save booking
            bookingService.bookEvent(username, event,user.getEmail()  );

            redirectAttributes.addFlashAttribute(
                    "bookingSuccess",
                    "Event booked successfully!");

        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "bookingError",
                    "Booking failed: " + e.getMessage());
        }

        return "redirect:/userdashboard";
    }
}