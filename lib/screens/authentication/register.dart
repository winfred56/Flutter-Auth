import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/home/home.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/loading.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

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
        title: Text('Log In'),
        elevation: 0.0,

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
                validator: (val)=> val!.isEmpty ? 'Enter a valid password' : null,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              ElevatedButton(onPressed: ()async{
                if (_formkey.currentState!.validate()){
                  loading = true;
                  dynamic results = await _auth.registerWithEmailAndPassword(email, password);
                  print(results);
                  if(results == null){
                    loading = false;
                    error = 'Enter valid Credentials';
                  }
                }
              },
                  child: Text('Enter')
              )
            ]
        ),
      ),
    );
  }
}
