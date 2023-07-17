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
      width: 250,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF1D3D59)),
          foregroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFEFEFEF)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(20)),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        onPressed: onClick,
        child: Row(
          children: [Icon(icon, size: 25), const Gap(10), Text(title)],
        ),
      ),
    );
  }
}
