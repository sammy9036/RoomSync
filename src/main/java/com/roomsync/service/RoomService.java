package com.roomsync.service;

import com.roomsync.entity.Room;
import java.util.List;
import java.util.Optional;

public interface RoomService {

    Room save(Room room);

    List<Room> findByOwner(Long ownerId);

    Optional<Room> findById(Long id);
    
    void deleteById(Long id);
    
    List<Room> findAll();
    List<Room> findByArea(Long areaId);


}
