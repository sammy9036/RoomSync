package com.roomsync.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.roomsync.entity.Preference;
import java.util.Optional;

public interface PreferenceRepository extends JpaRepository<Preference, Long> {

    Optional<Preference> findByUserId(Long userId);
}
