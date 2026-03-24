import model.*;
import java.util.*;

public class app {    
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        
        // Colecciones obligatorias según el PDF 
        HashMap<String, Usuarios> listaUsuarios = new HashMap<>(); // Key: email
        HashMap<Integer, Eventos> listaEventos = new HashMap<>();   // Key: id
        ArrayList<Favoritos> listaFavoritos = new ArrayList<>();
        
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
            System.out.println("Seleccione opción: ");
            
            opcion = teclado.nextInt();

            switch (opcion) {
                case 1: // Añadir usuario 
                    System.out.println("Nombre: "); 
                    String nom = teclado.nextLine();
                    System.out.println("Email: "); 
                    String email = teclado.nextLine();
                    System.out.println("Password: "); 
                    String pass = teclado.nextLine();
                    if (listaUsuarios.containsKey(email)) {
                        System.out.println("El usuario ya existe");
                    } else {
                        listaUsuarios.put(email, new Usuarios(nom, email, pass));
                        System.out.println("Usuario creado correctamente");
                    }
                    break;

                case 2: // Eliminar usuario
                    System.out.println("Email del usuario a eliminar: ");
                    String emailEliminar = teclado.nextLine();
                    if (listaUsuarios.remove(emailEliminar) != null) {
                        System.out.println("Usuario eliminado correctamente");
                    } else {
                        System.out.println("El usuario no existe");
                    }
                    break;

                case 3: // Añadir evento
                    System.out.print("Título: "); String tituloEv = teclado.nextLine();
                    System.out.print("Fecha: "); String fechaEv = teclado.nextLine();
                    System.out.print("Ubicación: "); String ubicacionEv = teclado.nextLine();
                    System.out.print("Descripción: "); String descripcionEv = teclado.nextLine();
                    
                    int idNuevoEvento = contadorEventos++;
                    listaEventos.put(idNuevoEvento, new Eventos(idNuevoEvento, fechaEv, tituloEv, ubicacionEv, descripcionEv));
                    System.out.println("Evento creado correctamente");
                    break;

                case 4: // Eliminar evento 
                    for (Eventos e : listaEventos.values()) System.out.println(e); // Listado previo
                    System.out.print("ID del evento a eliminar: ");
                    int idEliminar = Integer.parseInt(teclado.nextLine());
                    if (listaEventos.remove(idEliminar) != null) {
                        System.out.println("Evento eliminado correctamente");
                    } else {
                        System.out.println("El evento no existe");
                    }
                    break;

                case 5: // Añadir galería [cite: 170, 174]
                    for (Eventos e : listaEventos.values()) System.out.println(e);
                    System.out.print("ID del evento para la galería: ");
                    int idBusca = Integer.parseInt(sc.nextLine());
                    if (!listaEventos.containsKey(idBusca)) {
                        System.out.println("Error: ID incorrecto");
                    } else {
                        System.out.print("Título galería: "); String titGal = sc.nextLine();
                        int idGal = contadorGalerias++;
                        // Se añade a la colección de galerías del evento específico [cite: 172]
                        listaEventos.get(idBusca).getListaGalerias().add(new Galerias(idGal, titGal, idBusca));
                        System.out.println("Galería creada correctamente");
                    }
                    break;

                case 9: // Salir [cite: 187]
                    System.out.println("¡Hasta pronto!");
                    break;
            }
        } while (opcion != 9);
    }
}

