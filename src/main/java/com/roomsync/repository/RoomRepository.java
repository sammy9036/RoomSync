package com.roomsync.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.roomsync.entity.Room;
import java.util.List;

public interface RoomRepository extends JpaRepository<Room, Long> {

    List<Room> findByAreaId(Long areaId);

    List<Room> findByOwnerId(Long ownerId);

    List<Room> findByRentBetween(int min, int max);
}
