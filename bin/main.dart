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
  if (productos.isEmpty) {
    print('No hay productos registrados.');
    return;
  }
  for (var i = 0; i < productos.length; i++) {
    final p = productos[i];
    print('${i + 1}. ${p['nombre']} - \$${p['precio']} - cant: ${p['cantidad']}');
  }
}

void actualizarProducto() {
  final indice = seleccionarIndice('Numero del producto a actualizar: ');
  if (indice == null) return;
  final p = productos[indice];

  stdout.write('Nuevo nombre (Enter para mantener "${p['nombre']}"): ');
  final nombre = stdin.readLineSync()?.trim() ?? '';
  if (nombre.isNotEmpty) p['nombre'] = nombre;

  stdout.write('Nuevo precio (Enter para mantener ${p['precio']}): ');
  final precioTexto = stdin.readLineSync()?.trim() ?? '';
  if (precioTexto.isNotEmpty) {
    final precio = double.tryParse(precioTexto);
    if (precio != null && precio >= 0) {
      p['precio'] = precio;
    } else {
      print('Precio invalido, se mantiene el anterior.');
    }
  }

  stdout.write('Nueva cantidad (Enter para mantener ${p['cantidad']}): ');
  final cantidadTexto = stdin.readLineSync()?.trim() ?? '';
  if (cantidadTexto.isNotEmpty) {
    final cantidad = int.tryParse(cantidadTexto);
    if (cantidad != null && cantidad >= 0) {
      p['cantidad'] = cantidad;
    } else {
      print('Cantidad invalida, se mantiene la anterior.');
    }
  }

  print('Producto actualizado.');
}

int? seleccionarIndice(String prompt) {
  if (productos.isEmpty) {
    print('No hay productos registrados.');
    return null;
  }
  stdout.write(prompt);
  final numero = int.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (numero == null || numero < 1 || numero > productos.length) {
    print('Numero fuera de rango.');
    return null;
  }
  return numero - 1;
}

void eliminarProducto() {
  print('(pendiente)');
}
