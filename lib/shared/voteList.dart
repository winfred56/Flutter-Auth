
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth/state/vote.dart';

class VoteList extends StatelessWidget {
  const VoteList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Consumer<VoteState>(
      builder: (context, voteState, child){
        String activeVoteCategoryId =Provider.of<VoteState>(context, listen: false).activeVote?.voteCategoryId ?? "" ;
        return Column(
          children: [
            for (VoteCategory vote in voteState.voteList! )
              Card(
                elevation: 0,
                color: activeVoteCategoryId == vote.voteCategoryId ? HexColor('#45334') : Colors.green[50],
                child: ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      vote.voteTitle!,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                  selectedTileColor: Colors.transparent,
                  onTap: (){
                    voteState.activeVote = vote;
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
