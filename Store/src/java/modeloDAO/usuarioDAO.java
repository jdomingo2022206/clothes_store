package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;

public class UsuarioDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar(){
        ArrayList<Usuario> listaUsuario = new ArrayList<>();
        String sql = "select * from Usuario";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setIdUsuario(rs.getInt("idUsuario"));
                nuevoUsuario.setNombreUsuario(rs.getString("nombreUsuario"));
                nuevoUsuario.setApellidoUsuario(rs.getString("apellidoUsuario"));
                nuevoUsuario.setUsuario(rs.getString("usuario"));
                nuevoUsuario.setClave(rs.getString("clave"));
                listaUsuario.add(nuevoUsuario);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    
      return listaUsuario;
    }
    
    public int agregar (Usuario us){
        String sql ="insert into Usuario (nombreUsuario, apellidoUsuario, usuario, clave) values (?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getNombreUsuario());
            ps.setString(2, us.getApellidoUsuario());
            ps.setString(2, us.getUsuario());
            ps.setString(3, us.getClave());
            ps.executeQuery();
            
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se pudo agregar nuevo usuario");
        }
        
     return resp;   
    }
    
    public Usuario listarCodigoUsuario(int id){
        Usuario us = new Usuario();
        String sql = "select * from producto where idUsuario ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                us.setIdUsuario(rs.getInt(1));
                us.setNombreUsuario(rs.getString(2));
                us.setApellidoUsuario(rs.getString(3));
                us.setUsuario(rs.getString(4));
                us.setClave(rs.getString(5));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return us;
    }
    
    public void eliminar(int id){
        String sql = "delete from usuario where idUsuario ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void actualizar(Usuario us){
        String sql = "update usuario set nombreUsuario = ?, apellidoUsuario=?, usuario=?, clave=? where idUsuario=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getNombreUsuario());
            ps.setString(2, us.getApellidoUsuario());
            ps.setString(3, us.getUsuario());
            ps.setString(4, us.getClave());
            ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
       
    }
    
}
