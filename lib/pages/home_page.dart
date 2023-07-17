import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/category_medicinal_plant.dart';
import '../widgets/medicinal_plant_description.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> categoriesMedicinePlantsCards = [];

    for (var item in CategoryMedicinalPlant.values) {
      categoriesMedicinePlantsCards
          .add(CategoryMedicinalPlantCard(item.name, item.image));
      categoriesMedicinePlantsCards.add(const Gap(18));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Descripción del proyecto',
              style: Theme.of(context).textTheme.titleMedium),
          const Gap(18),
          Text(
            'Sistema de clasificación de plantas medicinales mediante el uso de redes neuronales convolucionales. Se ha hecho uso de la aqrquitectura MobileNetV3 Large',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gap(36),
          Text('Categorías de plantas medicinales',
              style: Theme.of(context).textTheme.titleMedium),
          const Gap(18),
          // ...categoriesMedicinePlantsCards
        ],
      ),
    );
  }
}
