package modelo;

public class CarritoCompra {
    private int codigoCarrito;
    private int item;
    private int codigoProducto;
    private String descripcionProducto;
    private double precioProducto;
    private int cantidad;
    private int stockActual;
    private int stockDesCom;
    private String imagen;
    private double subtotal;

    public CarritoCompra() {
    }

    public CarritoCompra(int codigoCarrito, int item, int codigoProducto, String descripcionProducto, double precioProducto, int cantidad, int stockActual, int stockDesCom, String imagen, double subtotal) {
        this.codigoCarrito = codigoCarrito;
        this.item = item;
        this.codigoProducto = codigoProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioProducto = precioProducto;
        this.cantidad = cantidad;
        this.stockActual = stockActual;
        this.stockDesCom = stockDesCom;
        this.imagen = imagen;
        this.subtotal = subtotal;
    }

    public int getCodigoCarrito() {
        return codigoCarrito;
    }

    public void setCodigoCarrito(int codigoCarrito) {
        this.codigoCarrito = codigoCarrito;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public double getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(double precioProducto) {
        this.precioProducto = precioProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getStockActual() {
        return stockActual;
    }

    public void setStockActual(int stockActual) {
        this.stockActual = stockActual;
    }

    public int getStockDesCom() {
        return stockDesCom;
    }

    public void setStockDesCom(int stockDesCom) {
        this.stockDesCom = stockDesCom;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}
