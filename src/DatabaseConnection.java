import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        // Load driver JDBC MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Koneksi ke database
        String url = "jdbc:mysql://localhost:3306/pwebdb"; // nama database xampp
        String user = "root"; // Username default XAMPP
        String password = ""; // Password default XAMPP

        // Mengembalikan objek Connection
        return DriverManager.getConnection(url, user, password);
    }
}
