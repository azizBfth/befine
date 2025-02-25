import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 117, 117, 117),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text widget
                  Text(
                    "Hello Mark!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // Circular profile image with onPressed functionality
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/profile");
                      print("Profile image tapped!");
                    },
                    child: CircleAvatar(
                      radius: 25, // Size of the circle
                      backgroundImage: AssetImage(
                          'assets/images/profile.png'), // Replace with the path to your image asset
                      backgroundColor: Colors
                          .transparent, // Optional: transparent background
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildSummaryCard(),
              const SizedBox(height: 16),
              _buildWeatherCard(),
              const SizedBox(height: 16),
              _buildSymptomsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.lightBlue, const Color.fromARGB(255, 25, 2, 128)]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your 30 days summary",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          // Row for three pie charts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Schedule Success PieChart
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                  value: 80,
                                  title: '80%',
                                  color: Colors.green,
                                  radius: 40),
                              PieChartSectionData(
                                  value: 20,
                                  title: '20%',
                                  color: Colors.red,
                                  radius: 40),
                            ],
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Schedule\nSuccess",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          backgroundColor: Colors.transparent),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),

              // Peak Flow PieChart
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                  value: 60,
                                  title: '60%',
                                  color: Colors.blue,
                                  radius: 40),
                              PieChartSectionData(
                                  value: 40,
                                  title: '40%',
                                  color: Colors.orange,
                                  radius: 40),
                            ],
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Peak\nFlow",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          backgroundColor: Colors.transparent),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // Emergency PieChart
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                  value: 70,
                                  title: '70%',
                                  color: Colors.purple,
                                  radius: 40),
                              PieChartSectionData(
                                  value: 30,
                                  title: '30%',
                                  color: Colors.yellow,
                                  radius: 40),
                            ],
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Emergency\nmeds",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          backgroundColor: Colors.transparent),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2)
        ],
        image: DecorationImage(
          image: AssetImage(
              "assets/images/weather_bg.jpg"), // Remplace avec ton image
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Overlay pour améliorer la lisibilité
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.6)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today in Sydney",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("24°C",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                        Text("Sunny day 26° / 11°",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.air, color: Colors.white70, size: 20),
                            SizedBox(width: 5),
                            Text("13 km/h",
                                style: TextStyle(color: Colors.white70)),
                            SizedBox(width: 15),
                            Icon(Icons.opacity,
                                color: Colors.white70, size: 20),
                            SizedBox(width: 5),
                            Text("24%",
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.wb_sunny, color: Colors.yellowAccent, size: 60),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Last 7 days symptoms",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text("5 recordings", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 5),
          Text("Most common trigger: Tobacco smoke",
              style: TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            child: Text("Track your symptoms",
                style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
