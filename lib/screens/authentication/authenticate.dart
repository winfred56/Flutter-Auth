import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/authentication/register.dart';

import 'Sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView:toggleView);
    }else{
      return Register(toggleView:toggleView);
    }
  }
}
