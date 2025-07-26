package com.studio.Design.domain.dto;

import java.util.List;
import java.util.Optional;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductCriterialDTO {

    private Optional<String> page;
    private Optional<List<String>> brand;
    private Optional<List<String>> size;
    private Optional<List<String>> color;
    private Optional<String> sort;

}
