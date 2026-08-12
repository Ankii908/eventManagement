package com.management.eventManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.management.eventManagement.entity.Events;
import com.management.eventManagement.repository.EventRepository;

@Service
public class EventServiceImpl implements EventsService {

    @Autowired
    private EventRepository eventRepository;

    @Override
    public Events createEvents(Events events) {
    	 return eventRepository.save(events);
    }
    

    @Override
    public List<Events> getAllEvents() {
        return eventRepository.findAll();
    }

    @Override
    public Events getEventsById(Long id) {
        return eventRepository.findById(id)
                .orElse(null);
    }

    @Override
    public void deleteEvents(Long id) {
       eventRepository.deleteById(id);
    }



	
}