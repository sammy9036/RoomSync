package com.roomsync.service;

import com.roomsync.entity.Preference;
import java.util.Optional;

public interface PreferenceService {
    Optional<Preference> findByUser(Long userId);
    Preference save(Preference preference);
}
