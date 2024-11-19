<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Connection conn = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = conn.prepareStatement("DELETE FROM Products WHERE id = ?");
        ps.setInt(1, id);
        ps.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("products.jsp");
%>
