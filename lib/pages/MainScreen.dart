import 'package:befine/pages/DashboardScreen.dart';
import 'package:befine/pages/HealthScreen.dart';
import 'package:befine/pages/HomeScreen.dart';
import 'package:befine/pages/ProfileScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85), // More transparent background
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // Subtle shadow
                  blurRadius: 8, // Soft blur radius
                  spreadRadius: 3, // Slight spread to focus the bar
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color.fromARGB(255, 1, 136, 247), // Bright color for selected item
              unselectedItemColor: Colors.grey.shade600, // Lighter color for unselected items
              backgroundColor: Colors.transparent, // Transparent background for the BottomNavigationBar itself
              elevation: 0, // No elevation for a clean look
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home), 
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history), 
                  label: "History",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.medical_services), 
                  label: "Symptoms",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), 
                  label: "More",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
