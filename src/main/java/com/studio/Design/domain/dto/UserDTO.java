package com.studio.Design.domain.dto;

import com.studio.Design.service.validator.PasswordValidator;
import com.studio.Design.service.validator.RegisterChecked;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@RegisterChecked
public class UserDTO {

    @NotBlank(message = "Name is not valid")
    private String name;
    @PasswordValidator
    private String password;
    @Email
    @NotBlank(message = "Email is not valid")
    private String email;
    private String confirmPassword;
}
