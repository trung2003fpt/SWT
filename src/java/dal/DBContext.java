package dal;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    protected Connection connect;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                    + ";databaseName=" + dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, userID, password);
        } catch (Exception e) {
        }
    }

    private final String serverName = "localhost";
    private final String dbName = "PRJ301";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";
}
