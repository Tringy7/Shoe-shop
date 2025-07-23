package com.studio.Design.service;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
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
    private ModelMapper modelMapper;

    public UserService(UserRepository userRepository, RoleService roleService, PasswordEncoder passwordEncoder, ModelMapper modelMapper) {
        this.userRepository = userRepository;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
        this.modelMapper = modelMapper;
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

    public User getUser(Long id) {
        return this.userRepository.findById(id).get();
    }

    @Transactional
    public void updateUser(User user) {
        Optional<User> tempUser = this.userRepository.findById(user.getId());
        if (tempUser.isPresent()) {
            User temp = tempUser.get();
            temp = modelMapper.map(user, User.class);
            this.userRepository.save(temp);
        }
    }

    @Transactional
    public void deleteUser(Long id) {
        Optional<User> user = this.userRepository.findById(id);
        if (user.isPresent()) {
            this.userRepository.deleteById(id);
        }
    }
}
