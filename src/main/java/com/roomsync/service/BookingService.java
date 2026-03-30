package com.roomsync.service;

import com.roomsync.entity.Booking;
import com.roomsync.repository.BookingRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;

    public BookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public List<Booking> getBookingsForOwner(Long ownerId) {
        return bookingRepository.findByRoomOwnerId(ownerId);
    }
}