DROP TABLE IF EXISTS events,
    event_types,
    operations,
    entity_types,
    review_likes,
    reviews,
    friends,
    likes,
    genres_films,
    films,
    directors,
    directors_films,
    genres,
    ratings,
    users,
CASCADE;

CREATE TABLE IF NOT EXISTS users (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(200),
    email VARCHAR(200) NOT NULL,
    login VARCHAR(200) NOT NULL,
    birthday DATE
);

CREATE TABLE IF NOT EXISTS friends (
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    friend_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ratings (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS genres (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS films (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(200),
    description VARCHAR(1000),
    release DATE,
    duration INTEGER NOT NULL,
    rating_id INTEGER, FOREIGN KEY (rating_id) REFERENCES ratings(id)
);

CREATE TABLE IF NOT EXISTS likes (
    film_id INTEGER NOT NULL REFERENCES films(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS genres_films (
    genre_id INTEGER NOT NULL REFERENCES genres(id),
    film_id INTEGER NOT NULL REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS reviews (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    content VARCHAR(MAX),
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    film_id INTEGER NOT NULL REFERENCES films(id) ON DELETE CASCADE,
    is_positive BOOLEAN
);

CREATE TABLE IF NOT EXISTS review_likes (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    review_id INTEGER NOT NULL REFERENCES reviews(id) ON DELETE CASCADE,
    rating INTEGER
);

CREATE TABLE IF NOT EXISTS entity_types (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS operations (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS event_types (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS events (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    entity_id INTEGER,
    entity_type_id INTEGER NOT NULL REFERENCES entity_types(id) ON DELETE CASCADE,
    operation_id INTEGER NOT NULL REFERENCES operations(id) ON DELETE CASCADE,
    event_type_id INTEGER NOT NULL REFERENCES event_types(id) ON DELETE CASCADE,
    datetime TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS directors (
                                         id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
                                         name VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS directors_films (
                                               director_id INTEGER NOT NULL REFERENCES directors(id) ON DELETE CASCADE,
                                               film_id INTEGER NOT NULL REFERENCES films(id) ON DELETE CASCADE
);