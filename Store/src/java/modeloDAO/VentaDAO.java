package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import modelo.Venta;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;

/**
 *
 * @author Jonwk._.19
 */
public class VentaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Venta> listar() {
        List<Venta> listaVenta = new ArrayList<>();
        String sql = "select * from Venta";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdVenta(rs.getInt("idVenta"));
                venta.setIdCliente(rs.getInt("idCliente"));
                venta.setFecha(rs.getDate("fecha"));
                venta.setTotal(rs.getDouble("total"));
                listaVenta.add(venta);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaVenta;
    }

    
    
    
    public int agregar(Venta vn) {
        String sql = "INSERT INTO Venta (idCliente, fecha, total) values (?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, vn.getIdCliente());
            ps.setDate(2, vn.getFecha());
            ps.setDouble(3, vn.getTotal());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se pudo agregar el registro");
        }
        return resp;
    }

    
        public Cliente BuscarCliente(int id){
        Cliente cl = new Cliente();
        String sql = "Select * from Cliente where idCliente="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cl.setIdCliente(rs.getInt(1));
                cl.setNombreCliente(rs.getString(2));
                cl.setApellidoCliente(rs.getString(3));
                cl.setDireccion(rs.getString(4));
                cl.setTelefono(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cl;
    }
        
    public Venta listarCodigoVenta(int id) {
        // Instanciar objeto a devolver
        Venta vn = new Venta();
        String sql = "select * from Venta where idVenta = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                vn.setIdVenta(rs.getInt(1));
                vn.setIdCliente(rs.getInt(2));
                vn.setFecha(rs.getDate(3));
                vn.setTotal(rs.getDouble(4));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return vn;
    }

    public void eliminar(int id) {
        String sql = "delete from Venta where idVenta =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int actualizar(Venta vn) {
        String sql = "update Venta set idCliente = ?, fecha = ?, total = ?  where idVenta = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, vn.getIdCliente());
            ps.setDate(2, vn.getFecha());
            ps.setDouble(3, vn.getTotal());
            ps.setInt(4, vn.getIdVenta());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

}