import 'package:medicinal_plants/ui/theme.dart' as ui;
import 'package:flutter/material.dart';

class NeuralNetworkDetailsPage extends StatelessWidget {
  const NeuralNetworkDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = ui.Theme();
    var details = 'assets/model/details';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: theme.column(widgets: [
        theme.titleMedium('Arquitectura con Xception'),
        theme.borderRadius(
          32,
          Image.asset('$details/architecture.png', width: 300),
        ),
        theme.titleMedium('Curvas de aprendizaje'),
        theme.titleMedium('Precisión'),
        theme.borderRadius(32, Image.asset('$details/accuracy.png')),
        theme.titleMedium('Pérdida'),
        theme.borderRadius(32, Image.asset('$details/loss.png')),
        theme.column(widgets: [
          theme.titleMedium('Parámetros de entrenamiento'),
          theme.titleMedium('Imágenes'),
          theme.bodyLarge('Tamaño de imagen: 256x256'),
          theme.bodyLarge('Batch size: 128'),
          theme.titleMedium('Entrenamiento'),
          theme.bodyLarge('Tasa de aprendizaje: 0.0001'),
          theme.bodyLarge('Función de pérdida: Categorical Crossentropy'),
          theme.bodyLarge('Función de activación: Softmax'),
          theme.bodyLarge('Métrica: Accuracy'),
          theme.bodyLarge('Optimizador: Adam'),
          theme.bodyLarge('Épocas: 10'),
        ], gap: 8)
      ], gap: 18),
    );
  }
}
