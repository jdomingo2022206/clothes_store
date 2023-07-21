package modelo;

public class Producto {
    
     private int idProducto;
    private String nombreProducto;
    private String descripcion;
    private double precio;
    private int idProveedor;
    private int idCategoría;

    public Producto() {
    }

    public Producto(int idProducto, String nombreProducto, String descripcion, double precio, int idProveedor, int idCategoría) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.idProveedor = idProveedor;
        this.idCategoría = idCategoría;
    }

    

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getIdCategoría() {
        return idCategoría;
    }

    public void setIdCategoría(int idCategoría) {
        this.idCategoría = idCategoría;
    }
    
    
    
}
