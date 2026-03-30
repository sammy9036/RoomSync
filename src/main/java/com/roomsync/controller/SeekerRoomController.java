package com.roomsync.controller;

import com.roomsync.entity.Review;
import com.roomsync.entity.Room;
import com.roomsync.entity.User;
import com.roomsync.service.AreaService;
import com.roomsync.service.ReviewService;
import com.roomsync.service.RoomService;

import java.time.LocalDateTime;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user/rooms")
public class SeekerRoomController {

    private final RoomService roomService;
    private final AreaService areaService;
    private final ReviewService reviewService;

    public SeekerRoomController(RoomService roomService, AreaService areaService, ReviewService reviewService) {
        this.roomService = roomService;
        this.areaService = areaService;
        this.reviewService = reviewService;
    }

    // Search page
    @GetMapping("/search")
    public String searchPage(Model model) {
        model.addAttribute("areas", areaService.findByCity(1L)); // TEMP: Pune
        model.addAttribute("rooms", roomService.findAll());
        // Points to src/main/webapp/WEB-INF/views/seeker/room_list.jsp
        return "seeker/room_list"; 
    }

    // Filter by area
    @GetMapping("/search/filter")
    public String filterByArea(@RequestParam Long areaId, Model model) {
        model.addAttribute("areas", areaService.findByCity(1L));
        model.addAttribute("rooms", roomService.findByArea(areaId));
        // Points to src/main/webapp/WEB-INF/views/seeker/room_list.jsp
        return "seeker/room_list";
    }
    
    @GetMapping("/view/{id}")
    public String viewRoom(@PathVariable Long id, Model model) {
        Room room = roomService.findById(id).orElseThrow();
        model.addAttribute("room", room);
        model.addAttribute("reviews", reviewService.findByRoom(id));
        // Points to src/main/webapp/WEB-INF/views/seeker/room_detail.jsp
        return "seeker/room_detail";
    }

    @PostMapping("/review")
    public String submitReview(
            @RequestParam Long roomId,
            @RequestParam int rating,
            @RequestParam String comment,
            Authentication authentication
    ) {
        User user = ((com.roomsync.security.CustomUserDetails) authentication.getPrincipal()).getUser();

        // FETCH REAL ROOM FROM DB
        Room room = roomService.findById(roomId).orElseThrow();

        Review review = new Review();
        review.setRoom(room);
        review.setUser(user);
        review.setRating(rating);
        review.setComment(comment);
        review.setCreatedAt(LocalDateTime.now());

        reviewService.save(review);

        return "redirect:/user/rooms/view/" + roomId;
    }
}