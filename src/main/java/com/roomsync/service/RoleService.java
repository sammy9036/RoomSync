package com.roomsync.service;

import com.roomsync.entity.Role;
import java.util.Optional;

public interface RoleService {
    Optional<Role> findByName(String name);
}
