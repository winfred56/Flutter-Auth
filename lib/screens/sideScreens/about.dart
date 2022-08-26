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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 580,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: 100,
              color: HexColor('#732424'),
              child: const Text(
                "ABOUT ℹ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
          ),
          Positioned(
              top: 230,
              bottom: 0,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultrices sagittis ante.'
                      ' Curabitur tincidunt interdum nunc, vitae dignissim diam dignissim in. Fusce blandit posuere eros id iaculis. '
                      'Nunc at finibus erat, vel porttitor nisi. Proin eget sem eu libero convallis posuere. Integer sit amet cursus eros. '
                      'Duis sed tristique justo, sit amet elementum nulla. In facilisis sollicitudin odio, et posuere elit sodales sit.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18

                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

    
    