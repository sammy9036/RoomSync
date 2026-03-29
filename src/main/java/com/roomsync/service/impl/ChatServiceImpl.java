package com.roomsync.service.impl;

import com.roomsync.entity.ChatMessage;
import com.roomsync.repository.ChatMessageRepository;
import com.roomsync.service.ChatService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {

    private final ChatMessageRepository chatMessageRepository;

    public ChatServiceImpl(ChatMessageRepository chatMessageRepository) {
        this.chatMessageRepository = chatMessageRepository;
    }

    @Override
    public ChatMessage save(ChatMessage message) {
        return chatMessageRepository.save(message);
    }

    @Override
    public List<ChatMessage> getConversation(Long user1, Long user2) {
        return chatMessageRepository.findBySenderIdAndReceiverId(user1, user2);
    }
}
