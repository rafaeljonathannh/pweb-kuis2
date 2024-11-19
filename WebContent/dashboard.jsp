<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head><title>Dashboard</title></head>
<body>
    <h2>Selamat datang, <%= session.getAttribute("username") %>!</h2>
    <a href="products.jsp">Manajemen Produk</a><br>
    <a href="logout.jsp">Logout</a>
</body>
</html>
