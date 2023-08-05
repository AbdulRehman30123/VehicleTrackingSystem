import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/googlemapscreen/googlemapfunction.dart';

const latitude = 33.7463;
const longitude = 72.8397;

class SearchVehicleScreen extends StatefulWidget {
  const SearchVehicleScreen({Key? key}) : super(key: key);

  @override
  State<SearchVehicleScreen> createState() => _SearchVehicleScreenState();
}

class _SearchVehicleScreenState extends State<SearchVehicleScreen> {
  var userid = FirebaseAuth.instance.currentUser!.uid;
  List searchResult = [];
  // geting realtime data
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

  void searchfromfirebase(query) async {
    final result = await FirebaseFirestore.instance
        .collection("Owners")
        .doc(userid)
        .collection("vehicles")
        .where("id", isEqualTo: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getlatData();
    getlongData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: TextField(
                  onChanged: (query) {
                    searchfromfirebase(query);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      hintText: "Plate Number",
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: GestureDetector(
                        onTap: () {
                          MapUtils.openMap(latitude, longitude);
                        },
                        child: ListTile(
                          tileColor: Colors.grey,
                          title: Text(
                            searchResult[index]['id'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
