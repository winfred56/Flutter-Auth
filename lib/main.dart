import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/screens/wrapper.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final Color _primaryColor = HexColor('#630c0c');
  final Color _secondary = HexColor('#c19e9e');

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
        value: AuthenticationService().getUser(),
    initialData: null,
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
    )
    );
  }
}

