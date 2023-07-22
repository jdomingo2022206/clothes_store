package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Compra;

public class CompraDAO {
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Compra nCompra = new Compra();
    
    public List listar(){
        ArrayList<Compra> listaCompra = new ArrayList<>();
        String sql = "select * from compra";
        
        try {
            con = conect.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra nuevaCompra = new Compra();
                nuevaCompra.setIdCompra(rs.getInt("idCompra"));
                nuevaCompra.setIdProveedor(rs.getInt("idProveedor"));
                nuevaCompra.setFecha(rs.getDate("fecha"));
                nuevaCompra.setTotal(rs.getDouble("total"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCompra;
    }
    
    
}
