DROP TABLE bookings;
DROP TABLE sessions;
DROP TABLE workshops;
DROP TABLE members;

CREATE TABLE members(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  email VARCHAR(255)
);

CREATE TABLE workshops(
  id  SERIAL PRIMARY KEY,
  type VARCHAR(255),
  instructor VARCHAR
);

CREATE TABLE sessions(
  id SERIAL PRIMARY KEY,
  workshop_id INT REFERENCES workshops(id) ON DELETE CASCADE,
  start_time VARCHAR(255),
  start_date VARCHAR(255),
  capacity INT
);

CREATE TABLE bookings(
  id SERIAL PRIMARY KEY,
  member_id INT REFERENCES members(id) ON DELETE CASCADE,
  session_id INT REFERENCES sessions(id) ON DELETE CASCADE
);
