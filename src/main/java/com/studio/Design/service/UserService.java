package com.studio.Design.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studio.Design.domain.Role;
import com.studio.Design.domain.User;
import com.studio.Design.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class UserService {

    private UserRepository userRepository;
    private RoleService roleService;

    public UserService(UserRepository userRepository, RoleService roleService) {
        this.userRepository = userRepository;
        this.roleService = roleService;
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    @Transactional
    public void createUser(User user) {
        Role role = this.roleService.getRoleById(user.getRole().getId());
        if (role != null) {
            this.userRepository.save(user);
        }
    }
}
