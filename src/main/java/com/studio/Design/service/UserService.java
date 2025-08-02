package com.studio.Design.service;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Description;
import com.studio.Design.domain.Role;
import com.studio.Design.domain.User;
import com.studio.Design.domain.dto.UserDTO;
import com.studio.Design.repository.DescriptionRepository;
import com.studio.Design.repository.UserRepository;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserService {

    private UserRepository userRepository;
    private RoleService roleService;
    private PasswordEncoder passwordEncoder;
    private ModelMapper modelMapper;
    private DescriptionRepository descRepository;

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    @Transactional
    public void createUser(User user) {
        Long temp = user.getRole().getId();
        Role role = this.roleService.getRoleById(temp);
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

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public boolean checkEmail(UserDTO user) {
        return this.userRepository.existsByEmail(user.getEmail());
    }

    @Transactional
    public void createNewUser(UserDTO userDTO) {
        User user = User.builder()
                .email(userDTO.getEmail())
                .password(this.passwordEncoder.encode(userDTO.getPassword()))
                .fullName(userDTO.getName())
                .build();
        this.userRepository.save(user);
    }

    @Transactional
    public void handleContact(User temp, User user, String mess) {
        temp.setFullName(user.getFullName());
        this.userRepository.save(temp);
        Description desc = new Description();
        desc.setDescription(mess);
        desc.setUser(temp);
        this.descRepository.save(desc);
    }
}
