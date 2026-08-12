package com.management.eventManagement.service;

import java.util.List;

import com.management.eventManagement.entity.Events;

public interface EventsService {

    Events createEvents(Events Events);

    List<Events> getAllEvents();

    Events getEventsById(Long id);

    void deleteEvents(Long id);
}