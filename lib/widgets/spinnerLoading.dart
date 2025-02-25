import 'package:befine/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:befine/api/api_services.dart';

class LoadingSpin extends StatefulWidget {
  const LoadingSpin({Key? key}) : super(key: key);

  @override
  _LoadingSpinState createState() => _LoadingSpinState();
}

class _LoadingSpinState extends State<LoadingSpin> {
  @override
  void initState() {
    super.initState();
    getSharedPrefrences().then((data) {});
  }

  Future getSharedPrefrences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      Navigator.of(context).pushNamed('/main');
    } catch (error) {
      print("error");
    }

    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SpinKitFadingFour(
              color: Colors.blue,
              size: 50.0,
            ),
          ),
        ));
  }
}
