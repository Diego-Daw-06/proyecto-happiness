import model.*;
import java.util.*;

public class app {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // Colecciones obligatorias según el PDF 
        HashMap<String, Usuarios> listaUsuarios = new HashMap<>(); // Key: email
        HashMap<Integer, Eventos> listaEventos = new HashMap<>();   // Key: id
        ArrayList<Favoritos> listaFavoritos = new ArrayList<>();
        
        // Contadores para IDs autogenerados
        int contadorEventos = 0;
        int contadorGalerias = 0;

        int opcion = 0;
        do {
            // Imprimir el menú al inicio del bucle 
            System.out.println("\n--- MENÚ HAPPINESS&CO ---");
            System.out.println("1. Añadir usuario");
            System.out.println("2. Eliminar usuario");
            System.out.println("3. Añadir evento");
            System.out.println("4. Eliminar evento");
            System.out.println("5. Añadir galería");
            System.out.println("6. Eliminar galería");
            System.out.println("7. Añadir favorito");
            System.out.println("8. Eliminar favorito");
            System.out.println("9. Salir");
            System.out.print("Seleccione opción: ");
            
            opcion = Integer.parseInt(sc.nextLine());

            switch (opcion) {
                case 1: // Añadir usuario 
                    System.out.print("Nombre: "); String nom = sc.nextLine();
                    System.out.print("Email: "); String email = sc.nextLine();
                    System.out.print("Password: "); String pass = sc.nextLine();
                    if (listaUsuarios.containsKey(email)) {
                        System.out.println("El usuario ya existe");
                    } else {
                        listaUsuarios.put(email, new Usuarios(nom, email, pass));
                        System.out.println("Usuario creado correctamente");
                    }
                    break;

                case 2: // Eliminar usuario 
                    System.out.print("Email del usuario a eliminar: ");
                    String emailEliminar = sc.nextLine();
                    if (listaUsuarios.remove(emailEliminar) != null) {
                        System.out.println("Usuario eliminado correctamente");
                    } else {
                        System.out.println("El usuario no existe");
                    }
                    break;

                case 3: // Añadir evento 
                    System.out.print("Título: "); String titEv = sc.nextLine();
                    System.out.print("Fecha: "); String fecEv = sc.nextLine();
                    System.out.print("Ubicación: "); String ubiEv = sc.nextLine();
                    System.out.print("Descripción: "); String desEv = sc.nextLine();
                    
                    int idNuevoEvento = contadorEventos++;
                    listaEventos.put(idNuevoEvento, new Eventos(idNuevoEvento, fecEv, titEv, ubiEv, desEv));
                    System.out.println("Evento creado correctamente");
                    break;

                case 4: // Eliminar evento 
                    for (Eventos e : listaEventos.values()) System.out.println(e); // Listado previo
                    System.out.print("ID del evento a eliminar: ");
                    int idEliminar = Integer.parseInt(sc.nextLine());
                    if (listaEventos.remove(idEliminar) != null) {
                        System.out.println("Evento eliminado correctamente");
                    } else {
                        System.out.println("El evento no existe");
                    }
                    break;

                case 5: // Añadir galería 
                    for (Eventos e : listaEventos.values()) System.out.println(e);
                    System.out.print("ID del evento para la galería: ");
                    int idBusca = Integer.parseInt(sc.nextLine());
                    if (!listaEventos.containsKey(idBusca)) {
                        System.out.println("Error: ID incorrecto");
                    } else {
                        System.out.print("Título galería: "); String titGal = sc.nextLine();
                        int idGal = contadorGalerias++;
                        // Se añade a la colección de galerías del evento específico 
                        listaEventos.get(idBusca).getListaGalerias().add(new Galerias(idGal, titGal, idBusca));
                        System.out.println("Galería creada correctamente");
                    }
                    break;

                case 6: // Eliminar galería 
                    for (Eventos e : listaEventos.values()) System.out.println(e);
                    System.out.print("ID del evento: ");
                    int idEvGal = Integer.parseInt(sc.nextLine());
                    if (!listaEventos.containsKey(idEvGal)) {
                       System.out.println("Error: ID de evento incorrecto");
                    } else {
                    ArrayList<Galerias> gals = listaEventos.get(idEvGal).getListaGalerias();
                    for (Galerias g : gals) System.out.println(g); // Mostrar galerías de ese evento
                    System.out.print("ID de la galería a eliminar: ");
                    int idGalEliminar = Integer.parseInt(sc.nextLine());
        
        // Buscar y eliminar de la colección
                    boolean eliminada = gals.removeIf(g -> g.getId() == idGalEliminar);
                    if (eliminada) System.out.println("Galería eliminada correctamente");
                    else System.out.println("La galería no existe");
                    }
                    break;

                case 7: // Añadir favorito 
                    for (Eventos e : listaEventos.values()) System.out.println(e);
                    for (Usuarios u : listaUsuarios.values()) System.out.println(u);
                    System.out.print("ID Evento: "); int idFav = Integer.parseInt(sc.nextLine());
                    System.out.print("Email Usuario: "); String emailFav = sc.nextLine();
    
                    if (!listaEventos.containsKey(idFav) || !listaUsuarios.containsKey(emailFav)) {
                        System.out.println("Error: Evento o correo incorrecto");
                    } else {
                        listaFavoritos.add(new Favoritos(emailFav, idFav));
                        System.out.println("Favorito creado correctamente");
                    }
                    break;

                case 8: // Eliminar favorito 
                    for (Favoritos f : listaFavoritos) System.out.println(f);
                    System.out.print("ID Evento del favorito: "); int idDelFav = Integer.parseInt(sc.nextLine());
                    System.out.print("Email Usuario del favorito: "); String emailDelFav = sc.nextLine();
    
                    boolean removido = listaFavoritos.removeIf(f -> f.getCorreoUsuario().equals(emailDelFav) && f.getIdEvento() == idDelFav);
    
                    if (removido) System.out.println("Favorito eliminado correctamente");
                    else System.out.println("El favorito no existe");
                    break;

                case 9: // Salir 
                    System.out.println("¡Hasta pronto!");
                    break;
            }
        } while (opcion != 9);
    }
}

