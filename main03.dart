import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Imágenes',
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatelessWidget {
  final List<ImageDetails> images = [
    ImageDetails(
      path: 'assets/images/ferrari.png',
      name: 'Imagen PNG',
      fontFamily: 'PoetsenOne',
    ),
    ImageDetails(
      path: 'assets/images/mac-m1.jpeg',
      name: 'Imagen JPEG',
      fontFamily: 'Roboto',
    ),
    ImageDetails(
      path: 'assets/images/manzana.svg',
      name: 'Imagen SVG',
      fontFamily: 'Tinos',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galería de Imágenes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ImageCard(imageDetails: images[index]);
          },
        ),
      ),
    );
  }
}

class ImageDetails {
  final String path;
  final String name;
  final String fontFamily;

  ImageDetails({
    required this.path,
    required this.name,
    required this.fontFamily,
  });
}

class ImageCard extends StatelessWidget {
  final ImageDetails imageDetails;

  const ImageCard({Key? key, required this.imageDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: imageDetails.path.endsWith('.svg')
              ? SvgPicture.asset(imageDetails.path)
              : Image.asset(imageDetails.path),
        ),
        SizedBox(height: 8),
        Text(
          imageDetails.name,
          style: TextStyle(
            fontFamily: imageDetails.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
