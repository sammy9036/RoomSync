package com.roomsync.repository;

import com.roomsync.entity.Booking;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookingRepository extends JpaRepository<Booking, Long> {

    // find all bookings related to owner's rooms
    List<Booking> findByRoomOwnerId(Long ownerId);
}