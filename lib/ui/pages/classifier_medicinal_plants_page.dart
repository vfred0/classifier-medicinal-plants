import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicinal_plants/utils/classifier_medicinal_plant.dart';
import 'package:medicinal_plants/models/medicinal_plant.dart';
import 'package:medicinal_plants/ui/widgets/button.dart';
import 'package:medicinal_plants/ui/widgets/show_medicinal_plant_prediction.dart';

class ClassifierMedicinalPlantPage extends StatefulWidget {
  const ClassifierMedicinalPlantPage({super.key});

  @override
  State<ClassifierMedicinalPlantPage> createState() =>
      _ClassifierMedicinalPlantPageState();
}

class _ClassifierMedicinalPlantPageState
    extends State<ClassifierMedicinalPlantPage> {
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
              'Subir desde galería',
              Icons.image_outlined,
              () => loadImageAndSetPrediction(ImageSource.gallery),
            ),
            const SizedBox(height: 12),
            ActionButton('Usar cámara', Icons.camera_alt_outlined,
                () => loadImageAndSetPrediction(ImageSource.camera)),
            const SizedBox(height: 12),
            if (_medicinalPlant != null)
              ActionButton(
                'Ver predicción',
                Icons.remove_red_eye_outlined,
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
    if (_image != null) {
      return Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Image.file(_image!, fit: BoxFit.cover),
      );
    }

    return Container(
      width: 500,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        image: const DecorationImage(
          image: AssetImage('assets/images/camera.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
