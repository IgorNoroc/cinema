package ru.job4j.cinema.persistence;

import ru.job4j.cinema.model.Ticket;
import ru.job4j.cinema.model.User;

import java.sql.SQLException;
import java.util.Collection;

public interface Store {
    void buyTicket(User user, Ticket ticket) throws SQLException;

    Collection<Ticket> getAllTickets();
}
