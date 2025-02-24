import 'dart:io';
import 'dart:typed_data';
import 'package:befine/api/api_services.dart';
import 'package:befine/models/device.dart';
import 'package:befine/models/summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;


class AppProvider with ChangeNotifier {

  List<Device> _devices = [];
  List<SummaryModel> _summary = [];



  AppProvider() { }

 
  //Devices
  List<Device> getDevices() => _devices;
  setDevices(List<Device> device) {
    _devices = device;
    notifyListeners();
  }


  List<SummaryModel> getSummary() => _summary;
  setSummary(summary) {
    _summary = summary;
    notifyListeners();
  }

}
