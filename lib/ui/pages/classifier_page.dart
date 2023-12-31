import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medicinal_plants/ui/theme.dart' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:medicinal_plants/utils/classifier_medicinal_plant.dart';
import 'package:medicinal_plants/models/medicinal_plant.dart';
import 'package:medicinal_plants/ui/widgets/action_button.dart';
import 'package:medicinal_plants/ui/widgets/show_medicinal_plant_prediction.dart';

class ClassifierPage extends StatefulWidget {
  const ClassifierPage({super.key});

  @override
  State<ClassifierPage> createState() => _ClassifierPageState();
}

class _ClassifierPageState extends State<ClassifierPage> {
  File? _image;
  MedicinalPlant? _medicinalPlant;

  @override
  Widget build(BuildContext context) {
    return ui.Theme().column(widgets: [
      showDefaultImageOrFromMultimedia(),
      _multimediaButton(
          'Cargar desde galería', Icons.image, ImageSource.gallery),
      _multimediaButton('Usar cámara', Icons.camera_alt, ImageSource.camera),
      if (_medicinalPlant != null)
        ActionButton(
          'Ver predicción',
          Icons.remove_red_eye,
          () => showModalBottomSheet(
            context: context,
            builder: (BuildContext buildContext) {
              return ShowMedicinalPlantPrediction(
                medicinalPlant: _medicinalPlant!,
              );
            },
          ),
        ),
    ], gap: 12);
  }

  ActionButton _multimediaButton(
      String title, IconData icon, ImageSource imageSource) {
    return ActionButton(
        title, icon, () => loadImageAndSetPrediction(imageSource));
  }

  Future<void> loadImageAndSetPrediction(ImageSource imageSource) {
    return getImage(imageSource).then((image) {
      ClassifierMedicinalPlant().getPrediction(image).then((medicinalPlant) {
        setState(() {
          _image = image;
          _medicinalPlant = medicinalPlant;
        });
      });
    });
  }

  Future<File> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    return File(image!.path);
  }

  Widget showDefaultImageOrFromMultimedia() {
    var width = 450.0;
    var height = 300.0;

    if (_image != null) {
      return Container(
        child: ui.Theme().borderRadius(
            32,
            Image.file(_image!,
                width: width, height: height, fit: BoxFit.cover)),
      );
    }

    return Container(
      child: ui.Theme().borderRadius(
          32,
          Image.asset(
            'assets/images/camera.jpg',
            width: width,
            height: height,
            fit: BoxFit.cover,
          )),
    );
  }
}
