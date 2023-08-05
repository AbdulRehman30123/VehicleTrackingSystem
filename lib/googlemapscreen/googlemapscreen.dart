import 'package:flutter/material.dart';
import 'package:tracking/googlemapscreen/googlemapfunction.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                MapUtils.openMap(33.7463, 72.8397);
              },
              child: Text("Track Vehicle"),
            )
          ],
        ),
      ),
    );
  }
}
