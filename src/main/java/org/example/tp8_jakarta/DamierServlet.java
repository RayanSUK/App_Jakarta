package org.example.tp8_jakarta;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;

@WebServlet(name = "damierServlet", value = "/damier-servlet")
public class DamierServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les valeurs des paramètres envoyés depuis le formulaire
        String rowsParam = request.getParameter("rows");
        String colsParam = request.getParameter("cols");

        // Définir des valeurs par défaut si les paramètres ne sont pas fournis
        int rows = 8;
        int cols = 8;

        try {
            if (rowsParam != null && colsParam != null) {
                rows = Integer.parseInt(rowsParam);
                cols = Integer.parseInt(colsParam);
            }
        } catch (NumberFormatException e) {
            // En cas d'erreur, on garde les valeurs par défaut
            rows = 8;
            cols = 8;
        }

        // Placer ces valeurs comme attributs dans la requête
        request.setAttribute("rows", rows);
        request.setAttribute("cols", cols);

        // Rediriger vers la page JSP qui affichera le damier
        RequestDispatcher dispatcher = request.getRequestDispatcher("damier.jsp");
        dispatcher.forward(request, response);
    }
}