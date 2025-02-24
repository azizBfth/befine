
import 'package:befine/pages/DashboardScreen.dart';
import 'package:befine/pages/HealthScreen.dart';
import 'package:befine/pages/HomeScreen.dart';
import 'package:befine/pages/ProfileScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Liste des pages
  final List<Widget> _pages = [
    const HomeScreen(),
    const HealthScreen(),
    const DashbordScreen(),
    const Profilescreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Pour éviter l'animation si + de 3 items
        selectedItemColor: Colors.blue, // Couleur de l'élément sélectionné
        unselectedItemColor: Colors.grey, // Couleur des éléments non sélectionnés
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: "Health"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
