import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SideMenuDrawer extends StatefulWidget {
  const SideMenuDrawer({Key? key}) : super(key: key);

  @override
  State<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                //image: Image.asset("assets/fg.png"),
                color: HexColor('#732424'),
              ),
              child: const Text("Menu")),
          const ListTile(
            leading: Icon(Icons.account_circle_rounded,
            color: Colors.black,),
            title:Text(
                'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
              color: Colors.black,
            ),
            title:Text('About',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),),
          ),
          const SizedBox(height: 10,),
          const ListTile(
            leading: Icon(Icons.developer_mode_rounded,
              color: Colors.black,
            ),
            title:Text('Developers',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(top: 380),
            child: ListTile(
              leading: Icon(Icons.login_rounded,
                color: Colors.black,
              ),
              title:Text('Logout',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),),
            ),
          ),
        ],
      ),
    );
  }
}

