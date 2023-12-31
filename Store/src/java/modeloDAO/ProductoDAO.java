package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;

public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List listar() {
        List<Producto> listaProducto = new ArrayList<>();
        String sql = "select * from producto";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto nuevoProducto = new Producto();
                nuevoProducto.setIdProducto(rs.getInt("idProducto"));
                nuevoProducto.setNombreProducto(rs.getString("nombreProducto"));
                nuevoProducto.setDescripcion(rs.getString("descripcion"));
                nuevoProducto.setPrecio(rs.getDouble("precio"));
                nuevoProducto.setImagen(rs.getString("imagen"));
                nuevoProducto.setStock(rs.getInt("stock"));
                nuevoProducto.setIdProveedor(rs.getInt("idProveedor"));
                nuevoProducto.setIdCategoria(rs.getInt("idCategoria"));
                listaProducto.add(nuevoProducto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProducto;
    }

    public int agregar(Producto pr) {
        String sql = "INSERT INTO Producto (nombreProducto, descripcion, precio,imagen, stock,idProveedor, idCategoria) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {

            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pr.getNombreProducto());
            ps.setString(2, pr.getDescripcion());
            ps.setDouble(3, pr.getPrecio());
            ps.setString(4, pr.getImagen());
            ps.setInt(5, pr.getStock());
            ps.setInt(6, pr.getIdProveedor());
            ps.setInt(7, pr.getIdCategoria());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se pudo agregar el registro");
        }
        return resp;
    }

    public Producto listarCodigoProducto(int id) {
        // Instanciar objeto a devolver
        Producto pr = new Producto();
        String sql = "select * from producto where idProducto = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                pr.setIdProducto(rs.getInt(1));//rs.getInt(1)
                pr.setNombreProducto(rs.getString(2));//rs.getString(2)
                pr.setDescripcion(rs.getString(3));
                pr.setPrecio(rs.getDouble(4));
                pr.setImagen(rs.getString(5));
                pr.setStock(rs.getInt(6));
                pr.setIdProveedor(rs.getInt(7));
                pr.setIdCategoria(rs.getInt(8));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public void eliminar(int id) {
        String sql = "delete from producto where idProducto =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int actualizar(Producto pr) {
        String sql = "update producto set nombreProducto = ?, descripcion = ?, precio = ?, imagen = ?, stock = ?,idProveedor = ?, idCategoria = ?  where idProducto = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pr.getNombreProducto());
            ps.setString(2, pr.getDescripcion());
            ps.setDouble(3, pr.getPrecio());
            ps.setString(4, pr.getImagen());
            ps.setInt(5, pr.getIdProveedor());
            ps.setInt(6, pr.getStock());
            ps.setInt(7, pr.getIdCategoria());
            ps.setInt(8, pr.getIdProducto());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public int actualizarStock(int id, int stock) {
        String sql = "update producto set stock=? where idProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

}
