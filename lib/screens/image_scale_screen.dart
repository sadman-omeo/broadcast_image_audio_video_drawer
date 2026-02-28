import 'package:flutter/material.dart';




class ImageScaleScreen extends StatelessWidget {
  const ImageScaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Scale: WHY FLUTTER IS LOVE????", style: TextStyle(fontSize: 15),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height:10),
            Text(
              "Use pinch gesture to zoom this legendary image!",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height:8),
            Expanded(
              child: InteractiveViewer(
                maxScale: 4,
                child: Image.network(
                  "https://pbs.twimg.com/media/FWCT_cdaMAAxeAU?format=jpg&name=medium",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}