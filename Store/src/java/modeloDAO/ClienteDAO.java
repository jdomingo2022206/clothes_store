package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;
public class ClienteDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public Cliente validar(String nombreCliente){
        Cliente cliente = new Cliente();
        String sql = "select * from Cliente where nombreCliente = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombreCliente);
            rs = ps.executeQuery();
            while(rs.next()){
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setNombreCliente(rs.getString("nombreCliente"));
                cliente.setApellidoCliente(rs.getString("apellidoCliente"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
            }
                
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cliente;
    }
    
    public List listar(){
        ArrayList<Cliente> listaCliente = new ArrayList<>();
        String sql = "select * from cliente";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Cliente cl = new Cliente();
                cl.setIdCliente(rs.getInt("idCliente"));
                cl.setNombreCliente(rs.getString("nombreCliente"));
                cl.setApellidoCliente(rs.getString("apellidoCliente"));
                cl.setDireccion(rs.getString("direccion"));
                cl.setTelefono(rs.getString("telefono"));
                listaCliente.add(cl);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCliente;
    }
    public int agregar(Cliente cl){
        String sql = "insert into Cliente (nombreCliente, apellidoCliente, direccion, telefono) values (?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getNombreCliente());
            ps.setString(2, cl.getApellidoCliente());
            ps.setString(3, cl.getDireccion());
            ps.setString(4, cl.getTelefono());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede agregar el registro");
        }
        return resp;
    }
    
    public Cliente listarCodigoCliente(int id){
        Cliente cl = new Cliente();
        String sql = "select * from cliente where idCliente ="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
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
    
    public int actualizar(Cliente cl){
        String sql = "update cliente set nombreCliente = ?, apellidoCliente = ?, direccion = ?, telefono = ?  where idCliente = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setString(1, cl.getNombreCliente());
            ps.setString(2, cl.getApellidoCliente());
            ps.setString(3, cl.getDireccion());
            ps.setString(4, cl.getTelefono());
            ps.setInt(5, cl.getIdCliente());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede actualizar");
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from cliente where idCliente ="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}