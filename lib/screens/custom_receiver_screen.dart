import 'package:flutter/material.dart';




class CustomReceiverScreen extends StatelessWidget {
  final String message;

  const CustomReceiverScreen({super.key, required this.message});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Broadcast Receiver"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Received Message: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Text(message, style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),

    );
  }

}