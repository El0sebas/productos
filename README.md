# Taller 1: Dart + Gitflow

CRUD por consola para gestionar un catálogo de productos, usando listas, mapas, ciclos y `switch-case`.

## Requisitos

- Dart SDK (^3.0.0)

## Cómo ejecutar

```bash
dart run 
```

## Funcionalidad

Menú principal con las siguientes opciones:

1. **Agregar producto** — pide nombre, precio y cantidad disponible.
2. **Listar productos** — muestra índice, nombre, precio y cantidad de cada producto.
3. **Actualizar producto** — pide el número del producto; cada campo (nombre, precio, cantidad) se puede dejar en blanco (Enter) para conservar el valor anterior.
4. **Eliminar producto** — pide el número del producto y lo quita de la lista.
5. **Salir** — termina el programa.

Las entradas se validan: no se aceptan nombres vacíos ni precios/cantidades no numéricos o negativos.

## Estructura

```
bin/main.dart    # Menú, CRUD y validaciones
pubspec.yaml     # Metadatos del proyecto
```

Cada producto se almacena como `Map<String, dynamic>` con las claves `nombre`, `precio` y `cantidad`, dentro de una `List<Map<String, dynamic>>` en memoria (no persiste entre ejecuciones).

## Gitflow

El desarrollo siguió ramas `main` / `develop` con una rama `feature/*` por cada funcionalidad (menú, agregar, listar, actualizar, eliminar), integradas a `develop` con merge `--no-ff` y luego fusionadas a `main`.
