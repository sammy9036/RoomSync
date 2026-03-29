package com.roomsync.service;

import com.roomsync.entity.ChatMessage;
import java.util.List;

public interface ChatService {
    ChatMessage save(ChatMessage message);
    List<ChatMessage> getConversation(Long user1, Long user2);
}
