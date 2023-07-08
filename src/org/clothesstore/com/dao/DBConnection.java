package org.clothesstore.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static DBConnection instance;
    private Connection connection;
    private final String URL_HOST = "jdbc:mysql://localhost:3306";
    private final String DATABASE = "DBClothesStore";
    private final String USER = "root";
    private final String PASSWORD =  "root";

    // Constructor
    private DBConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            System.out.println(URL_HOST + "/" + DATABASE + "?enabledTLSProtocols=TLSv1.2");
            System.out.println("jdbc:mysql://localhost:3306/rentavehiculos?useSSL=false");
            connection = DriverManager.getConnection(URL_HOST + "/" + DATABASE + "?useSSL=false", USER, PASSWORD);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    // Singleton
    public static DBConnection getInstance() {
        if (instance == null) instance = new DBConnection();
        return instance;
    }

    // Getters
    public Connection getConnection() {
        return connection;
    }

    // Setters
    public void setConnection(Connection connection) {
        this.connection = connection;
    }
}
