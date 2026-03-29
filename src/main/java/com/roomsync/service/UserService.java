package com.roomsync.service;

import com.roomsync.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

    User save(User user);

    Optional<User> findByEmail(String email);

    Optional<User> findByPhone(String phone);

    Optional<User> findById(Long id);
    
    List<User> findAll();
    void blockUser(Long id);
    void unblockUser(Long id);

}
