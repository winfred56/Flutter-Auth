
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth/state/vote.dart';

class VoteList extends StatelessWidget {
  const VoteList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    String activeVoteCategoryId =Provider.of<VoteState>(context, listen: false).activeVote?.voteCategoryId ?? "" ;
    return Consumer<VoteState>(
      builder: (context, voteState, child){
        return Column(
          children: [
            for (VoteCategory vote in voteState.voteList )
              Card(
                color: activeVoteCategoryId == vote.voteCategoryId ? Colors.red[100] : Colors.green[100],
                child: ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      vote.voteTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black
                      ),
                    ),
                  ),
                  onTap: (){
                    Provider.of<VoteState>(context, listen: false).activeVote= vote;
                    //print(vote.voteTitle);
                  },
                  selected: activeVoteCategoryId == vote.voteCategoryId ? true : false ,
                ),
              )
          ],
        );
      },
    );

  }

}
