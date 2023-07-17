import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryMedicinalPlantCard extends StatelessWidget {
  final String name;
  final String imageName;
  const CategoryMedicinalPlantCard(this.name, this.imageName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: Theme.of(context).textTheme.titleMedium),
        const Gap(12),
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              image: AssetImage('assets/images/$imageName.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
