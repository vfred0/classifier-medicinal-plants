import 'package:flutter/material.dart';

import '../models/medicinal_plant.dart';

class ShowMedicinalPlantPrediction extends StatelessWidget {
  final MedicinalPlant medicinalPlant;

  const ShowMedicinalPlantPrediction({Key? key, required this.medicinalPlant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'La planta pertenece a la categoría ${medicinalPlant.category.name}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium),
          Text(
            'Confianza: ${(medicinalPlant.confidence)}%',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Image.asset(
                  'assets/images/${medicinalPlant.category.image}.jpg')),
        ],
      ),
    );
  }
}
