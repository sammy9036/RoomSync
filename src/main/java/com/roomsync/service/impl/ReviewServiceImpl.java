package com.roomsync.service.impl;

import com.roomsync.entity.Review;
import com.roomsync.repository.ReviewRepository;
import com.roomsync.service.ReviewService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    private final ReviewRepository reviewRepository;

    public ReviewServiceImpl(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    @Override
    public Review save(Review review) {
        return reviewRepository.save(review);
    }

    @Override
    public List<Review> findByRoom(Long roomId) {
        return reviewRepository.findByRoomId(roomId);
    }
}
