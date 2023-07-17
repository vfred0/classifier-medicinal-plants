import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicinal_plants/ui/theme.dart' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:medicinal_plants/utils/classifier_medicinal_plant.dart';
import 'package:medicinal_plants/models/medicinal_plant.dart';
import 'package:medicinal_plants/ui/widgets/button.dart';
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
    return Column(
      children: [
        const Gap(12),
        showDefaultImageOrFromMultimedia(),
        const Gap(12),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ActionButton(
              'Cargar desde galería',
              Icons.image,
              () => loadImageAndSetPrediction(ImageSource.gallery),
            ),
            const SizedBox(height: 12),
            ActionButton('Usar cámara', Icons.camera_alt,
                () => loadImageAndSetPrediction(ImageSource.camera)),
            const SizedBox(height: 12),
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
          ],
        ),
      ],
    );
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
