--
-- Class User as table users
--

CREATE TABLE users (
  "id" serial,
  "username" text NOT NULL
);

ALTER TABLE ONLY users
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


