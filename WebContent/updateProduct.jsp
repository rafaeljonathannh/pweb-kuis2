<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double price = Double.parseDouble(request.getParameter("price"));

    try {
        Connection conn = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = conn.prepareStatement("UPDATE Products SET name = ?, quantity = ?, price = ? WHERE id = ?");
        ps.setString(1, name);
        ps.setInt(2, quantity);
        ps.setDouble(3, price);
        ps.setInt(4, id);
        ps.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("products.jsp");
%>
