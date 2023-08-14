
public class Login {
    private int idLogin;
    private String ususarioLogin;
    private String claveLogin;

    public Login() {
    }

    public Login(int idLogin, String ususarioLogin, String claveLogin) {
        this.idLogin = idLogin;
        this.ususarioLogin = ususarioLogin;
        this.claveLogin = claveLogin;
    }

    public int getIdLogin() {
        return idLogin;
    }

    public void setIdLogin(int idLogin) {
        this.idLogin = idLogin;
    }

    public String getUsusarioLogin() {
        return ususarioLogin;
    }

    public void setUsusarioLogin(String ususarioLogin) {
        this.ususarioLogin = ususarioLogin;
    }

    public String getClaveLogin() {
        return claveLogin;
    }

    public void setClaveLogin(String claveLogin) {
        this.claveLogin = claveLogin;
    }
    
    
}
