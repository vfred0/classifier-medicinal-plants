import 'package:medicinal_plants/widgets/training_parameter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NeuralNetworkDetailsPage extends StatelessWidget {
  const NeuralNetworkDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Arquitectura',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(12),
          Image.asset('assets/model/details/architecture.png'),
          const Gap(28),
          Text(
            'Curvas de aprendizaje',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(12),
          Image.asset('assets/model/details/accuracy.png'),
          const Gap(12),
          Image.asset('assets/model/details/loss.png'),
          const Gap(28),
          Text(
            'Parámetros de entrenamiento',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(12),
          const TrainingParameter('Learning rate: 0.0001'),
          const Gap(12),
          const TrainingParameter('Batch size: 32'),
          const Gap(12),
          const TrainingParameter('Epochs: 10'),
          const Gap(12),
          const TrainingParameter('Optimizer: Adam'),
        ],
      ),
    );
  }
}
