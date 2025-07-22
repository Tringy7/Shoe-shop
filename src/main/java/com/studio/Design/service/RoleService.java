package com.studio.Design.service;

import org.springframework.stereotype.Service;

import com.studio.Design.domain.Role;
import com.studio.Design.repository.RoleRepository;

@Service
public class RoleService {

    private RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role getRoleById(Long id) {
        return this.roleRepository.findById(id).get();
    }
}
