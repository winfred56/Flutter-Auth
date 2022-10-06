import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:flutter_auth/shared/loading.dart';
import 'package:flutter_auth/state/vote.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class VoteWidget extends StatelessWidget {
  const VoteWidget({Key? key}) : super(key: key);
  VoteCategory? get vote => null;

  @override
  Widget build(BuildContext context) {
    VoteCategory? activeVote = Provider.of<VoteState>(context).activeVote;
    List<String> candidates = <String>[];
    if (activeVote != null) {
      for (Map<String, int> candidate in activeVote.candidates!) {
        candidate.forEach((title, value) {
          candidates.add(title);
        });
      }
    } else {
      const Loading();
      //print('Loading');
    }
    return Scaffold(
      /// Display app name ('ELECT')
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: HexColor('#732424'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/userProfile');
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            )
          ]),
      /// Stack to position widgets
      body: Stack(
        children: [
          /// Display (SRC ELECTIONS)
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

          /// Display SRC image
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
                        padding: const EdgeInsets.all(40),
                        child: const Text(
                          "Cast Your Vote",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ])),
              ),
            ),
          ),

          /// Display Candidates
          Positioned(
              top: 260,
              bottom: 0,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          activeVote?.voteTitle ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: HexColor('#732424'),
                          ),
                        ),
                      ),
                    ),

                    /// Loop through candidates and display their names
                    for (String candidate in candidates)
                      Card(
                        child: InkWell(
                          onTap: () {
                            Provider.of<VoteState>(context, listen: false)
                                .selectedCandidateInActiveVote = candidate;
                            print(candidate);
                            print(vote?.voteTitle);
                            //See results graph
                            Navigator.pushReplacementNamed(context, '/results');
                          },
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints:
                                      const BoxConstraints(minHeight: 60),
                                  width: 8,
                                  color: Colors.greenAccent,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 5),
                                    alignment: Alignment.centerLeft,
                                    color: Provider.of<VoteState>(context,
                                                    listen: false)
                                                .selectedCandidateInActiveVote ==
                                            candidate
                                        ? Colors.greenAccent
                                        : Colors.white,
                                    child: Text(
                                      candidate,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
