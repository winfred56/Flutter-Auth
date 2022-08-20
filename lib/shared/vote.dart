import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:flutter_auth/shared/loading.dart';
import 'package:flutter_auth/state/vote.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class VoteWidget extends StatelessWidget {
  const VoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoteCategory? activeVote = Provider.of<VoteState>(context).activeVote;
    List<String> candidates = <String>[];
    if (activeVote != null) {
      for (Map<String, int> candidate in activeVote.candidates) {
        candidate.forEach((title, value) {
          candidates.add(title);
        });
      }
    }
    else{
      const Loading();
      //print('Loading');
    }

    return Column(
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
        for(String candidate in candidates)
          Card(
            child: InkWell(
              onTap: (){
                Provider.of<VoteState>(context, listen: false).selectedCandidateInActiveVote = candidate;
              },
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 60),
                      width: 8,
                      color: Colors.greenAccent,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        alignment: Alignment.centerLeft,
                        color: Provider.of<VoteState>(context, listen: false).selectedCandidateInActiveVote == candidate
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
          ),
      ],
    );
  }
}
