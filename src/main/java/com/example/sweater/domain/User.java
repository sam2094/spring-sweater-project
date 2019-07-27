package com.example.sweater.domain;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "usr")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NotBlank(message = "Username cannot be empty") // проверка на пустоту
    private String username;
    @NotBlank(message = "Password cannot be empty")
    private String password;
    @Transient // так как получать и создавать повтор пароля не нужно данная аннотация сообщает Hibernate не делать этого
    @NotBlank(message = "Password confirmation cannot be empty")
    private String password2;
    private boolean active;
    @Email(message = "Email is not correct") // проверка на валидность почты
    @NotBlank(message = "Email cannot be empty")
    private  String email;
    private String activationCode;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    @ElementCollection(targetClass = Role.class,fetch = FetchType.EAGER)
// Embedded объекты Embedded объект – это объект, который не имеет собственной identity, а зависит от другой сущности
// Для определения коллекции embedded объектов используется ElementCollection. Декларирование отображения embedded похоже на OneToMany, за исключением того, что целевая таблица является Embeddable, а не сущностью. Это позволяет проще объявлять коллекции простых объектов, без необходимости определения обратных связей и внесения Id.
// Отличием ElementCollection от OneToMany служит то, что целевые объекты нельзя выбирать, сохранять, мержить напрямую, не зависимо от родительского объекта
    @CollectionTable(name = "user_role",joinColumns = @JoinColumn(name = "user_id")) // аннотация используется для указания таблицы базы данных, в которой хранятся значения базовой или встраиваемой коллекции типов.
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    public boolean isAdmin(){
        return roles.contains(Role.ADMIN);
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() { //Этот метод предоставляет массив объектов GrantedAuthority. Очевидно, что GrantedAuthority это полномочия, которые предоставляются пользователю. Такие полномочия (как правило называемые "роли"), как ROLE_ADMINISTRATOR или ROLE_HR_SUPERVISOR
        return getRoles();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
