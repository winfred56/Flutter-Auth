import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/voteList.dart';
import 'package:flutter_auth/state/vote.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthenticationService _auth = AuthenticationService();
  int _currentStep = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {

      Provider.of<VoteState>(context, listen: false).clearState();
      Provider.of<VoteState>(context, listen: false).loadVoteList();
    });
  }
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
              currentStep: _currentStep,
              type: StepperType.horizontal,

              steps: [
                const Step(
                    title: Text('Choose'),
                    content: VoteList(),
                    isActive: true
                ),
                Step(
                    title: const Text('Vote'),
                    content: Text('Something'),
                    isActive: _currentStep >= 1 ? true : false
                ),
              ],
              onStepContinue: (){
                if (_currentStep == 0){
                  if(step2Required()){
                    setState(() {
                      _currentStep = (_currentStep + 1) > 1 ? 1 : _currentStep+1;
                    });
                  }
                  else{
                    showSnackBar(context, "Select Category");
                  }
                }
              },
              onStepCancel: (){
                print(_currentStep);
                if (_currentStep <=1 ){
                  setState(() {
                    Provider.of<VoteState>(context, listen: false).activeVote = null;
                  });
                }
                // else if (_currentStep <= 1){
                //
                // }
                setState(() {
                  _currentStep = (_currentStep - 1) < 0 ? 0: _currentStep-1;
                });
              },
            ),
          )
        ],
      ),
    );
  }
  void showSnackBar(BuildContext context, msg){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please Select Vote Category",
          style: TextStyle(fontSize: 22),
        ),
      )
    );
  }

  bool step2Required(){
    if(Provider.of<VoteState>(context, listen: false).activeVote==null){
      return false;
    }
    return true;
  }
}
