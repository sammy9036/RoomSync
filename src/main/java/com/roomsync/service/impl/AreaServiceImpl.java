package com.roomsync.service.impl;

import com.roomsync.entity.Area;
import com.roomsync.repository.AreaRepository;
import com.roomsync.service.AreaService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {

    private final AreaRepository areaRepository;

    public AreaServiceImpl(AreaRepository areaRepository) {
        this.areaRepository = areaRepository;
    }

    @Override
    public List<Area> findByCity(Long cityId) {
        return areaRepository.findByCityId(cityId);
    }
}
