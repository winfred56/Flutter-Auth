import 'dart:async';

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
      const Duration(seconds: 5),
        (){
          Navigator.pushReplacementNamed(context, '/wrapper');
        }
    );
    return Container(
      color: HexColor('#732424'),
      child: const Icon(Icons.how_to_vote_outlined,
      )
    );
  }
}
