import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';





class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();

}



class _BatteryScreenState extends State<BatteryScreen> {

  final Battery _battery = Battery();
  int _battery_level = -1;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();

  }

  Future<void> _getBatteryLevel() async {
    final level = await _battery.batteryLevel;

    setState(() {
      _battery_level = level;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Battery Percentage"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _battery_level == -1
            ? const CircularProgressIndicator()
            : Text(
                "Battery Level: $_battery_level%",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
      ),

    );
  }

}