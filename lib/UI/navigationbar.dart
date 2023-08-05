import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tracking/UI/addvehiclescreen.dart';
import 'package:tracking/UI/allvehiclescreen.dart';
import 'package:tracking/UI/dashboard.dart';

class navigation extends StatefulWidget {
  const navigation({Key? key}) : super(key: key);

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  int _selectedindex = 1;
  List screens = const [AddVehicleScreen(), DashBoard(), AllVehicleScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedindex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Color(0xffb3cee5),
          gap: 10,
          padding: EdgeInsets.all(16),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabs: const [
            GButton(
              icon: Icons.fire_truck,
              text: 'New Vehicle',
            ),
            GButton(
              icon: Icons.dashboard,
              text: 'Dashboard',
            ),
            GButton(
              icon: Icons.account_circle,
              text: 'All Vehicles',
            ),
          ],
          selectedIndex: _selectedindex,
          onTabChange: (index) {
            setState(() {
              _selectedindex = index;
            });
          },
        ),
      ),
    );
  }
}
