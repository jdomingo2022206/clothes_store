package modelo;

public class DetalleCompra {
    private int idDetalleCompra;
    private int idCompra;
    private int idProveedor;
    private int idProducto;
    private int cantidad;

    public DetalleCompra() {
    }

    public DetalleCompra(int idDetalleCompra, int idCompra, int idProveedor, int idProducto, int cantidad) {
        this.idDetalleCompra = idDetalleCompra;
        this.idCompra = idCompra;
        this.idProveedor = idProveedor;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
    }

    public int getIdDetalleCompra() {
        return idDetalleCompra;
    }

    public void setIdDetalleCompra(int idDetalleCompra) {
        this.idDetalleCompra = idDetalleCompra;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
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
}
