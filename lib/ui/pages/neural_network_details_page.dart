import 'package:medicinal_plants/ui/theme.dart' as ui;
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
          ui.Theme().titleMedium('Arquitectura Xception'),          
          const Gap(12),
          ui.Theme().borderRadius(
            32,
            Image.asset(
              'assets/model/details/architecture.png',
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(28),
          ui.Theme().titleMedium('Curvas de aprendizaje'),
          const Gap(12),
          ui.Theme().titleMedium('Precisión'),
          const Gap(12),
          ui.Theme().borderRadius(
            32,
            Image.asset(
              'assets/model/details/accuracy.png',
            ),
          ),
          const Gap(12),
          ui.Theme().titleMedium('Pérdida'),
          const Gap(12),
          ui.Theme().borderRadius(
            32,
            Image.asset(
              'assets/model/details/loss.png',
            ),
          ),          
          const Gap(28),
          ui.Theme().titleMedium('Parámetros de entrenamiento'),
          const Gap(12),
          ui.Theme().bodyLarge('Tamaño de imagen: 224x224'),                    
          const Gap(12),
          ui.Theme().bodyLarge('Tasa de aprendizaje: 0.0001'),
          const Gap(12),
          ui.Theme().bodyLarge('Batch size: 32'),          
          const Gap(12),
          ui.Theme().bodyLarge('Épocas: 10'),                    
        ],
      ),
    );
  }
}
