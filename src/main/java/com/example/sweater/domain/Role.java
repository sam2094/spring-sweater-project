package com.example.sweater.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority { //GrantedAuthority это полномочия, которые предоставляются пользователю
    USER,ADMIN;
    @Override
    public String getAuthority() {
        return name();  // в абстрактном классе Enum это единственный метод , возвращающий имя
    }
}
