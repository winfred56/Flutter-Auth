import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../services/auth_service.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: ()=> Navigator.pushReplacementNamed(context, '/home'),
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 35,
              ),),
          ),
          elevation: 0,
          backgroundColor: HexColor('#732424'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 35,
                ),),
            )
          ]
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
                "STUDENT PROFILE",
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
            top: 60,
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 1,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/fg.png"),
                    backgroundColor: Colors.green,
                    radius: 75,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 350,
              bottom: 40,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                        "Program",
                      style: TextStyle(
                        fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Level",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),

                ],
              ) ,
          ),
          Positioned(
            top: 350,
            bottom: 40,
            right: 0,
            left: 0,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(90, 10, 10, 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Waduacheampong@st.knust.edu.gh",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(240, 10, 10, 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Computer Science",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "200",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          )
        ]
      )
    );
  }
}
