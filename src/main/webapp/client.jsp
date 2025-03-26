<%--
  Created by IntelliJ IDEA.
  User: 22302339
  Date: 26/03/2025
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insertion Client</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<jsp:include page="navBar.jsp" />
<form action="insert02.jsp" method="post">
  Nom du client : <input type="text" name="nom" required><br>
  Ville du Client: <input type="text" name="ville" required><br>
  Code du client : <input type="text" name="code" required><br>
  <input type="submit" value="Ajouter">
</form>

</body>
</html>
