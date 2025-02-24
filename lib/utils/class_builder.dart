

import 'package:befine/pages/DeviceScreen.dart';
import 'package:befine/pages/HealthScreen.dart';
import 'package:befine/pages/HomeScreen.dart';
import 'package:befine/pages/MainScreen.dart';
import 'package:befine/pages/ProfileScreen.dart';
import 'package:befine/pages/SettingsScreen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<DevicePage>(() => DevicePage());
    register<HomeScreen>(() => HomeScreen());
    register<SettingsPage>(() => SettingsPage());
    register<MainScreen>(() => MainScreen());
    register<HealthScreen>(() => HealthScreen());
    register<Profilescreen>(() => Profilescreen());

  


  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}
