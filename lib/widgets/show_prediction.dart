import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:plants/models/disease_tomato_leaf.dart';

class ShowPrediction extends StatelessWidget {
  final DiseaseTomatoLeaf? _diseaseTomatoLeaf;
  const ShowPrediction(this._diseaseTomatoLeaf, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_diseaseTomatoLeaf != null) {
      return Column(
        children: [
          Text('Predicción: ${_diseaseTomatoLeaf!.label}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          const Gap(12),
          Text('Confianza: ${_diseaseTomatoLeaf!.confidencePercent}%',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
        ],
      );
    }
    return Container();
  }
}
