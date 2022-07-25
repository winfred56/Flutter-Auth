import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/loading.dart';
import 'package:flutter_auth/services/auth_service.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          backgroundColor: Color.fromRGBO(99, 12, 12, 100),
        elevation: 0.0,
          actions: [
            TextButton.icon(onPressed: (){
              widget.toggleView();
            },
              icon: const Icon(
                Icons.login,
                color: Colors.white,
              ),
              label: const Text(
                "Register",
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
              ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(99, 12, 12, 80)),
                  ),
                  onPressed: ()async{
                if (_formkey.currentState!.validate()){

                  setState(() {
                    loading = true;
                  });

                  dynamic results = await _auth.signInWithEmailAndPassword(email, password);

                  print(results);

                  if(results == null){
                    setState((){
                      loading = false;
                      error = 'Enter valid Credentials';
                    });

                  }
                }
              },
                  child: Text('Sign In')
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
