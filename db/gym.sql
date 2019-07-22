DROP TABLE gym_classes;
DROP TABLE members;

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE gym_classes
(
  id SERIAL8 primary key,
  class_name VARCHAR(255),
  price INT8,
  member_id INT8 references members(id)
);
