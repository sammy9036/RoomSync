package com.roomsync.service.impl;

import com.roomsync.entity.Room;
import com.roomsync.repository.RoomRepository;
import com.roomsync.service.RoomService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoomServiceImpl implements RoomService {

    private final RoomRepository roomRepository;

    public RoomServiceImpl(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    @Override
    public Room save(Room room) {
        return roomRepository.save(room);
    }


    @Override
    public List<Room> findByOwner(Long ownerId) {
        return roomRepository.findByOwnerId(ownerId);
    }

    @Override
    public Optional<Room> findById(Long id) {
        return roomRepository.findById(id);
    }
    
    @Override
    public void deleteById(Long id) {
        roomRepository.deleteById(id);
    }

    @Override
    public List<Room> findAll() {
        return roomRepository.findAll();
    }

    @Override
    public List<Room> findByArea(Long areaId) {
        return roomRepository.findByAreaId(areaId);
    }

	@Override
	public List<Room> getRoomsByOwner(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
