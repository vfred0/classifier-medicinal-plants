import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  const ActionButton(this.title, this.icon, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(        
      width: 300,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.secondary,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primary,
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(20),
          ),
          textStyle: MaterialStateProperty.all<TextStyle?>(
            Theme.of(context).textTheme.titleMedium,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder?>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onClick,
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 25),
              const Gap(10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
