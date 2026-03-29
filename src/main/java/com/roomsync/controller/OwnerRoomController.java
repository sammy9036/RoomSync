package com.roomsync.controller;

import com.roomsync.entity.Area;
import com.roomsync.entity.Room;
import com.roomsync.entity.User;
import com.roomsync.service.AreaService;
import com.roomsync.service.RoomService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/owner/rooms")
public class OwnerRoomController {

    private final RoomService roomService;
    private final AreaService areaService;

    public OwnerRoomController(RoomService roomService, AreaService areaService) {
        this.roomService = roomService;
        this.areaService = areaService;
    }

    // Show Add Room Form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("room", new Room());
        model.addAttribute("areas", areaService.findByCity(1L)); // TEMP: city id = 1
        return "owner/add-room";
    }

    // Save Room
    @PostMapping("/add")
    public String saveRoom(@ModelAttribute Room room, Authentication authentication) {

        // Get logged-in user
        User user = ((com.roomsync.security.CustomUserDetails) authentication.getPrincipal()).getUser();

        room.setOwner(user);
        roomService.save(room);

        return "redirect:/owner/rooms/my";
    }

    // List my rooms
    @GetMapping("/my")
    public String myRooms(Model model, Authentication authentication) {

        User user = ((com.roomsync.security.CustomUserDetails) authentication.getPrincipal()).getUser();

        model.addAttribute("rooms", roomService.findByOwner(user.getId()));

        return "owner/my-rooms";
    }

    // Delete room
    @GetMapping("/delete/{id}")
    public String deleteRoom(@PathVariable Long id, Authentication authentication) {

        User user = ((com.roomsync.security.CustomUserDetails) authentication.getPrincipal()).getUser();

        Room room = roomService.findById(id).orElseThrow();

        // SECURITY CHECK
        if (!room.getOwner().getId().equals(user.getId())) {
            throw new RuntimeException("Not allowed");
        }

        roomService.deleteById(id);

        return "redirect:/owner/rooms/my";
    }
}
