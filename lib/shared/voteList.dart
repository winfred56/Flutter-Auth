import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth/state/vote.dart';

class VoteList extends StatelessWidget {
  const VoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VoteState>(
      builder: (context, voteState, child){
        return Column(
          children: [
            for (VoteCategory vote in voteState.voteList )
              Card(
                child: ListTile(
                  title: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      vote.voteTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
