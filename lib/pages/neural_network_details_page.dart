import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NeuralNetworkDetailsPage extends StatelessWidget {
  const NeuralNetworkDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la red neuronal'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Arquitectura',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const Gap(12),
              Image.asset('assets/images/architecture.png'),
              const Gap(28),
              const Text(
                'Curvas de aprendizaje',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const Gap(12),
              Image.asset('assets/images/curves.png'),
              const Gap(28),
              const Text(
                'Parámetros de entrenamiento',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const Gap(12),
              const Text(
                'Learning rate: 0.01  Batch Size: 32  Epochs: 10',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
