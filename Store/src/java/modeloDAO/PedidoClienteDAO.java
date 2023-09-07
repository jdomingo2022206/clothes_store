package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.PedidoCliente;


public class PedidoClienteDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar(){
        ArrayList<PedidoCliente> listaPedidoCliente = new ArrayList<>();
        String sql = "select * from pedidoCliente";
        try {
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          while (rs.next()){
              PedidoCliente nuevoPedido = new PedidoCliente();
              nuevoPedido.setIdPedidoCliente(rs.getInt("idPedidoCliente"));
              nuevoPedido.setIdCliente(rs.getInt("idCliente"));
              nuevoPedido.setIdProducto(rs.getInt("idPeoducto"));
              nuevoPedido.setCantidad(rs.getInt("cantidad"));
              nuevoPedido.setFecha(rs.getDate("fecha"));
              nuevoPedido.setTotal(rs.getDouble("total"));
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaPedidoCliente;
    }
    
    public int agregar (PedidoCliente pr){
        String sql = "insert into PedidoCliente (idCliente, idProducto, cantidad, fecha, total) values (?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pr.getIdCliente());
            ps.setInt(2, pr.getIdProducto());
            ps.setInt(3, pr.getCantidad());
            // ps.setDate(4, pr.getFecha());
            ps.setDouble(5, pr.getTotal());            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se pudo agregar al registro");
        }
        return resp;
    }
    
    public PedidoCliente listarCodigoPedidoCliente(int id){
        PedidoCliente pr = new PedidoCliente();
        String sql = "select * from pedidoCliente where idPedidoCliente = "+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
            pr.setIdPedidoCliente(rs.getInt(1));
            pr.setIdCliente(rs.getInt(2));
            pr.setIdProducto(rs.getInt(3));
            pr.setCantidad(rs.getInt(4));
            pr.setFecha(rs.getDate(5));
            pr.setTotal(rs.getDouble(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    
    public void eliminar(int id){
        String sql = "delete from pedidoCliente where idPedidoCliente ="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public int actualizar(PedidoCliente pr){
        String sql = "update pedidoCliente set idCliente = ?, idProducto = ?, cantidad = ?, fecha = ?, total = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pr.getIdCliente());
            ps.setInt(2, pr.getIdProducto());
            ps.setInt(3, pr.getCantidad());
            //ps.setDate(4, pr.getFecha());
            ps.setDouble(5, pr.getTotal());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
}
