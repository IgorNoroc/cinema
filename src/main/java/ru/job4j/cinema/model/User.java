package ru.job4j.cinema.model;

import java.util.Objects;

/**
 * Class User for task: Cinema.
 */
public class User {
    private String name;
    private int phone;
    private String ticket;

    public User(String name, int phone, String ticket) {
        this.name = name;
        this.phone = phone;
        this.ticket = ticket;
    }

    public String getName() {
        return name;
    }

    public int getPhone() {
        return phone;
    }

    public String getTicket() {
        return ticket;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        User user = (User) o;
        return phone == user.phone
                && Objects.equals(name, user.name)
                && Objects.equals(ticket, user.ticket);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, phone, ticket);
    }
}
