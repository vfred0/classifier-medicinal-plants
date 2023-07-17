import 'package:flutter/material.dart';

class TrainingParameter extends StatelessWidget {
  final String name;
  const TrainingParameter(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
