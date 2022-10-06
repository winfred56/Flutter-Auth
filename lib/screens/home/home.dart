/// Import all necessary dependencies
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/voteList.dart';
import 'package:flutter_auth/state/vote.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../services/voteList.dart';
import '../drawer/drawer.dart';

/// stateful widget
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Instance of te AuthenticationService class {get access to the FirebaseAuth service}
  final AuthenticationService _auth = AuthenticationService();

  /// Loading and Clearing the VoteState
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
      /// Side Menu Drawer
      drawer: const SideMenuDrawer(),

      /// Display 'ELECT' as title on appBar
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: HexColor('#732424'),
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'ELECT',
          ),
        ),
      ),

      /// Stack to position widgets
      body: Stack(
        children: [
          /// Displaying SRC ELECTIONS
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

          /// Displaying middle SRC image ant text
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
                    child: Row(children: [
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
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ])),
              ),
            ),
          ),

          /// Listing of Vote Categories
          Positioned(
              top: 260,
              bottom: 0,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    /// check if there are vote categories to display
                    if (Provider.of<VoteState>(context, listen: true)
                            .voteList !=
                        null)

                      ///InkWell make te tile pressable
                      InkWell(
                          onTap: () {
                            print("object");
                            showSnackBar(context, "Double Tap to Select ❣ ");
                          },

                          /// List the Vote categories
                          child: const VoteList())
                  ],
                ),
              ))
        ],
      ),
    );
  }

  /// Display a snack bar on screen with a message
  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(fontSize: 22),
      ),
    ));
  }

  /// counts vote
  /// Not Functional for now
  void markMyVote() {
    final voteId = Provider.of<VoteState>(context, listen: false)
        .activeVote
        ?.voteCategoryId;
    final option = Provider.of<VoteState>(context, listen: false)
        .selectedCandidateInActiveVote;

    markVote(voteId!, option!);
  }
}
