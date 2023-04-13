create table animal
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table home_animal
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table pack_animal
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table cat
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table dog
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table donkey
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table hamster
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table horse
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);
create table camel
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

insert into camel
values ('name1', '2023.01.01', 'гав'),
       ('name2', '2019.01.01', 'не гав');

insert into cat
values ('name1', '2023.01.01', 'гав'),
       ('name2', '2019.01.01', 'не гав');

insert into dog
values ('name1', '2023.01.01', 'гав'),
       ('name2', '2019.01.01', 'не гав');

insert into donkey
values ('name1', '2023.01.01', 'гав'),
       ('name2', '2019.01.01', 'не гав');

insert into horse
values ('name1', '2023.01.01', 'гав'),
       ('name2', '2019.01.01', 'не гав');

insert into hamster
values ('name1', '2023.01.01', 'гав'),
       ('name2', '2019.01.01', 'не гав');

truncate camel;
--
-- -- Создать новую таблицу “молодые животные” в которую попадут все
-- -- животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
-- -- до месяца подсчитать возраст животных в новой таблице
--
drop table if exists young_animals;
create table if not exists young_animals
(
    name       varchar(100),
    birth_year date,
    commands   varchar,
    age        int
);

insert into young_animals
select *
from (select *, now()::date - birth_year
      from camel
      where now()::date - birth_year between 365 and 365 * 3
      union
      select *, now()::date - birth_year
      from hamster
      where now()::date - birth_year between 365 and 365 * 3
      union
      select *, now()::date - birth_year
      from cat
      where now()::date - birth_year between 365 and 365 * 3
      union
      select *, now()::date - birth_year
      from dog
      where now()::date - birth_year between 365 and 365 * 3
      union
      select *, now()::date - birth_year
      from donkey
      where now()::date - birth_year between 365 and 365 * 3
      union
      select *, now()::date - birth_year
      from horse
      where now()::date - birth_year between 365 and 365 * 3) t;

alter table young_animals
    add column age int;

select *
from young_animals;

insert into young_animals (age)
select (now()::date - birth_year)
from young_animals;

create table all_tables
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100),
    old_table  varchar(10)
);

insert into all_tables
select *
from (select *, 'hamster'
      from hamster
      union

      select *, 'cat'
      from cat
      union

      select *, 'dog'
      from dog
      union

      select *, 'donkey'
      from donkey
      union

      select *, 'horse'
      from horse) as t;
