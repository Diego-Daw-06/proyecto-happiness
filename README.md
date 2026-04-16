 
# 🎭 HAPPINESS&Co - Plataforma de Agenda Cultural

![DAW](https://img.shields.io/badge/Curso-1%C2%BA%20DAW-blue)
![Java](https://img.shields.io/badge/Java-SE%2017-orange)
![Tailwind](https://img.shields.io/badge/CSS-Tailwind-38B2AC)
![MySQL](https://img.shields.io/badge/DB-MySQL-4479A1)

**HAPPINESS&Co** es un proyecto integral desarrollado para el ciclo de **Desarrollo de Aplicaciones Web (DAW)**. Consiste en una plataforma de gestión de eventos culturales que combina una interfaz web moderna, un sistema de sindicación RSS, una base de datos relacional y una aplicación de gestión interna en Java.

---

## 🚀 Características Principales

### 🌐 Frontend (Web)
- **7 Vistas funcionales:** Inicio, Eventos, Historial, Detalle de Evento, Sobre Nosotros, Fuentes y Contacto.
- **Diseño Responsive:** Implementado con **Tailwind CSS**, adaptado a móviles, tablets y escritorio.
- **Lógica Dinámica (JS):** Visualización de detalles de eventos mediante parámetros de URL.
- **Requisito de Historial:** Los eventos pasados aplican automáticamente un filtro visual y habilitan una galería de fotos.
- **Sindicación RSS:** Canal XML validado para suscripciones a novedades culturales.

### ☕ Backend (Java)
- **Paradigma POO:** Arquitectura basada en clases (Usuarios, Eventos, Favoritos, Galerías).
- **Gestión de Datos:** Uso eficiente de `HashMap` para acceso rápido O(1) y `ArrayList` para colecciones dinámicas.
- **CRUD Interno:** Sistema de consola para altas y bajas con validación de integridad referencial.
- **Lógica Avanzada:** Uso de expresiones Lambda para la gestión de favoritos.

### 🗄️ Base de Datos (SQL)
- **Modelo E/R:** Relación 1:N entre categorías y eventos.
- **Vistas Automáticas:** Consultas predefinidas para filtrar eventos próximos y el historial.

---

## 🛠️ Tecnologías Utilizadas

- **Lenguajes:** HTML5, CSS3, JavaScript, Java 17, SQL.
- **Frameworks/Librerías:** Tailwind CSS.
- **Herramientas:** Git/GitHub, MySQL Workbench, VS Code.

---

## 📂 Estructura del Proyecto

```text
├── web/                  # Archivos HTML de la plataforma
│   ├── index.html        # Página principal
│   ├── rss.xml           # Canal de sindicación
│   └── ...               # Resto de vistas
├── java/                 # Código fuente de la aplicación de gestión
│   ├── app.java          # Clase principal (Menú)
│   └── Proyecto/         # Paquete con entidades (POO)
├── database/             # Scripts de base de datos
│   └── schema.sql        # Creación de tablas y vistas
└── img/                  # Assets y recursos visuales

![Pagina de inicio](./Lenguaje%20de%20Marcas/img/Captura%20Inicio.PNG)
![Pagina de eventos](./Lenguaje%20de%20Marcas/img/Captura%20Proximos.PNG)
![Pagina de historial](./Lenguaje%20de%20Marcas/img/Captura%20Historial.PNG)
![Pagina de nosotros](./Lenguaje%20de%20Marcas/img/Captura%20SobreNosotros.PNG)
![Pagina de contacto](./Lenguaje%20de%20Marcas/img/Captura%20Contacto.PNG)

.