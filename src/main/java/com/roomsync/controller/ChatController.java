package com.roomsync.controller;

import com.roomsync.entity.User;
import com.roomsync.security.CustomUserDetails;
import com.roomsync.service.ChatService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChatController {

    private final ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    // For SEEKER and OWNER both
    @GetMapping({"/user/chat/{otherUserId}", "/owner/chat/{otherUserId}"})
    public String openChat(@PathVariable Long otherUserId,
                           Authentication authentication,
                           Model model) {

        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        User me = cud.getUser();

        model.addAttribute("meId", me.getId());
        model.addAttribute("otherId", otherUserId);

        model.addAttribute("messages",
                chatService.getConversation(me.getId(), otherUserId));

        return "chat/chat"; // THIS MAPS TO templates/chat/chat.html
    }
}
