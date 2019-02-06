DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses(
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE students(
  id serial4 primary key,
  first_name varchar(255),
  second_name varchar(255),
  house_id INT4 REFERENCES houses(id) ON DELETE CASCADE,
  age INT4
);
