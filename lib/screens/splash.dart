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
    return EasySplashScreen(
      logo: Image.asset(
        'assets/fg.png',
      ),
      title:  const Text(
        "ELECT",
        style: TextStyle(
          fontSize: 67,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: HexColor('#732424'),
      showLoader: true,
      loadingText: const Text(
        "Loading...",
        style: TextStyle(
          color: Colors.white
        ),
      ),
      navigator: const Wrapper(),
      durationInSeconds: 3,
    );
  }
}
