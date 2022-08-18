import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
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

    return Column(
      children: [
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Text(
              activeVote!.voteTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

        ),
        for(String candidate in candidates)
          Card(
            child: Row(
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 60),
                  width: 8,
                  color: HexColor('#732424'),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    alignment: Alignment.centerLeft,
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
      ],
    );
  }
}
