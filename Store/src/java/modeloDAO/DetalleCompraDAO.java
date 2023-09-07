package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DetalleCompra;

public class DetalleCompraDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar() {
        ArrayList<DetalleCompra> listaDetalleCompra = new ArrayList<>();
        String sql = "select * from DetalleCompra";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleCompra detalleCompra = new DetalleCompra();
                detalleCompra.setIdDetalleCompra(rs.getInt("idDetalleVenta"));
                detalleCompra.setIdCompra(rs.getInt("idCompra"));
                detalleCompra.setIdProveedor(rs.getInt("idProveedor"));
                detalleCompra.setIdProducto(rs.getInt("idProducto"));
                detalleCompra.setCantidad(rs.getInt("cantidad"));
                listaDetalleCompra.add(detalleCompra);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaDetalleCompra;
    }
    
    public DetalleCompra listarCodigoDetalleCompra(int id) {
        DetalleCompra detalleCompra = new DetalleCompra();
        String sql = "select * from DetalleCompra where idDetalleCompra="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleCompra.setIdDetalleCompra(rs.getInt("idDetalleVenta"));
                detalleCompra.setIdCompra(rs.getInt("idCompra"));
                detalleCompra.setIdProveedor(rs.getInt("idProveedor"));
                detalleCompra.setIdProducto(rs.getInt("idProducto"));
                detalleCompra.setCantidad(rs.getInt("cantidad"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return detalleCompra;
    }
    
    public int agregar(DetalleCompra dc) {
        String sql = "insert into DetalleCompra (idCompra, idProveedor, idProducto, cantidad) values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dc.getIdCompra());
            ps.setInt(2, dc.getIdProveedor());
            ps.setInt(3, dc.getIdProducto());
            ps.setInt(4, dc.getCantidad());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    public int actualizar(DetalleCompra dc) {
        String sql = "update DetalleCompra set idCompra = ?, idProveedor = ?, idProducto = ?, cantidad = ? where idDetalleCompra = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dc.getIdCompra());
            ps.setInt(2, dc.getIdProveedor());
            ps.setInt(3, dc.getIdProducto());
            ps.setInt(4, dc.getCantidad());
            ps.setInt(4, dc.getIdDetalleCompra());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id) {
        String sql = "delete from DetalleCompra where idDetalleVenta = "+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Chamalito es gey

}
