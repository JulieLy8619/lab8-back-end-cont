DROP TABLE locations, weathers, yelp, tmdb, meetup, hiking;

CREATE TABLE IF NOT EXISTS locations ( 
    id SERIAL PRIMARY KEY,
    search_query VARCHAR(255),
    formatted_query VARCHAR(255),
    latitude NUMERIC(8, 6),
    longitude NUMERIC(9, 6)
  );

CREATE TABLE IF NOT EXISTS weathers ( 
    id SERIAL PRIMARY KEY,
    forecast VARCHAR(255), 
    time VARCHAR(255),
    created_at BIGINT,
    location_id INTEGER NOT NULL REFERENCES locations(id)
  );

CREATE TABLE IF NOT EXISTS yelp (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255), 
    created_at BIGINT,
    rating NUMERIC(3, 0),
    price VARCHAR(255),
    image_url VARCHAR(255),
    location_id INTEGER NOT NULL REFERENCES locations(id)
  );

CREATE TABLE IF NOT EXISTS tmdb (
    id SERIAL PRIMARY KEY,
    created_at BIGINT,
    title VARCHAR(255),
    released_on BIGINT,
    total_votes NUMERIC(8, 0),
    average_votes NUMERIC(8, 0),
    popularity NUMERIC(8, 0),
    image_url VARCHAR(255),
    overview VARCHAR(2000),
    location_id INTEGER NOT NULL REFERENCES locations(id)
  );

CREATE TABLE IF NOT EXISTS meetup (
    id SERIAL PRIMARY KEY,
    created_at BIGINT,
    link VARCHAR(255),
    name VARCHAR(255),
    host VARCHAR(255),
    creation_date BIGINT,
    location_id INTEGER NOT NULL REFERENCES locations(id)
  );

CREATE TABLE IF NOT EXISTS hiking (
    id SERIAL PRIMARY KEY,
    created_at BIGINT,
    trail_url VARCHAR(255),
    name VARCHAR(255),
    location VARCHAR(255),
    length NUMERIC(4, 0),
    condition_date BIGINT,
    condition_time BIGINT,
    conditions VARCHAR(255),
    stars NUMERIC(8, 0),
    star_votes NUMERIC(8, 0),
    summary VARCHAR(2000),
    location_id INTEGER NOT NULL REFERENCES locations(id)
  );