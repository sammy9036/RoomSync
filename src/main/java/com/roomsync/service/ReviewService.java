package com.roomsync.service;

import com.roomsync.entity.Review;
import java.util.List;

public interface ReviewService {
    Review save(Review review);
    List<Review> findByRoom(Long roomId);
}
