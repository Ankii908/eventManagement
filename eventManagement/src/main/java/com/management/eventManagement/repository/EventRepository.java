package com.management.eventManagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.management.eventManagement.entity.Events;

@Repository
public interface EventRepository extends JpaRepository<Events, Long> {

}