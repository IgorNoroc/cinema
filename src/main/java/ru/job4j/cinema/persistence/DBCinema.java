package ru.job4j.cinema.persistence;

import org.apache.commons.dbcp2.BasicDataSource;
import ru.job4j.cinema.model.Ticket;
import ru.job4j.cinema.model.User;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Properties;

public class DBCinema implements Store {
    /**
     * Connection pool.
     */
    private final BasicDataSource pool = new BasicDataSource();

    /**
     * When at first time create instance of this class,
     * we connection to database in connection pool.
     */
    private DBCinema() {
        Properties cfg = new Properties();
        try (BufferedReader io = new BufferedReader(
                new FileReader("dbcinema.properties"))) {
            cfg.load(io);
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
        try {
            Class.forName(cfg.getProperty("jdbc.driver"));
        } catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
        pool.setDriverClassName(cfg.getProperty("jdbc.driver"));
        pool.setUrl(cfg.getProperty("jdbc.url"));
        pool.setUsername(cfg.getProperty("jdbc.username"));
        pool.setPassword(cfg.getProperty("jdbc.password"));
        pool.setMinIdle(5);
        pool.setMaxIdle(10);
        pool.setMaxOpenPreparedStatements(100);
    }

    /**
     * Create singleton.
     */
    private static final class Lazy {
        private static final Store INST = new DBCinema();
    }

    public static Store instOf() {
        return Lazy.INST;
    }

    @Override
    public void buyTicket(User user, Ticket ticket) throws SQLException {
        try (Connection cn = pool.getConnection()) {
            cn.setAutoCommit(false);
            try {
                try (PreparedStatement st = cn.prepareStatement("INSERT INTO users (name, phone, ticket) values (?, ?, ?)")) {
                    st.setString(1, user.getName());
                    st.setInt(2, user.getPhone());
                    st.setString(3, ticket.getId());
                    st.execute();
                }
                saveTicket(cn, ticket);
                cn.commit();
            } catch (SQLException e) {
                cn.rollback();
                throw new SQLException();
            } finally {
                cn.setAutoCommit(true);
            }
        }
    }

    private void saveTicket(Connection cn, Ticket ticket) throws SQLException {
        try (PreparedStatement ticketSt = cn.prepareStatement("INSERT INTO tickets (id) values (?)")) {
            ticketSt.setString(1, ticket.getId());
            ticketSt.execute();
        }
    }

    @Override
    public Collection<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        try (Connection cn = pool.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT * FROM tickets");
             ResultSet it = ps.executeQuery()) {
            while (it.next()) {
                tickets.add(new Ticket(
                        it.getString("id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }
}
