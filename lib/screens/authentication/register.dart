import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/loading.dart';

import '../../shared/formDecoration.dart';
import '../../shared/header_widget.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  final double _headerHeight = 250;

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;


  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.person_add_alt_1_outlined), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                      const Text(
                        'Join Today!',
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Register with Us',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                        child: Column(
                          children: [
                            const SizedBox(height: 20.0,),
                            TextFormField(
                              decoration: LoginFormStyle.formDecoration.copyWith(hintText: " Enter Your Student Email"),
                              validator: (val) => val!.endsWith('@st.knust.edu.gh') ? null : "Enter a valid Email address",
                              onChanged: (val){
                                setState(() {
                                  email = val;
                                });
                              },
                            ),
                            const SizedBox(height: 20,),
                            TextFormField(
                              decoration: LoginFormStyle.formDecoration.copyWith(hintText: "Password"),
                              obscureText: true,
                              validator: (val)=> val!.length < 4 ? 'Enter a valid password' : null,
                              onChanged: (val){
                                setState(() {
                                  password = val;

                                });
                              },
                            ),
                            ElevatedButton(
                              style:ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(99, 12, 12, 80)),
                              ),
                              onPressed: ()async{
                                _formkey.currentState?.validate() ?? setState((){
                                  loading = true;
                                });
                                dynamic results = await _auth.registerWithEmailAndPassword(email, password);
                                if(results == null){
                                  setState((){
                                    loading = false;
                                    error = 'Enter valid Credentials';
                                  });

                                }
                              },
                              child: const Text('Register'),
                            ),
                            Text(error,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0
                              ),
                            ),
                            const SizedBox(height: 90,),
                            TextButton(onPressed: (){},
                                child: TextButton.icon(onPressed: () => widget.toggleView(), icon: const Icon(
                                  Icons.login,
                                  color: Colors.black,
                                ),
                                    label: const Text("Already Have an Account? Login"))

                            )],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
