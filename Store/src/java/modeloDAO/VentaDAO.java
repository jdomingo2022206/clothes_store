package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import modelo.Venta;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public int agregar(Venta vn) {
        String sql = "insert into Venta(idCliente, fecha, total,idProducto,cantidad) values(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, vn.getIdCliente());
            ps.setString(2, vn.getFecha());
            ps.setDouble(3, vn.getTotal());
            ps.setInt(4, vn.getIdProducto());
            ps.setInt(5, vn.getCantidad());
            ps.executeUpdate();
            System.out.println("Venta agregada exitosamente");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se pudo agregar el Venta");
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


}