package com.management.eventManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.management.eventManagement.entity.Booking;
import com.management.eventManagement.entity.Events;
import com.management.eventManagement.service.BookingService;
import com.management.eventManagement.service.EventsService;


@Controller
public class AdminController {

    @Autowired
    private EventsService eventService;
    
    @Autowired
    private BookingService bookingService;

    @GetMapping("/admin/dashboard")
    public String adminDashboard(Model model) {
        model.addAttribute("event", new Events());
        return "admindashboard";
    }

    @GetMapping("/admin/events")
    public String adminEvents(Model model) {

        List<Events> events = eventService.getAllEvents();
        model.addAttribute("events", events);
        return "adminevents";
    }
    
    @PostMapping("/admin/createEvent")
    public String createEvent(Events event, Model model) {
        eventService.createEvents(event);
        return "redirect:/admin/dashboard";
    }
        
    @GetMapping("/admin/event/users")
    public String viewUsers(@RequestParam Long eventId,
                            Model model) {

        Events event = eventService.getEventsById(eventId);

        List<Booking> booking =
                bookingService.getUsersByEventId(eventId);

        model.addAttribute("events", eventService.getAllEvents());
        model.addAttribute("selectedEvent", event);
        model.addAttribute("registeredUsers", booking);

        return "adminevents";
    }       
   
}