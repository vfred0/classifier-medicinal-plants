import 'package:medicinal_plants/ui/theme.dart' as ui;
import 'package:medicinal_plants/ui/pages/classifier_page.dart';
import 'package:medicinal_plants/ui/pages/neural_network_details_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ui.Theme().theme(),
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
    ClassifierPage(),
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
        )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ui.Theme().theme().colorScheme.primary,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: buttonSize,
                ),
                label: 'Tomar foto',
                backgroundColor: Theme.of(context).colorScheme.secondary),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt_outlined,
                  size: buttonSize,
                ),
                label: 'Red neuronal',
                backgroundColor: Theme.of(context).colorScheme.secondary),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.tertiary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedLabelStyle: Theme.of(context).textTheme.titleMedium,
          unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
          onTap: _onItemTapped,
        ));
  }
}
