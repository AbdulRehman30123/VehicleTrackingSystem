import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tracking/googlemapscreen/googlemapfunction.dart';

class GetRealtimeData extends StatefulWidget {
  const GetRealtimeData({Key? key}) : super(key: key);

  @override
  State<GetRealtimeData> createState() => _GetRealtimeDataState();
}

class _GetRealtimeDataState extends State<GetRealtimeData> {
  var userid = FirebaseAuth.instance.currentUser!.uid;
  var latitude;
  var longitude;
  void getlatData() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('lat');
    starCountRef.onValue.listen(
      (DatabaseEvent event) {
        final data = event.snapshot.value;
        print("lat is ${data}");
        setState(
          () {
            latitude = data;
          },
        );
      },
    );
  }

  void getlongData() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('long');
    starCountRef.onValue.listen(
      (DatabaseEvent event) {
        final data = event.snapshot.value;
        print("long is ${data}");
        setState(() {
          longitude = data;
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getlatData();
    getlongData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  MapUtils.openMap(latitude, longitude);
                },
                child: Text("press to open"))
          ],
        ),
      ),
    );
  }
}
