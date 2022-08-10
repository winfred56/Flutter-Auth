import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/screens/wrapper.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth/state/vote.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      StreamProvider<User?>.value(
        value: AuthenticationService().getUser(),
        initialData: null,
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),

      ChangeNotifierProvider(
          create: (_) => VoteState()
      )
    ],
      child: const MaterialApp(debugShowCheckedModeBanner: true,home: Wrapper(),)
    );
    // return StreamProvider<User?>.value(
    //     value: AuthenticationService().getUser(),
    // initialData: null,
    //     child: const MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: Wrapper(),
    // )
    // );
  }
}

