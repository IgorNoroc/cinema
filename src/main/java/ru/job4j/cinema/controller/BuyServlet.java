package ru.job4j.cinema.controller;

import ru.job4j.cinema.model.Ticket;
import ru.job4j.cinema.model.User;
import ru.job4j.cinema.persistence.DBCinema;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet for task: Cinema.
 */
@WebServlet("/buy")
public class BuyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            DBCinema.instOf().buyTicket(
                    new User(
                            req.getParameter("name"),
                            Integer.parseInt(req.getParameter("phone")),
                            (String) getServletContext().getAttribute("pl")),
                    new Ticket(
                            (String) getServletContext().getAttribute("pl"))
            );
        } catch (SQLException e) {
            throw new ServletException();
        }
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }
}
