package Proyecto;

public class Galerias {
    private int id;
    private String título;
    private int idEvento;

    public Galerias(int id, String título, int idEvento) {
        this.id = id;
        this.título = título;
        this.idEvento = idEvento;
    }

    // Getters y Setters
    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }
    public String getTítulo() { 
        return título; 
    }
    public void setTítulo(String título) { 
        this.título = título; 
    }
    public int getIdEvento() { 
        return idEvento; 
    }
    public void setIdEvento(int idEvento) { this.idEvento = idEvento; }

    @Override
    public String toString() {
        return "Galeria ID: " + id + " | Título: " + título + " (Evento: " + idEvento + ")";
    }
}

