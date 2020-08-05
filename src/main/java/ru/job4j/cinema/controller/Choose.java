package ru.job4j.cinema.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/choose")
public class Choose extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String name = req.getParameter("place");
        String[] place = name.split("\\.");
        getServletContext().setAttribute("place", place);
        getServletContext().setAttribute("pl", name);
        req.getRequestDispatcher("payment.jsp").forward(req, resp);
    }
}
