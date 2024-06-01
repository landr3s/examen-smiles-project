package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBConnection;

public class DBConnectionTest {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                System.out.println("Conexión a la base de datos establecida correctamente.");

                // Consulta para obtener los usuarios
                String query = "SELECT * FROM users";
                try (PreparedStatement statement = conn.prepareStatement(query)) {
                    ResultSet resultSet = statement.executeQuery();
                    
                    // Imprimir los usuarios
                    System.out.println("Usuarios:");
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String username = resultSet.getString("username");
                        String password = resultSet.getString("password");
                        String role = resultSet.getString("role");
                        
                        System.out.println("ID: " + id + ", Username: " + username + ", Password: " + password + ", Role: " + role);
                    }
                    System.out.println("Consulta realizada con éxito.");
                } catch (SQLException e) {
                    System.out.println("Error al ejecutar la consulta: " + e.getMessage());
                }
            } else {
                System.out.println("Fallo en la conexión a la base de datos.");
            }
        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    }
}
