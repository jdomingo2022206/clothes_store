package modelo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "inventario")
public class Inventario {
    // Atributos
    // @Id
    private int idInventario;
    private String nombreInventario;
    private int idEstablecimiento;
    private int idProducto;
    private int stock;

    // Constructor
    public Inventario(int idInventario, String nombreInventario, int idEstablecimiento, int idProducto, int stock) {
        this.idInventario = idInventario;
        this.nombreInventario = nombreInventario;
        this.idEstablecimiento = idEstablecimiento;
        this.idProducto = idProducto;
        this.stock = stock;
    }

    // Getters
    public int getIdInventario() {
        return idInventario;
    }

    public String getNombreInventario() {
        return nombreInventario;
    }

    public int getIdEstablecimiento() {
        return idEstablecimiento;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public int getStock() {
        return stock;
    }

    // Setters
    public void setIdInventario(int idInventario) {
        this.idInventario = idInventario;
    }

    public void setNombreInventario(String nombreInventario) {
        this.nombreInventario = nombreInventario;
    }

    public void setIdEstablecimiento(int idEstablecimiento) {
        this.idEstablecimiento = idEstablecimiento;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
