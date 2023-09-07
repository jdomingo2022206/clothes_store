package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Proveedor;

public class ProveedorDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List Listar(){
        ArrayList<Proveedor> listaProveedor = new ArrayList<>();
        String sql = "select * from proveedor";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Proveedor nuevoProveedor = new Proveedor();
                nuevoProveedor.setIdProveedor(rs.getInt("idProveedor"));
                nuevoProveedor.setNombreProveedor(rs.getString("nombreProveedor"));
                nuevoProveedor.setDireccion(rs.getString("direccion"));
                nuevoProveedor.setTelefono(rs.getString("telefono"));
                listaProveedor.add(nuevoProveedor);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
       return listaProveedor;
    }
    
    public int agregar (Proveedor pro){
        String sql = "insert into Proveedor (nombreProveedor, direccion, telefono) values(?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNombreProveedor());
            ps.setString(2, pro.getDireccion());
            ps.setString(3, pro.getTelefono());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se puedo agregar el Dato");
        }
        return resp;
    }
    
    public Proveedor listarCodigoProveedor(int id){
            Proveedor pro = new Proveedor();
            String sql = "select * from proveedor where idProveedor= "+id;
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                     pro.setIdProveedor(rs.getInt(1));
                     pro.setNombreProveedor(rs.getString(2));
                     pro.setDireccion(rs.getString(3));
                     pro.setTelefono(rs.getString(4));
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return pro;
    }
    
    public void eliminar(int id){
        String sql = "delete from proveedor where idProveedor ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public int actualizar(Proveedor pro){
        String sql = "update proveedor set nombreProveedor = ?, direccion = ?, telefono =? where idProveedor =?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNombreProveedor());
            ps.setString(2, pro.getDireccion());
            ps.setString(3, pro.getTelefono());
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
}
