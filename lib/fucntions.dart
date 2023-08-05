// storre owner's vehicles

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void createVehiclECollection(vehiclenumberplate) async {
  var ownerid = await FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance
      .collection("Owners")
      .doc(ownerid)
      .collection("vehicles")
      .doc(vehiclenumberplate)
      .set(
    {"id": vehiclenumberplate},
  );
}

void storeVehicleData(
    vehiclenumberplate, vehiclename, drivername, numberplate) async {
  var ownerid = await FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance
      .collection("Owners")
      .doc(ownerid)
      .collection("vehicles")
      .doc(vehiclenumberplate)
      .collection("vehiclename")
      .doc(vehiclename)
      .set(
    {
      "drivername": drivername,
      "numberplate": numberplate,
      "vehiclename": vehiclename
    },
  );
}

// messages to show
void wrongEmailMessage(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Incorrect Email "),
        );
      });
}

void wrongPasswordMessage(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Incorrect Password "),
        );
      });
}

void passwordtoShort(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Password is too weak "),
        );
      });
}

void accountAlreadExist(context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text("Account Already Exist"),
      );
    },
  );
}

void vehicleRegisteredMessage(context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text("Vehicle Registered"),
      );
    },
  );
}
