import 'package:medicinal_plants/utils/category_medicinal_plant.dart';

class MedicinalPlant {
  final double _confidence;
  final CategoryMedicinalPlant category;
  const MedicinalPlant(this._confidence, this.category);

  get confidence => (_confidence * 100).toStringAsFixed(2);
}
