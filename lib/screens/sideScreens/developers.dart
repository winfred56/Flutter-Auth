import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../drawer/drawer.dart';

class Developer extends StatelessWidget {
  const Developer({Key? key}) : super(key: key);

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
          child: Text(
            'ELECT',
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 600,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: 50,
              color: HexColor('#732424'),
              child: const Text(
                "DEVELOPERS 💻",
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
            top: 200,
            bottom: 0,
            right: 1,
            left: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Profile Image
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 2,
                          shadowColor: Colors.white38,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage('assets/fg.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      /// Profile Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Winfred Adu-Acheampong') ,
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text('Index Number: 5310020'),
                            ) ,
                            Text('Github: @winfred56') ,
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Profile Image
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 2,
                          shadowColor: Colors.white38,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage('assets/fg.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      /// Profile Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Winfred Adu-Acheampong') ,
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text('Index Number: 5310020'),
                            ) ,
                            Text('Github: @winfred56') ,
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Profile Image
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 2,
                          shadowColor: Colors.white38,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage('assets/fg.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      /// Profile Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Winfred Adu-Acheampong') ,
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text('Index Number: 5310020'),
                            ) ,
                            Text('Github: @winfred56') ,
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Profile Image
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 2,
                          shadowColor: Colors.white38,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage('assets/fg.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      /// Profile Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Winfred Adu-Acheampong') ,
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text('Index Number: 5310020'),
                            ) ,
                            Text('Github: @winfred56') ,
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Profile Image
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 2,
                          shadowColor: Colors.white38,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage('assets/fg.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      /// Profile Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Winfred Adu-Acheampong') ,
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text('Index Number: 5310020'),
                            ) ,
                            Text('Github: @winfred56') ,
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Profile Image
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 2,
                          shadowColor: Colors.white38,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage('assets/fg.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      /// Profile Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Winfred Adu-Acheampong') ,
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text('Index Number: 5310020'),
                            ) ,
                            Text('Github: @winfred56') ,
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
