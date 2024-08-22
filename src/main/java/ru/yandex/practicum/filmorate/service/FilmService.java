package ru.yandex.practicum.filmorate.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.yandex.practicum.filmorate.model.Film;
import ru.yandex.practicum.filmorate.storage.film.FilmDbStorage;
import ru.yandex.practicum.filmorate.storage.likes.LikeDbStorage;

import java.util.Collection;

@Slf4j
@RequiredArgsConstructor
@Service
public class FilmService {
    @Autowired
    private final FilmDbStorage filmDbStorage;
    @Autowired
    private final LikeDbStorage likeDbStorage;

    public Collection<Film> findAll() {
        return filmDbStorage.findAll();
    }

    public Film findFilm(Long id) {
        return filmDbStorage.getFilm(id);
    }

    public Film create(Film newFilm) {
        return filmDbStorage.create(newFilm);
    }

    public Film update(Film newFilm) {
        return filmDbStorage.update(newFilm);
    }

    public void deleteById(Long filmId) {
        filmDbStorage.deleteById(filmId);
    }

    public void like(Long id, Long userId) {
        likeDbStorage.like(id, userId);
    }

    public void removeLike(Long id, Long userId) {
        likeDbStorage.removeLike(id, userId);
    }

    public Collection<Film> topFilms(int count) {
        return likeDbStorage.topFilms(count);
    }
}
