/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author Jonwk._.19
 */
public class Venta {
    private int idVenta;
    private int idCliente;
    private Date fecha;
    private double total; 
    private int idProducto; // Se Agregaron dos variables Ajuste DB
    private int cantidad;
    private String descripcion;
    private int item;
    private Double precio;
    private Double subtotal;

    public Venta() {
    }

    public Venta(int idVenta, int idCliente, Date fecha, double total, int idProducto, int cantidad, String descripcion, int item, Double precio, Double subtotal) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.fecha = fecha;
        this.total = total;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.descripcion = descripcion;
        this.item = item;
        this.precio = precio;
        this.subtotal = subtotal;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    
}
