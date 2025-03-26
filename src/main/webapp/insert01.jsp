<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter un utilisateur</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="navBar.jsp" />
<h2>Ajouter un utilisateur</h2>

<form action="insert02.jsp" method="post">
    Login: <input type="text" name="login" required><br>
    Mot de passe: <input type="password" name="mdp" required><br>
    <input type="submit" value="Ajouter">
</form>

</body>
</html>