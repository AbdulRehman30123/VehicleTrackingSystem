import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking/UI/login.dart';
import 'package:tracking/contstants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashscaffoldcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 210,
              ),

              //animation
              Lottie.asset("assets/splash.json"),
              const SizedBox(
                height: 100,
              ),
              Text(
                "Track Your Vehicles",
                style: GoogleFonts.roboto(textStyle: textStyle),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Fully Manageable",
                style: GoogleFonts.sourceSansPro(textStyle: textStyle),
              ),
              const SizedBox(
                height: 50,
              ),
              // next button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Container(
                  child: Text("Next"),

                  height: 50,
                  width: 100,
                  alignment: Alignment.center, //center karne k liye

                  // radius change with decoration
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    //for shadow
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff033e3e),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          2.0, // Move to right 5  horizontally
                          8.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
