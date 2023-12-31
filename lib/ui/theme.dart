import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Theme {
  ThemeData theme() => ThemeData(
        useMaterial3: true,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFF161D22),
              secondary: const Color(0xFFEFEFEF),
              tertiary: const Color(0xFF20B266),
              brightness: Brightness.dark,
            ),
        textTheme: GoogleFonts.montserratTextTheme(
          const TextTheme(
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFFEFEFEF),
            ),
            bodyLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFFEFEFEF),
            ),
          ),
        ),
      );

  Widget titleMedium(String text) => Text(
        text,
        style: theme().textTheme.titleMedium,
      );
  Widget bodyMedium(String text) => Text(
        text,
        style: theme().textTheme.bodyMedium,
      );

  Widget bodyLarge(String text) => Text(
        text,
        style: theme().textTheme.bodyLarge,
      );

  Widget borderRadius(double radius, Widget child) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: child,
      );

  Widget column({required List<Widget> widgets, required double gap}) {
    List<Widget> widgetsWithGap = [];
    for (var element in widgets) {
      widgetsWithGap.add(element);
      widgetsWithGap.add(Gap(gap));
    }
    return Column(      
      mainAxisSize: MainAxisSize.min,
      children: widgetsWithGap,
    );
  }
}
