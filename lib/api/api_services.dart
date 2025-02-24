import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:befine/models/device.dart';
import 'package:befine/providers/app_provider.dart';
import 'package:provider/provider.dart';
import '../config/config.dart';
import 'package:flutter/material.dart';
import '../../config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final AppProvider appProvider;
  final _dio = Dio();

  late Device device;

  ApiService({required this.appProvider});


  // Get All Devices  //
  Future<List<Device>> getDevices() async {
    String uri = "$serverProtocol$serverUrl/api/devices";
    var response = await Dio().get(
      uri,
      options: Options(
        contentType: "application/json",
        headers: <String, dynamic>{
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      final devices = <Device>[];
      int index = 0;
      for (final data in response.data) {
        var item = Device.fromJson(data as Map<String, dynamic>);
        devices.add(item);
      }
      appProvider.setDevices(devices);
      return devices;
    } else {
      throw Exception("Unexpected Happened !");
    }
  }

  Future addDevice({required data}) async {
    String uri = "$serverProtocol$serverUrl/api/devices";

    var response = await Dio().post(
      uri,
      data: data,
      //  queryParameters: queryParameters,
      options: Options(
        contentType: "application/json",
        headers: <String, dynamic>{
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      print('FormAddDevice${response.data['id']}');
    } else {
      print(" DeviceFormUpdateAdd Status${response.statusCode}");

      throw Exception("Unexpected Happened !");
    }
  }


  Future deleteDevice({required int deviceId}) async {
    String uri = "$serverProtocol$serverUrl/api/devices/$deviceId";

    var response = await Dio().delete(
      uri,
      options: Options(
        contentType: "application/json",
        headers: <String, dynamic>{
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 204) {
      print(" device Deleted");
    } else {
      print(" device Deleted Status${response.statusCode}");

      throw Exception("Unexpected Happened !");
    }
  }
  Future updateDevice({required int deviceId, required data}) async {
    String uri = "$serverProtocol$serverUrl/api/devices/$deviceId";

    var response = await Dio().put(
      uri,
      data: data,
      options: Options(
        contentType: "application/json",
        headers: <String, dynamic>{
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      print('deviceFormUpdated');
    } else {
      print("deviceFormNotUpdated");

      throw Exception("Unexpected Happened !");
    }
  }

 
}
