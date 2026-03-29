package com.roomsync.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.roomsync.entity.Review;
import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    List<Review> findByRoomId(Long roomId);
}
