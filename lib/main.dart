import 'dart:io';

import 'package:plants/pages/neural_network_details_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plants/models/disease_tomato_leaf.dart';
import 'package:plants/widgets/show_prediction.dart';

import 'plants.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeClassifierDiseaseLeaf(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeClassifierDiseaseLeaf extends StatefulWidget {
  const HomeClassifierDiseaseLeaf({super.key});

  @override
  State<HomeClassifierDiseaseLeaf> createState() =>
      _HomeClassifierDiseaseLeafState();
}

class _HomeClassifierDiseaseLeafState extends State<HomeClassifierDiseaseLeaf> {
  File? _image;
  DiseaseTomatoLeaf? _diseaseTomatoLeaf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 22, 20),
      appBar: AppBar(
        title: const Text(
          'Clasificador de plantas',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 20, 22, 20),
        elevation: 0, // Elimina la línea que separa la barra del cuerpo
        centerTitle: true, // Centra el título en la barra
      ),
      body: Column(
        children: [
          const Gap(12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  10), // Redondear los bordes de la imagen
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  10), // Redondear los bordes de la imagen
              child: setImage(),
            ),
          ),
          const Gap(12),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextButton.icon(
                  onPressed: () =>
                      loadImageAndSetPrediction(ImageSource.gallery),
                  icon: Icon(Icons.image_search_outlined),
                  label: Text('Carga la foto'),
                  style: TextButton.styleFrom(
                    primary: Color.fromARGB(255, 119, 119, 176),
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 78,
                        vertical:
                            12), // Ajustar el padding para hacer los botones más anchos
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Establecer el radio de los bordes redondeados
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextButton.icon(
                  onPressed: () =>
                      loadImageAndSetPrediction(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text('Toma la foto'),
                  style: TextButton.styleFrom(
                    primary: Color.fromARGB(255, 119, 119, 176),
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 78,
                        vertical:
                            12), // Ajustar el padding para hacer los botones más anchos
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Establecer el radio de los bordes redondeados
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          ShowPrediction(_diseaseTomatoLeaf),
        ],
      ),
    );
  }

  Future<void> loadImageAndSetPrediction(ImageSource imageSource) {
    return getImage(imageSource).then((image) {
      ClassifierDiseaseTomatoLeaf()
          .getPrediction(image)
          .then((diseaseTomatoLeaf) {
        setState(() {
          _image = image;
          _diseaseTomatoLeaf = diseaseTomatoLeaf;
        });
      });
    });
  }

  Future<File> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    return File(image!.path);
  }

  Widget setImage() {
    if (_image != null) {
      return Container(
        width: 275,
        height: 275,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10), // Redondear los bordes del contenedor
          color: Colors.white, // Color de fondo del contenedor
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(10), // Redondear los bordes de la imagen
          child: Image.file(_image!),
        ),
      );
    }
    return Image.asset(
      'assets/images/tomato-leaf.png',
      width: 275,
      height: 275,
      fit: BoxFit.cover,
    );
  }

  goToDetailsModal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NeuralNetworkDetailsPage()),
    );
  }
}
