package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    private static final String USER = "root1";
    private static final String PASSWD = "Tata@123";
    private static final String URL = "jdbc:mysql://localhost:3306/Banco";

    public Connection getConnection() throws SQLException, ClassNotFoundException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
