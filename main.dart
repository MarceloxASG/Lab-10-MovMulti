import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ListItem {
  final String name;
  final String image;
  final String fontFamily;
  final String category;

  ListItem({required this.name, required this.image, required this.fontFamily, required this.category});
}

class MyApp extends StatelessWidget {
  final List<ListItem> items = [
    ListItem(name: "Manzana", image: "assets/images/apple.jpg", fontFamily: "OpenSans", category: "alimentos"),
    ListItem(name: "Perro", image: "assets/images/dog.jpg", fontFamily: "Lato", category: "animales"),
    ListItem(name: "Paris", image: "https://source.unsplash.com/random/150x150", fontFamily: "Ubuntu", category: "lugares"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista con Imágenes y Fuentes'),
        ),
        body: ListView.builder(
          itemCount: items.length * 2, // Multiplicamos por 2 para incluir divisiones
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider(); // Agregar Divider en índices impares
            final itemIndex = index ~/ 2; // Obtener el índice del elemento de la lista
            return _buildListItem(items[itemIndex]);
          },
        ),
      ),
    );
  }

  Widget _buildListItem(ListItem item) {
    return ListTile(
      leading: Image(
        image: item.image.startsWith('http')
            ? NetworkImage(item.image)
            : AssetImage(item.image) as ImageProvider,
        width: 50,
        height: 50,
      ),
      title: Text(
        item.name,
        style: TextStyle(
          fontFamily: item.fontFamily,
          fontSize: 20,
        ),
      ),
    );
  }
}
