import 'package:medicinal_plants/ui/theme.dart' as ui;
import 'package:medicinal_plants/ui/pages/classifier_page.dart';
import 'package:medicinal_plants/ui/pages/neural_network_details_page.dart';
import 'package:flutter/material.dart';
import 'package:medicinal_plants/ui/widgets/menu.dart';

void main() => runApp(const MedicinalPlantApp());

class MedicinalPlantApp extends StatelessWidget {
  const MedicinalPlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ui.Theme().theme(),
      title: 'Clasificador de plantas medicinales',
      home: const ScaffoldWithMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScaffoldWithMenu extends StatefulWidget {
  const ScaffoldWithMenu({Key? key}) : super(key: key);

  @override
  State<ScaffoldWithMenu> createState() => _ScaffoldWithMenuState();
}

class _ScaffoldWithMenuState extends State<ScaffoldWithMenu> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ClassifierPage(),
    NeuralNetworkDetailsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'Clasificador de plantas medicinales',
          style: Theme.of(context).textTheme.titleMedium,
          selectionColor: Theme.of(context).colorScheme.secondary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Menu(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
