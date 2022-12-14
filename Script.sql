--drop table executor ,gener ,gener_executor ,album ,track ,executor_album ,compilation, compilation_track  

CREATE  TABLE gener(
gener_id SERIAL PRIMARY KEY,
gener_name varchar(90) NOT NULL 
);

CREATE TABLE executor(
executor_id SERIAL PRIMARY KEY,
executor_name varchar(90) NOT NULL 
);

CREATE TABLE gener_executor(
gener_id SERIAL REFERENCES gener(gener_id),
executor_id SERIAL REFERENCES executor(executor_id),
CONSTRAINT gener_executor_pkey PRIMARY KEY (gener_id, executor_id)
);

CREATE TABLE album(
album_id SERIAL PRIMARY KEY,
album_name varchar(90) NOT NULL ,
album_date date
);

CREATE TABLE executor_album(
album_id SERIAL REFERENCES album(album_id),
executor_id SERIAL REFERENCES executor(executor_id),
CONSTRAINT executor_album_pkey PRIMARY KEY (album_id, executor_id) 
);

CREATE TABLE track (
track_id SERIAL PRIMARY KEY,
track_name varchar(90) NOT NULL, 
track_time time NOT NULL,
track_album Serial REFERENCES album(album_id)
);

CREATE TABLE compilation(
compilation_id SERIAL PRIMARY KEY,
compilation_name varchar(90) NOT NULL,
compilation_year date NOT NULL
);

create table compilation_track(
compilation_id SERIAL references compilation(compilation_id),
track_id SERIAL references track(track_id),
constraint compilation_track_pkey primary key (compilation_id, track_id)
);