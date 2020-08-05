package ru.job4j.cinema.controller;

import com.google.gson.Gson;
import ru.job4j.cinema.model.Ticket;
import ru.job4j.cinema.persistence.DBCinema;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

@WebServlet("/hall")
public class HallServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Collection<Ticket> tickets = DBCinema.instOf().getAllTickets();
        String json = new Gson().toJson(tickets);
        PrintWriter out = new PrintWriter(resp.getOutputStream());
        out.println(json);
        out.flush();
    }
}
