import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
        (){
          Navigator.pushReplacementNamed(context, '/wrapper');
        }
    );
    return Container(
      color: HexColor('#732424'),
      child: const Center(
        child: Icon(
          Icons.how_to_vote_outlined,
          color: Colors.white,
          size: 256,
        ),
      ),
    );
  }
}
