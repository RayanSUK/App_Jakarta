<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>Ajout d'un utilisateur</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Résultat de l'ajout</h2>

<%
  String login = request.getParameter("login");
  String mdp = request.getParameter("mdp");

  if (login != null && mdp != null && !login.isEmpty() && !mdp.isEmpty()) {
    Connection conn = null;
    PreparedStatement ps = null;
    try {

      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
      String ins = "INSERT INTO users (login, mdp) VALUES (?, ?)";
      ps = conn.prepareStatement(ins);

      ps.setString(1, login);
      ps.setString(2, mdp);

      int rows = ps.executeUpdate();

      if (rows > 0) {
        response.sendRedirect("index.jsp");
      }
    } catch (Exception e) {
      response.sendRedirect("error.jsp"); //age error à réaliser
    } finally {

      if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
      if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
  } else {

    response.sendRedirect("error.jsp");
  }
%>

</body>
</html>