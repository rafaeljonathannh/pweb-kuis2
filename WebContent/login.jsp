<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    boolean isAuthenticated = false;

    if (username != null && password != null) {
        try {
            Connection conn = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Users WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                isAuthenticated = true;
                session.setAttribute("username", username);
                response.sendRedirect("dashboard.jsp");
            } else {
                out.println("Login gagal. Silakan coba lagi.");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<html>
<head><title>Login</title></head>
<body>
    <h2>Login</h2>
    <form method="post" action="login.jsp">
        <label>Username: </label><input type="text" name="username" required><br>
        <label>Password: </label><input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
