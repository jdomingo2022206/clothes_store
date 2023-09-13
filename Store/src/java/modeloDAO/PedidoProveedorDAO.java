package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.PedidoProveedor;

public class PedidoProveedorDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listPedidoProveedor() {
        String sql = "SELECT * FROM PedidoProveedor";
        List<PedidoProveedor> ppList = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                PedidoProveedor pp = new PedidoProveedor();
                pp.setIdPedidoProveedor(rs.getInt(1));
                pp.setIdProveedor(rs.getInt(2));
                pp.setIdProducto(rs.getInt(3));
                pp.setCantidad(rs.getInt(4));
                pp.setFecha(rs.getDate(5));
                pp.setTotal(rs.getDouble(6));
                ppList.add(pp);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return ppList;
    }
    
    public int addPedidoProveedor(PedidoProveedor pp) {
        String sql = "INSERT INTO PedidoProveedor (idProveedor, idProducto, cantidad, fecha, total) VALUES (?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pp.getIdProveedor());
            ps.setInt(2, pp.getIdProducto());
            ps.setInt(3, pp.getCantidad());
            ps.setDate(4, (Date) pp.getFecha());
            ps.setDouble(5, pp.getTotal());
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("No se pudo agregar el registro");
        }
        return resp;
    }
    
    public PedidoProveedor getPedidoProveedorByID(int id) {
        PedidoProveedor pp = new PedidoProveedor();
        String sql = "SELECT * FROM PedidoProveedor WHERE idPedidoProveedor = "+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
                while (rs.next()) {
                pp.setIdProveedor(rs.getInt(2));
                pp.setIdProducto(rs.getInt(3));
                pp.setCantidad(rs.getInt(4));
                pp.setFecha(rs.getDate(5));
                pp.setTotal(rs.getDouble(6));
                }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pp;
    }
    
    public int updatePedidoProveedor(PedidoProveedor pp) {
        String sql = "UPDATE PedidoProveedor SET idProveedor = ?, idProducto = ?, cantidad = ?, fecha = ?, total = ? WHERE idPedidoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pp.getIdProveedor());
            ps.setInt(2, pp.getIdProducto());
            ps.setInt(3, pp.getCantidad());
            ps.setDate(4, (Date) pp.getFecha());
            ps.setDouble(5, pp.getTotal());
            ps.setInt(6, pp.getIdPedidoProveedor());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    public void deletePedidoProveedor(int id) {
        String sql = "DELETE FROM PedidoProveedor WHERE idPedidoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}