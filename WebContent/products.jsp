<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    // Koneksi ke database dan mengambil data produk
    Connection conn = null;
    try {
        conn = DatabaseConnection.initializeDatabase();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Products");
%>
<html>
<head><title>Manajemen Produk</title></head>
<body>
    <h2>Manajemen Produk</h2>
    <form action="addProduct.jsp" method="post">
        <input type="text" name="name" placeholder="Nama Produk" required>
        <input type="number" name="quantity" placeholder="Jumlah" required>
        <input type="number" step="0.01" name="price" placeholder="Harga" required>
        <input type="submit" value="Tambah Produk">
    </form>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nama</th>
            <th>Jumlah</th>
            <th>Harga</th>
            <th>Aksi</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td>
                <a href="editProduct.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a href="deleteProduct.jsp?id=<%= rs.getInt("id") %>">Hapus</a>
            </td>
        </tr>
        <%
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
