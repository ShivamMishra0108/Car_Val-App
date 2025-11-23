import 'package:car_val/pages/homepage.dart';
import 'package:car_val/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EntryPoint extends StatefulWidget {
  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  Widget _defaultPage = CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('isLoggedIn');

    if (isFirstTime == true) {
      setState(() {
        _defaultPage = HomePage();
      });
    } else {
      setState(() {
        _defaultPage = LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _defaultPage));
  }
}
