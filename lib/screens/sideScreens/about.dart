import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../drawer/drawer.dart';


class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: HexColor('#732424'),
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Text('ELECT',),
        ),
      ),
    );
  }
}

    
    