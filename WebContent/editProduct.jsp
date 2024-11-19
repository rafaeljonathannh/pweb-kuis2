<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = "";
    int quantity = 0;
    double price = 0.0;

    try {
        Connection conn = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            quantity = rs.getInt("quantity");
            price = rs.getDouble("price");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head><title>Edit Produk</title></head>
<body>
    <h2>Edit Produk</h2>
    <form action="updateProduct.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="text" name="name" value="<%= name %>" required>
        <input type="number" name="quantity" value="<%= quantity %>" required>
        <input type="number" step="0.01" name="price" value="<%= price %>" required>
        <input type="submit" value="Update Produk">
    </form>
</body>
</html>
