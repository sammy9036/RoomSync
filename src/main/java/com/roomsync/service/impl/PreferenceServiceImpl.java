package com.roomsync.service.impl;

import com.roomsync.entity.Preference;
import com.roomsync.repository.PreferenceRepository;
import com.roomsync.service.PreferenceService;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PreferenceServiceImpl implements PreferenceService {

    private final PreferenceRepository preferenceRepository;

    public PreferenceServiceImpl(PreferenceRepository preferenceRepository) {
        this.preferenceRepository = preferenceRepository;
    }

    @Override
    public Optional<Preference> findByUser(Long userId) {
        return preferenceRepository.findByUserId(userId);
    }

    @Override
    public Preference save(Preference preference) {
        return preferenceRepository.save(preference);
    }
}
