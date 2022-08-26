import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/voteList.dart';
import 'package:flutter_auth/state/vote.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../services/voteList.dart';
import '../drawer/drawer.dart';

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
      drawer: const SideMenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: HexColor('#732424'),
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Text('ELECT',),
        ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          "assets/src.png",
                          height: 90,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                          child: const Text(
                              "Choose Your Leaders",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
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

  void markMyVote() {
    final voteId = Provider.of<VoteState>(context, listen: false).activeVote?.voteCategoryId;
    final option = Provider.of<VoteState>(context, listen: false).selectedCandidateInActiveVote;

    markVote(voteId!, option!);
  }
}


