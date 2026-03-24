package model;

public class Favoritos {
   
    private String correoUsuario;
    private int idEvento;

    public Favoritos(String correoUsuario, int idEvento) {
        this.correoUsuario = correoUsuario;
        this.idEvento = idEvento;
    }

    // Getters y Setters
    public String getCorreoUsuario() { 
        return correoUsuario;
    }
    public void setCorreoUsuario(String correoUsuario) { 
        this.correoUsuario = correoUsuario; 
    }
    public int getIdEvento() {
        return idEvento; 
    }
    public void setIdEvento(int idEvento) { 
        this.idEvento = idEvento; 
    }

    @Override
    public String toString() {
        return "Favorito -> Usuario: " + correoUsuario + " | Evento ID: " + idEvento;
    }
}

