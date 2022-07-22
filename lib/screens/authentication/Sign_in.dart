import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_service.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticationService _auth = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        elevation: 0.0,

      ),
      body: ElevatedButton(
        onPressed: ()=> _auth.signInAnonymous(),
        child: const Text('Log In'),
      ),
    );
  }
}
