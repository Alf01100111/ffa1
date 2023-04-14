-- Создать таблицы с иерархией из диаграммы в БД

drop database if exists friends_of_man;
create database friends_of_man;

-- Создать таблицы с иерархией из диаграммы в БД
drop table if exists animal;
create table if not exists animal
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists home_animal;
create table if not exists home_animal
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists pack_animal;
create table if not exists pack_animal
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists cat;
create table if not exists cat
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists dog;
create table if not exists dog
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists donkey;
create table if not exists donkey
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists hamster;
create table if not exists hamster
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists horse;
create table if not exists horse
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

drop table if exists camel;
create table if not exists camel
(
    name       varchar(100),
    birth_year date,
    commands   varchar(100)
);

-- Заполнить низкоуровневые таблицы именами(животных), командами

insert into camel
values ('name1', '2023.01.01', 'гав'),
       ('name2', '2021.01.01', 'не гав');

insert into cat
values ('name3', '2023.01.01', 'гав'),
       ('name4', '2021.01.01', 'не гав');

insert into dog
values ('name5', '2023.01.01', 'гав'),
       ('name6', '2021.01.01', 'не гав');

insert into donkey
values ('name7', '2023.01.01', 'гав'),
       ('name8', '2021.01.01', 'не гав');

insert into horse
values ('name9', '2023.01.01', 'гав'),
       ('name10', '2021.01.01', 'не гав');

insert into hamster
values ('name11', '2023.01.01', 'гав'),
       ('name12', '2021.01.01', 'не гав');

-- Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку
-- Объединить таблицы лошади, и ослы в одну таблицу

truncate camel;

select *
from horse
union
select *
from donkey;

-- Создать новую таблицу “молодые животные” в которую попадут все животные
-- старше 1 года, но младше 3 лет
-- и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице

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

select *
from young_animals;

insert into young_animals (age)
select (now()::date - birth_year)
from young_animals;

-- Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.

drop table if exists all_tables;
create table if not exists all_tables
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
