<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double price = Double.parseDouble(request.getParameter("price"));

    try {
        Connection conn = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO Products (name, quantity, price) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setInt(2, quantity);
        ps.setDouble(3, price);
        ps.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("products.jsp");
%>
