package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO {
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Proveedor nProveedor = new Proveedor();
    
    public List Listar(){
        ArrayList<Proveedor> listaProveedor = new ArrayList<>();
        String sql = "select * from proveedor";
        try{
            con = conect.getConnection();
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
    
}
