import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/profile/user_profile.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../services/auth_service.dart';

class SideMenuDrawer extends StatefulWidget {
  const SideMenuDrawer({Key? key}) : super(key: key);

  @override
  State<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                    colors: [
                      HexColor('#732424'),
                      HexColor('#E6B0AA'),
                      HexColor('#ffffff'),
                    ]
                ),
                image: const DecorationImage(
                    image: AssetImage(
                        "assets/fg.png",
                    )),
                color: HexColor('#732424'),
              ),
              child: const Text("Menu")),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded,
            color: Colors.black,),
            title:const Text(
                'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),
            ),
            onTap: ()=> Navigator.pushReplacementNamed(context,'/userProfile'),
          ),
          const SizedBox(height: 10,),
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
              color: Colors.black,
            ),
            title:const Text('About',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),),
            onTap: () => Navigator.pushReplacementNamed(context,'/about'),
          ),
          const SizedBox(height: 10,),
          ListTile(
            leading: const Icon(Icons.developer_mode_rounded,
              color: Colors.black,
            ),
            title:const Text('Developers',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),),
            onTap: () => Navigator.pushReplacementNamed(context,'/developers'),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 380),
            child: ListTile(
              leading: const Icon(Icons.login_rounded,
                color: Colors.black,
              ),
              title:const Text('Logout',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),),
              onTap: () => _auth.signOut(),
            ),
          ),
        ],
      ),
    );
  }
}

