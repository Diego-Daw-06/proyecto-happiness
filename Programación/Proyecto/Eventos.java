package Proyecto;
import java.util.ArrayList;
public class Eventos {

    private int id;
    private String fecha;
    private String titulo;
    private String ubicación;
    private String descripción;
    private ArrayList<Galerias> listaGalerias; // Requisito: colección inicial vacía 

    public Eventos(int id, String fecha, String titulo, String ubicación, String descripción) {
        this.id = id;
        this.fecha = fecha;
        this.titulo = titulo;
        this.ubicación = ubicación;
        this.descripción = descripción;
        this.listaGalerias = new ArrayList<>();
    }

    // Getters y Setters
    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }
    public String getFecha() { 
        return fecha;
    }
    public void setFecha(String fecha) { 
        this.fecha = fecha; 
    }
    public String getTitulo() { 
        return titulo; 
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo; 
        }
    public String getUbicación() { 
        return ubicación; 
    }
    public void setUbicación(String ubicación) { 
        this.ubicación = ubicación; 
    }
    public String getDescripción() { 
        return descripción; 
    }
    public void setDescripción(String descripción) {
        this.descripción = descripción; 
    }
    public ArrayList<Galerias> getListaGalerias() { 
        return listaGalerias; 
    }
    public void setListaGalerias(ArrayList<Galerias> listaGalerias) { 
        this.listaGalerias = listaGalerias; 
    }

    @Override
    public String toString() {
        return "ID: " + id + " | Evento: " + titulo + " (" + fecha + ") en " + ubicación;
    }
}

