import 'package:medicinal_plants/pages/classifier_medicinal_plants_page.dart';
import 'package:medicinal_plants/pages/home_page.dart';
import 'package:medicinal_plants/pages/neural_network_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context)
                .textTheme
                .apply(bodyColor: const Color(0xFFEFEFEF)))
            .copyWith(
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFEFEFEF),
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFEFEFEF),
          ),
        ),
      ),
      title: 'Clasificador de plantas medicinales',
      home: const MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  double buttonSize = 30;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ClassifierMedicinalPlantPage(),
    NeuralNetworkDetailsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161D22),
        appBar: AppBar(
          title: Text(
            'Clasificador de plantas medicinales',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color(0xFF161D22),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF161D22),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: buttonSize),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: buttonSize,
                ),
                label: 'Tomar foto',
                backgroundColor: const Color.fromARGB(255, 20, 128, 230)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.info_outline,
                  size: buttonSize,
                ),
                label: 'Detalles CNN',
                backgroundColor: const Color.fromARGB(255, 112, 118, 123)),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF20B266),
          unselectedItemColor: const Color.fromARGB(255, 93, 83, 83),
          onTap: _onItemTapped,
        ));
  }
}
