import 'package:flutter/material.dart';
import '../../models/medicinal_plant.dart';
import 'package:medicinal_plants/ui/theme.dart' as ui;

class ShowMedicinalPlantPrediction extends StatelessWidget {
  final MedicinalPlant medicinalPlant;

  const ShowMedicinalPlantPrediction({Key? key, required this.medicinalPlant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = ui.Theme();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.all(32),
      child: theme.column(widgets: [
        theme.bodyLarge('Confianza: ${medicinalPlant.confidence}%'),
        theme.titleMedium('La planta es ${medicinalPlant.category.name}'),
        theme.bodyMedium(medicinalPlant.category.description),
        theme.borderRadius(
          32,
          Image.asset(
            'assets/images/categories/${medicinalPlant.category.image}.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        )
      ], gap: 12),
    );
  }
}
