package ru.yandex.practicum.filmorate.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.yandex.practicum.filmorate.exception.NotFoundException;
import ru.yandex.practicum.filmorate.model.Film;
import ru.yandex.practicum.filmorate.model.User;
import ru.yandex.practicum.filmorate.storage.friend.FriendDbStorage;
import ru.yandex.practicum.filmorate.storage.user.UserDbStorage;

import java.util.Collection;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
    @Autowired
    private final UserDbStorage userDbStorage;
    @Autowired
    private final FriendDbStorage friendDbstorage;

    public Collection<User> findAll() {
        return userDbStorage.findAll();
    }

    public User create(User newUser) {
        return userDbStorage.create(newUser);
    }

    public User update(User newUser) {
        return userDbStorage.update(newUser);
    }

    public void addFriend(Long userId, Long friendId) {
        friendDbstorage.addFriend(userId, friendId);
    }

    public void deleteById(Long id) {
        userDbStorage.deleteById(id);
    }

    public void deleteFriend(Long userId, Long friendId) {
        friendDbstorage.deleteFriend(userId, friendId);
    }

    public Collection<User> findFriends(Long id) {
        return friendDbstorage.findFriends(id);
    }

    public Collection<User> findCommonFriends(Long userId, Long otherId) {
        return friendDbstorage.findCommonFriends(userId, otherId);
    }

    public User getUser(Long id) {
        return userDbStorage.getUser(id);
    }
}
