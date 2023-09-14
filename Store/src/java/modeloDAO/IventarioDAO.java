package modeloDAO;

import config.Conexion;
import modelo.Inventario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IventarioDAO {
    public List<Inventario> listar() {
        List<Inventario> inventarios = new ArrayList<>();
        try {
            final Conexion conexion = new Conexion();
            final String SQL = "SELECT * FROM inventario";
            final PreparedStatement preparedStatement = conexion.Conexion().prepareStatement(SQL);
            final ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println(resultSet);
            while (resultSet.next()) {
                inventarios.add(resultSetToInventario(resultSet));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return inventarios;
    }

    public boolean agregar(Inventario inventario) {
        try {
            final Conexion conexion = new Conexion();
            final String SQL = "INSERT INTO inventario (idInventario, nombreInventario, idEstablecimiento, idProducto, stock) VALUES (?, ?, ?, ?, ?)";
            final PreparedStatement preparedStatement = conexion.Conexion().prepareStatement(SQL);
            preparedStatement.setInt(1, inventario.getIdInventario());
            preparedStatement.setString(2, inventario.getNombreInventario());
            preparedStatement.setInt(3, inventario.getIdEstablecimiento());
            preparedStatement.setInt(4, inventario.getIdProducto());
            preparedStatement.setInt(5, inventario.getStock());
            preparedStatement.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean actualizar(Inventario inventario) {
        try {
            final Conexion conexion = new Conexion();
            final String SQL = "UPDATE inventario SET nombreInventario = ?, idEstablecimiento = ?, idProducto = ?, stock = ? WHERE idInventario = ?";
            final PreparedStatement preparedStatement = conexion.Conexion().prepareStatement(SQL);
            preparedStatement.setString(1, inventario.getNombreInventario());
            preparedStatement.setInt(2, inventario.getIdEstablecimiento());
            preparedStatement.setInt(3, inventario.getIdProducto());
            preparedStatement.setInt(4, inventario.getStock());
            preparedStatement.setInt(5, inventario.getIdInventario());
            preparedStatement.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int pk) {
        try {
            final Conexion conexion = new Conexion();
            final String SQL = "DELETE FROM inventario WHERE idInventario = ?";
            final PreparedStatement preparedStatement = conexion.Conexion().prepareStatement(SQL);
            preparedStatement.setInt(1, pk);
            preparedStatement.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Inventario buscar(int pk) {
        try {
            final Conexion conexion = new Conexion();
            final String SQL = "SELECT * FROM inventario WHERE idInventario = ?";
            final PreparedStatement preparedStatement = conexion.Conexion().prepareStatement(SQL);
            preparedStatement.setInt(1, pk);
            ResultSet resultSet = preparedStatement.executeQuery();
            // since only one result is expected we don't need a while loop
            resultSet.next();
            return resultSetToInventario(resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Utility classes
    private Inventario resultSetToInventario(ResultSet resultSet) throws SQLException {
        System.out.println("is calling");
        final int idInventario = resultSet.getInt("idInventario");
        final String nombreInventario = resultSet.getString("nombreInventario");
        final int idEstablecimiento = resultSet.getInt("idEstablecimiento");
        final int idProducto = resultSet.getInt("idProducto");
        final int stock = resultSet.getInt("stock");
        return new Inventario(idInventario, nombreInventario, idEstablecimiento, idProducto, stock);
    }

}
