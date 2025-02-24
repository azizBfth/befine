import 'package:flutter/material.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Dashboard Page", style: TextStyle(fontSize: 24)),
    );
  }
}