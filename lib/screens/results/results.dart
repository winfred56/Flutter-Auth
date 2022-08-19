import 'package:flutter/material.dart';


class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Feed"),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon:const Icon(Icons.home_outlined),
        ),
      ),
    );
  }
}
