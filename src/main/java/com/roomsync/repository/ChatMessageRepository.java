package com.roomsync.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.roomsync.entity.ChatMessage;
import java.util.List;

public interface ChatMessageRepository extends JpaRepository<ChatMessage, Long> {

    List<ChatMessage> findBySenderIdAndReceiverId(Long senderId, Long receiverId);
}
