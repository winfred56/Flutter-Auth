import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/voteList.dart';
import 'package:flutter_auth/state/vote.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../services/voteList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthenticationService _auth = AuthenticationService();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<VoteState>(context, listen: false).clearState();
      Provider.of<VoteState>(context, listen: false).loadVoteList(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#732424'),
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Text('ELECT',),
        ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/userProfile');
                  } ,
                icon: const Icon(Icons.menu_rounded,
              color: Colors.white,
                size: 35,
              ),),
            )
            // TextButton.icon(
            //   onPressed: () async {
            //   await _auth.signOut();
            // },
            //   icon: const Icon(
            //     Icons.logout,
            //     color: Colors.white,
            //   ),
            //   label: const Text(
            //     "Sign Out",
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ]
      ),
      body:Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 580,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: 100,
              color: HexColor('#732424'),
              child: const Text(
                  "SRC ELECTIONS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(

                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                  shadowColor: Colors.white38,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/fg.png",
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                          child: const Text(
                              "Let Us Choose Our Leaders",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                      ),

                    ]
                  )
                ),
              ),
            ),
          ),
          Positioned(
              top: 260,
              bottom: 0,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    if(Provider.of<VoteState>(context,listen: true).voteList != null)
                      // if(Provider.of<VoteState>(context,listen: true).voteList != null)
                         InkWell(
                             onTap: () {
                           print("object");
                           showSnackBar(context, "Double Tap to Select ❣ ");
                           },
                            onDoubleTap: ()=> Navigator.pushReplacementNamed(context, '/candidates'),
                            // onLongPress: ()=> Navigator.pushReplacementNamed(context, '/candidates'),
                            child: const VoteList())
                  ],
                ),
              )
          )
        ],
      ),
      // body:Column(
      //   children: [
      //
      //     if(Provider.of<VoteState>(context,listen: true).voteList != null)
      //       Expanded(
      //         child: Theme(
      //           data: ThemeData(
      //             shadowColor: Colors.white,
      //             primaryColor: Colors.white,
      //             colorScheme: ColorScheme.light(primary: HexColor('#732424')),
      //           ),
      //           child: Stepper(
      //             currentStep: _currentStep,
      //             type: StepperType.horizontal,
      //             steps: [
      //               const Step(
      //                   title: Text('Choose'),
      //                   content: VoteList(),
      //                   isActive: true
      //               ),
      //               Step(
      //                   title: const Text('Vote'),
      //                   content: const VoteWidget(),
      //                   isActive: _currentStep >= 1 ? true : false
      //               ),
      //             ],
      //             onStepContinue: (){
      //               if (_currentStep == 0){
      //                 if(step2Required()){
      //                   setState(() {
      //                     _currentStep = (_currentStep + 1) > 1 ? 1 : _currentStep+1;
      //                   });
      //                 }
      //
      //                 else{
      //                   showSnackBar(context, "Select Category");
      //                 }
      //               }
      //               else if (_currentStep >= 0){
      //                 if(step3Required()){
      //                   //Submit vote
      //                   markMyVote();
      //                   //VoteCategory.voted = true;
      //                   //See results graph
      //                   Navigator.pushReplacementNamed(context, '/results');
      //                 }else{
      //                   showSnackBar(context, "Please cast your vote!");
      //                 }
      //               }
      //             },
      //             onStepCancel: (){
      //               print(_currentStep);
      //               if (_currentStep <=1 ){
      //                 setState(() {
      //                   Provider.of<VoteState>(context, listen: false).activeVote = null;
      //                   Provider.of<VoteState>(context, listen: false).selectedCandidateInActiveVote = null;
      //                 });
      //               }
      //               setState(() {
      //                 _currentStep = (_currentStep - 1) < 0 ? 0: _currentStep-1;
      //               });
      //             },
      //           ),
      //         ),
      //       )
      //   ],
      // ),
      );
    }
    void showSnackBar(BuildContext context, String msg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          msg,
          style: const TextStyle(fontSize: 22),
        ),
      ));
    }

    // bool step2Required(){
    //   if(Provider.of<VoteState>(context, listen: false).activeVote == null){
    //     return false;
    //   }
    //   return true;
    // }
    // bool step3Required(){
    //   if(Provider.of<VoteState>(context, listen: false).selectedCandidateInActiveVote == null){
    //     return false;
    //   }
    //   return true;
    // }
  void markMyVote() {
    final voteId = Provider.of<VoteState>(context, listen: false).activeVote?.voteCategoryId;
    final option = Provider.of<VoteState>(context, listen: false).selectedCandidateInActiveVote;

    markVote(voteId!, option!);
  }
}


