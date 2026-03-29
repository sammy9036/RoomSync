package com.roomsync.websocket;

import com.roomsync.dto.ChatMessageDto;
import com.roomsync.entity.ChatMessage;
import com.roomsync.entity.User;
import com.roomsync.service.ChatService;
import com.roomsync.service.UserService;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.time.LocalDateTime;

@Controller
public class ChatWebSocketController {

    private final SimpMessagingTemplate messagingTemplate;
    private final ChatService chatService;
    private final UserService userService;

    public ChatWebSocketController(SimpMessagingTemplate messagingTemplate,
                                   ChatService chatService,
                                   UserService userService) {
        this.messagingTemplate = messagingTemplate;
        this.chatService = chatService;
        this.userService = userService;
    }

    @MessageMapping("/chat.send")
    public void send(ChatMessageDto dto) {

        User sender = userService.findById(dto.getSenderId()).orElseThrow();
        User receiver = userService.findById(dto.getReceiverId()).orElseThrow();

        // Save in DB
        ChatMessage msg = new ChatMessage();
        msg.setSender(sender);
        msg.setReceiver(receiver);
        msg.setMessage(dto.getMessage());
        msg.setTimestamp(LocalDateTime.now());
        chatService.save(msg);

        // Send to RECEIVER
        messagingTemplate.convertAndSendToUser(
                receiver.getId().toString(),
                "/queue/messages",
                dto
        );

        // Send to SENDER (so sender also sees instantly)
        messagingTemplate.convertAndSendToUser(
                sender.getId().toString(),
                "/queue/messages",
                dto
        );
    }

}
