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
  final nombre = leerTexto('Nombre del producto: ');
  final precio = leerDouble('Precio: ');
  final cantidad = leerEntero('Cantidad disponible: ');
  productos.add({'nombre': nombre, 'precio': precio, 'cantidad': cantidad});
  print('Producto agregado.');
}

String leerTexto(String prompt) {
  while (true) {
    stdout.write(prompt);
    final valor = stdin.readLineSync()?.trim() ?? '';
    if (valor.isNotEmpty) return valor;
    print('El valor no puede estar vacio.');
  }
}

double leerDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    final valor = double.tryParse(stdin.readLineSync()?.trim() ?? '');
    if (valor != null && valor >= 0) return valor;
    print('Ingresa un numero valido (>= 0).');
  }
}

int leerEntero(String prompt) {
  while (true) {
    stdout.write(prompt);
    final valor = int.tryParse(stdin.readLineSync()?.trim() ?? '');
    if (valor != null && valor >= 0) return valor;
    print('Ingresa un numero entero valido (>= 0).');
  }
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
