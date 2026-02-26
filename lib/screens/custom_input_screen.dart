import 'package:flutter/material.dart';
import 'custom_receiver_screen.dart';



class CustomInputScreen extends StatefulWidget {
  const CustomInputScreen({super.key});

  @override
  State<CustomInputScreen> createState() => _CustomInputScreenState();

}



class _CustomInputScreenState extends State<CustomInputScreen> {

  final TextEditingController _controller = TextEditingController();

  @override
  //always have to dispose the controller
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Broadcast Input"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter your desired message: ",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
                onPressed: (){
                  String message = _controller.text.trim();

                  if (message.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please enter a message"),
                      ),
                    );
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Message sending..."),
                      ),
                    );
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomReceiverScreen(message: message),
                      ),
                  );
                },

                child: Text("Send Broadcast", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}