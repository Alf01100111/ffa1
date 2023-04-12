create
    database friends_of_man;
create table animal
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table home_animal
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table pack_animal
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table cat
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table dog
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table donkey
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table hamster
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table horse
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);
create table camel
(
    name       varchar(100),
    birth_year int,
    commands   varchar(100)
);

insert into camel
values ('name1', 1, 'гав'),
       ('name2', 2, 'не гав');

insert into cat
values ('name1', 1, 'гав'),
       ('name2', 2, 'не гав');

insert into dog
values ('name1', 1, 'гав'),
       ('name2', 2, 'не гав');

insert into donkey
values ('name1', 1, 'гав'),
       ('name2', 2, 'не гав');

insert into horse
values ('name1', 1, 'гав'),
       ('name2', 2, 'не гав');

insert into hamster
values ('name1', 1, 'гав'),
       ('name2', 2, 'не гав');

truncate camel;

-- Создать новую таблицу “молодые животные” в которую попадут все
-- животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
-- до месяца подсчитать возраст животных в новой таблице

create table young_animals
(
    name       varchar(100),
    birth_year int,
    commands   varchar
);

insert into young_animals
select *
from (select *
      from camel
      union
      select *
      from hamster
      union
      select *
      from cat
      union
      select *
      from dog
      union
      select *
      from donkey
      union
      select *
      from horse) t;
