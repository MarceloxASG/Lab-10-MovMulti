import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProductDetails {
  final String name;
  final String image;
  final String price;
  final String description;

  ProductDetails({required this.name, required this.image, required this.price, required this.description});
}

class MyApp extends StatelessWidget {
  final ProductDetails product = ProductDetails(
    name: "MacBook Air M1",
    image: "assets/images/mac-m1.jpg",
    price: "\$999.99",
    description: "El MacBook Air M1 es una poderosa y eficiente computadora portátil con el chip M1 de Apple, ofreciendo un rendimiento excepcional y una increíble duración de la batería para tus necesidades diarias.",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detalles del Producto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image,
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(height: 20),
              Text(
                product.name,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                product.price,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                product.description,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
