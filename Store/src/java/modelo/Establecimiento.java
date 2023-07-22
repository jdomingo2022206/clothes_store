
package modelo;

public class Establecimiento {
   private int idEstablecimiento;
   private String nombreEstablecimiento;
   private String direccion;
   private String telefono;

   public Establecimiento() {
   
   }

    public Establecimiento(int idEstablecimiento, String nombreEstablecimiento, String direccion, String telefono) {
        this.idEstablecimiento = idEstablecimiento;
        this.nombreEstablecimiento = nombreEstablecimiento;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getIdEstablecimiento() {
        return idEstablecimiento;
    }

    public void setIdEstablecimiento(int idEstablecimiento) {
        this.idEstablecimiento = idEstablecimiento;
    }

    public String getNombreEstablecimiento() {
        return nombreEstablecimiento;
    }

    public void setNombreEstablecimiento(String nombreEstablecimiento) {
        this.nombreEstablecimiento = nombreEstablecimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
   
   
   
   
}
