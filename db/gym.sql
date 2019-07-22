DROP TABLE gym_class_members;
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
  price INT8
);

CREATE TABLE gym_class_members
(
  id SERIAL8 primary key,
  member_id INT8 references members(id),
  gym_class_id INT8 references gym_classes(id)
);
