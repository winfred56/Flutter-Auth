import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(99, 12, 12, 10),
        title: const Text('Welcome To the Home Screen'),
          actions: [
            TextButton.icon(onPressed: () async {
              await _auth.signOut();
            },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: const Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              onStepCancel: (){},
              onStepContinue: (){},
              steps: const[
                Step(
                    title: Text('Choose'),
                    content: Text('Something'),
                    isActive: true
                ),
                Step(
                    title: Text('Vote'),
                    content: Text('Something'),
                    isActive: false
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
