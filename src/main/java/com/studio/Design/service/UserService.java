package com.studio.Design.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Role;
import com.studio.Design.domain.User;
import com.studio.Design.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class UserService {

    private UserRepository userRepository;
    private RoleService roleService;
    private PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, RoleService roleService, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    @Transactional
    public void createUser(User user) {
        Role role = this.roleService.getRoleById(user.getRole().getId());
        if (role != null) {
            user.setPassword(this.passwordEncoder.encode(user.getPassword()));
            user.setRole(role);
            this.userRepository.save(user);
        }
    }
}
