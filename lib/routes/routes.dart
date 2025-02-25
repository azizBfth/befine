import 'package:befine/pages/DeviceScreen.dart';
import 'package:befine/pages/HealthScreen.dart';
import 'package:befine/pages/HomeScreen.dart';
import 'package:befine/pages/MainScreen.dart';
import 'package:befine/pages/ProfileScreen.dart';
import 'package:befine/pages/SettingsScreen.dart';
import 'package:befine/widgets/spinnerLoading.dart';
import 'package:flutter/material.dart';

class routeGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    final args = setting.arguments;
    switch (setting.name) {
      case '/loadingSpin':
        return MaterialPageRoute(builder: (_) => LoadingSpin());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen());
        case '/health':
        return MaterialPageRoute(builder: (_) => HealthScreen());
        case '/profile':
        return MaterialPageRoute(builder: (_) => Profilescreen());
      case '/devices':
        return MaterialPageRoute(builder: (_) => DevicePage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

var routes = <String, WidgetBuilder>{
  '/mainscreen': (context) => MainScreen(),
  '/devices': (context) => DevicePage(),
  '/settings': (context) => SettingsPage(),
  '/loadingSpin': (context) => LoadingSpin(),
    '/profile': (context) => Profilescreen(),
  '/hjealth': (context) => HealthScreen(),





};
