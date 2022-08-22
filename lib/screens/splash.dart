import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/wrapper.dart';
import 'package:hexcolor/hexcolor.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Timer(
    //   const Duration(seconds: 3),
    //     (){
    //       Navigator.pushReplacementNamed(context, '/wrapper');
    //     }
    // );
    // return Container(
    //   color: HexColor('#732424'),
    //   child: const Center(
    //     child: Icon(
    //       Icons.how_to_vote_outlined,
    //       color: Colors.white,
    //       size: 256,
    //     ),
    //   ),
    // );
    return EasySplashScreen(
      logo: Image.asset(
        'assets/splash.png',
        scale: 0.9,
      ),
      title:  Text(
        "ELECT",
        style: TextStyle(
          fontSize: 67,
          fontWeight: FontWeight.bold,
          color: HexColor('#732424'),
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text(
        "Loading...",
        style: TextStyle(
          color: HexColor('#732424')
        ),
      ),
      navigator: const Wrapper(),
      durationInSeconds: 5,
    );
  }
}
