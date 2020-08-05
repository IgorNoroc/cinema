create database cinema;

create table users (
    id serial primary key,
    name text,
    phone int,
    ticket text
)

create table tickets (
    id text,
    unique (id)
)
