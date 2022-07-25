import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/home/home.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/loading.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;


  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      appBar: AppBar(
        title: const Text('Register With Us'),
        elevation: 0.0,
          actions: [
            TextButton.icon(onPressed: (){
             widget.toggleView();
            },
              icon: const Icon(
                Icons.person_add_alt,
                color: Colors.white,
              ),
              label: const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]

      ),
      body: Form(
        key: _formkey,
        child: Column(
            children: [
              const SizedBox(height: 20.0,),
              TextFormField(
                //decoration: formDecoration.copyWith(hintText: "Email"),
                validator: (val) => val!.endsWith('@st.knust.edu.gh') ? null : "Enter a valid Email address",
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              TextFormField(
                obscureText: true,
                validator: (val)=> val!.length < 4 ? 'Enter a valid password' : null,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              ElevatedButton(onPressed: ()async{
                if (_formkey.currentState!.validate()){
                  setState(() {
                    loading = true;
                  });
                  dynamic results = await _auth.registerWithEmailAndPassword(email, password);
                  print(results);
                  if(results == null){
                    setState((){
                      loading = false;
                      error = 'Enter valid Credentials';
                    });
                  }
                }
              },
                  child: const Text('Register')
              ),
          Text(error,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14.0
              ),
          )
          ]
        ),
      ),
    );
  }
}
