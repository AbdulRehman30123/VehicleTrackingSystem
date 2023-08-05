import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/UI/searchvehiclescreen.dart';
import 'package:tracking/googlemapscreen/googlemapfunction.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String ownerName = "";
  String driverName1 = "";
  String numberPlate1 = "";
  String driverName2 = "";
  String numberPlate2 = "";
  String driverName3 = "";
  String numberPlate3 = "";
  var userid = FirebaseAuth.instance.currentUser!.uid;
  List searchResult = [];

  // getting raltime lat and ling from real time database from firebase
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

  // to get owner detail like name etc
  void getOwnerDetails() async {
    var _docs =
        await FirebaseFirestore.instance.collection("Owners").doc(userid).get();
    Map<String, dynamic>? record = _docs.data();
    var _ownername = record!['name'];
    setState(() {
      ownerName = _ownername;
    });
  }

  void getvehicleDetailsone() async {
    var _doc = await FirebaseFirestore.instance
        .collection("Owners")
        .doc(userid)
        .collection("vehicles")
        .doc("s-3846")
        .collection("vehiclename")
        .doc("Swift")
        .get();
    Map<String, dynamic>? data = _doc.data();
    var _drivername = data!['drivername'];
    var _numberplate = data['numberplate'];
    setState(() {
      driverName1 = _drivername;
      numberPlate1 = _numberplate;

      print(driverName1);
      print(numberPlate1);
    });
  }

  void getvehicleDetailtwo() async {
    // hum isko path de rhe hain
    var _doc = await FirebaseFirestore.instance
        .collection("Owners")
        .doc(userid)
        .collection("vehicles")
        .doc("UJ-317")
        .collection("vehiclename")
        .doc("Vitz")
        .get();
    // hamare pas jo raw data agya h usko hum convert krrhe hain
    Map<String, dynamic>? data = _doc.data();
    var _drivername = data!['drivername'];
    var _numberplate = data['numberplate'];
    // hum oper khali variable bnae h un m data enter krrhe hain
    setState(() {
      driverName2 = _drivername;
      numberPlate2 = _numberplate;

      print(driverName2);
      print(numberPlate2);
    });
  }

  void getvehicleDetailthree() async {
    // hum isko path de rhe hain
    var _doc = await FirebaseFirestore.instance
        .collection("Owners")
        .doc(userid)
        .collection("vehicles")
        .doc("ACU-9124")
        .collection("vehiclename")
        .doc("Corolla Exi")
        .get();
    // hamare pas jo raw data agya h usko hum convert krrhe hain
    Map<String, dynamic>? data = _doc.data();
    var _drivername = data!['drivername'];
    var _numberplate = data['numberplate'];
    // hum oper khali variable bnae h un m data enter krrhe hain
    setState(() {
      driverName3 = _drivername;
      numberPlate3 = _numberplate;

      print(driverName3);
      print(numberPlate3);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getOwnerDetails();
    getvehicleDetailsone();
    getvehicleDetailtwo();
    getvehicleDetailthree();
    getlongData();
    getlatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Welcome",
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      ownerName,
                      style: GoogleFonts.pacifico(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Track Your Vehicles",
                          style: GoogleFonts.roboto(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Enter Vehicle Plate Number",
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SearchVehicleScreen(),
                              ),
                            );
                          },
                          child: const Text("Let's Track"))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Vehicles",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "See All >>",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                      child: GestureDetector(
                        onTap: () {
                          MapUtils.openMap(latitude, longitude);
                        },
                        child: Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 15.0, // soften the shadow
                                spreadRadius: 5.0, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                driverName1,
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  numberPlate1,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                driverName2,
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                numberPlate2,
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                      child: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                driverName3,
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                numberPlate3,
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
