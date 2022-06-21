# Paper2-AMV-Vista
Repositorio de la vista Listado de Doctores (Paper 2).
Subgrupo conformado por Alejandro Pestana, Miguel Cuadrado y Vicente Mirabal del equipo The Geeks.

# Tabla de Contribuciones:
| Vicente Mirabal                                                                                                                                                                                                                                                                                               | Miguel Cuadrado                                                                                                                                                  |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Creación de estructuras iniciales de Flutter. Creación de vista base de doctores. Implementación de programación asíncrona para obtener y mostrar la lista de doctores (Commits: "Se crearon las estructuras de las listas en Flutter" y "Se agregó programación asincona para mostrar la lista de doctores") | Despliegue de lista de especialidades (Commit "Despliegue de Lista de Especialidades")                                                                           |
| Creación inicial de la funcionalidad de búsqueda. Creación del provider de doctores. (Commits "Se agrego la funcionalidad de busqueda" y "Se agrego la clase DoctorProvider")                                                                                                                                 | Corrección de errores en fetch doctores y url (Commits "Arreglo en el fethDoctores()" y "Corrección de Error de Url")                                            |
| Modificación del provider de doctores. Despliegue de la lista de doctores. (Commits "Se modifiacron detalles de la peticion http", "Update doctores_provider.dart", "Despliegue de la lista de doctores" y "Se modifico detalle de lista de doctores")                                                        | Obtener y mostrar imágenes de los doctores. Eliminar archivos inutilizados. (Commits "Mostrar Imagenes de DB" y "Mostrar foto del doctor y cambios en archivos") |
| Creación de filtro por especialidades para la búsqueda. (Commits "Se implemento el filtro por especialidad", "Se acomodo el detalle del filtro", "Se agrego la funcionalidad de filtro por especialidad.", ...)                                                                                               |                                                                                                                                                                  |

# Instalación y Setup

Debes descargar e instalar [Flutter](https://flutter.dev).

Luego, descarga o clona el repositorio en tu máquina.

Para descargar las dependencias ejecuta:

```
flutter assemble
```

Necesitas un emulador para correr la vista. Puedes descargar e instalar [Android Studio](https://developer.android.com/studio) y luego descargar e instalar alguno de sus emuladores.

# Ejecución de la Vista

Primero que nada debes tener [el servicio y la base de datos](https://github.com/Primaxez/Paper2-AMV-Servicio) activos.

Si utilizas un emulador, actívalo y ejecuta el siguiente comando:

```
flutter run
```

