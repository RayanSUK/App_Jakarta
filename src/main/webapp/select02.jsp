<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Utilisateurs ID >= 2</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="navBar.jsp" />
<h2>Utilisateurs avec ID >= 2</h2>

<%
    Connection conn = null;
    PreparedStatement st = null;
    ResultSet res = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
        String sel = "SELECT * FROM users WHERE id >= ?";
        st = conn.prepareStatement(sel);
        st.setInt(1, 2);
        res = st.executeQuery();
%>

<table border="1">
    <tr><th>ID</th><th>Login</th><th>Mot de passe</th></tr>
    <% while (res.next()) { %>
    <tr>
        <td><%= res.getInt("id") %></td>
        <td><%= res.getString("login") %></td>
        <td><%= res.getString("mdp") %></td>
    </tr>
    <% } %>
</table>

<%
    } catch (Exception e) { e.printStackTrace(); }
    finally {
        if (res != null) res.close();
        if (st != null) st.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>