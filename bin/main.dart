import 'dart:io';

final List<Map<String, dynamic>> productos = [];

void main() {
  var salir = false;
  while (!salir) {
    mostrarMenu();
    final opcion = stdin.readLineSync();
    switch (opcion) {
      case '1':
        agregarProducto();
        break;
      case '2':
        listarProductos();
        break;
      case '3':
        actualizarProducto();
        break;
      case '4':
        eliminarProducto();
        break;
      case '5':
        salir = true;
        print('Hasta luego.');
        break;
      default:
        print('Opcion invalida.');
    }
  }
}

void mostrarMenu() {
  print('\n--- Catalogo de productos ---');
  print('1. Agregar producto');
  print('2. Listar productos');
  print('3. Actualizar producto');
  print('4. Eliminar producto');
  print('5. Salir');
  stdout.write('Elige una opcion: ');
}

void agregarProducto() {
  print('(pendiente)');
}

void listarProductos() {
  print('(pendiente)');
}

void actualizarProducto() {
  print('(pendiente)');
}

void eliminarProducto() {
  print('(pendiente)');
}
