
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Establecimiento;

public class EstablecimientoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar(){
        String sql = "select * from Establecimiento";
        List<Establecimiento> listaEstablecimiento = new ArrayList();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Establecimiento es = new Establecimiento();
                es.setIdEstablecimiento(rs.getInt(1));
                es.setNombreEstablecimiento(rs.getString(2));
                es.setDireccion(rs.getString(3));
                es.setTelefono(rs.getString(4));
                listaEstablecimiento.add(es);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaEstablecimiento;
    }
    
    public int agregar(Establecimiento es){
        String sql ="insert into Establecimiento(nombreEstablecimiento, direccion, telefono) values(?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, es.getNombreEstablecimiento());
            ps.setString(2, es.getDireccion());
            ps.setString(3, es.getTelefono());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede agregar el registro");
        }
        return resp;
    }
    
    public Establecimiento listaCodigoEstablecimiento(int id){
        Establecimiento es = new Establecimiento();
        String sql = "select * from Establecimiento where idEstablecimiento = "+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while(rs.next()){
                es.setIdEstablecimiento(rs.getInt(1));
                es.setNombreEstablecimiento(rs.getString(2));
                es.setDireccion(rs.getString(3));
                es.setTelefono(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return es;
    }
    
    public Establecimiento BuscarEstablecimiento(int idE){
        Establecimiento es = new Establecimiento();
        String sql = "select * from Establecimiento where idEstablecimiento = "+idE;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while(rs.next()){
                es.setIdEstablecimiento(rs.getInt(1));
                es.setNombreEstablecimiento(rs.getString(2));
                es.setDireccion(rs.getString(3));
                es.setTelefono(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se a encontrado el Establecimiento");
        }
        return es;
    }
    
    public int actualizar(Establecimiento es){
        String sql = "update Establecimiento set nombreEstablecimiento = ?, direccion = ?, telefono = ? where idEstablecimiento = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, es.getNombreEstablecimiento());
            ps.setString(2, es.getDireccion());
            ps.setString(3, es.getTelefono());
            ps.setInt(4, es.getIdEstablecimiento());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from Establecimiento where idEstablecimiento ="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
