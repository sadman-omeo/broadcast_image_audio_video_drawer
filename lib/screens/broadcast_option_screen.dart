import 'package:flutter/material.dart';
import 'custom_input_screen.dart';
import 'battery_screen.dart';


class BroadcastOptionScreen extends StatefulWidget {
  const BroadcastOptionScreen({super.key});

  @override
  State<BroadcastOptionScreen> createState() => _BroadcastOptionScreenState();
}

class _BroadcastOptionScreenState extends State<BroadcastOptionScreen> {
  String selected_option = "Custom broadcast receiver";

  final List<String> options = [
    "Custom broadcast receiver",
    "System Battery Notification receiver",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Broadcast Options"),
          backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [

            SizedBox(height: 20,),
            Text("Select Broadcast type: ", style: TextStyle(fontSize:15),),

            SizedBox(height: 30),

            //Dropdown menu
            DropdownButton <String>(
              value: selected_option,
              isExpanded: true,
              items: options.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selected_option = newValue!;
                });
              },
            ),

            SizedBox(height: 30),

            //Proceed button
            ElevatedButton(
              onPressed: () {
                if (selected_option == "Custom broadcast receiver") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomInputScreen(),
                    ),
                  );
                }
                else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BatteryScreen(),
                    ),
                  );
                }
              },
              child: Text("Proceed", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}


