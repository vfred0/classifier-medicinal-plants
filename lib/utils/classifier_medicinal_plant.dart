import 'dart:io';
import 'package:medicinal_plants/models/medicinal_plant.dart';
import 'package:medicinal_plants/utils/category_medicinal_plant.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ClassifierMedicinalPlant {
  Future<MedicinalPlant> getPrediction(File image) async {
    await Tflite.loadModel(
      model: 'assets/model/model.tflite',
      labels: 'assets/model/labels.txt',
    );

    var prediction = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );
    if (prediction!.isEmpty) {
      prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 1,
        threshold: 0.2,
        asynch: true,
      );
    }

    return MedicinalPlant(
      prediction![0]['confidence'],
      CategoryMedicinalPlant.categoryByName(prediction[0]['label']),
    );
  }
}
