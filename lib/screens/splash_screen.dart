import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(
                left: 80, bottom: 40, right: 80, top: 160),
            child: Image.asset("lib/images/image0.png"),
          ),
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(fontSize: 36,fontWeight: FontWeight.bold),

            ),
          ),
          const Text("Get Item Everyday",style: TextStyle(color: Colors.grey),),
          const Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return HomePage();
              }));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(24),
                child: const Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
