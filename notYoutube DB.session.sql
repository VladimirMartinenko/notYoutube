CREATE TABLE users_notYuotube(
  id bigserial primary key,
  first_name VARCHAR(64) NOT NULL check(first_name != ''),
  last_name VARCHAR(64) NOT NULL check(last_name != ''),
  email VARCHAR(100) NOT NULL UNIQUE check (email ~ '^[A-Za-z0-9]\w{0,}@[a-z{1,}\.[a-z]{1,}$'),
  birthday date NOT NULL check (age(birthday) < INTERVAL '120 years'AND birthday <(current_date + interval '1 day'))
);
DROP TABLE users_notYuotube;

CREATE TABLE video (
  id serial primary key,
  title VARCHAR(256) NOT NULL check(title !=''),
  category VARCHAR(256) NOT NULL check(category !=''),
  created_video timestamp NOT NULL DEFAULT CURRENT_DATE,
  user_id int NOT NULL REFERENCES users_notYuotube(id)
);

DROP TABLE video;

CREATE TABLE coments(
  id serial PRIMARY KEY,
  created_coments timestamp NOT NULL DEFAULT CURRENT_DATE,
  body_coments VARCHAR(500) NOT NULL check(body_coments !=''),
  user_id int NOT NULL REFERENCES users_notYuotube(id),
  video_id int NOT NULL REFERENCES video(id)
);

CREATE TABLE like_video(
  isLike BOOLEAN,
  video_id int NOT NULL REFERENCES video(id),
  user_id int NOT NULL REFERENCES users_notYuotube(id)
 );