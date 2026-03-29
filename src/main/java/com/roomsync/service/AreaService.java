package com.roomsync.service;

import com.roomsync.entity.Area;
import java.util.List;

public interface AreaService {
    List<Area> findByCity(Long cityId);
}
