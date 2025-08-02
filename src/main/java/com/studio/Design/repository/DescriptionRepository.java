package com.studio.Design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studio.Design.domain.Description;

public interface DescriptionRepository extends JpaRepository<Description, Long> {

}
