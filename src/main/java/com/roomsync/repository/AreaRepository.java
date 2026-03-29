package com.roomsync.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.roomsync.entity.Area;
import java.util.List;

public interface AreaRepository extends JpaRepository<Area, Long> {

    List<Area> findByCityId(Long cityId);
}
