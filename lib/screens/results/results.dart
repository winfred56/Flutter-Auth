import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth/state/vote.dart';
import '../../models/voteCategories.dart';



class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#732424'),
        title: const Text("Live Feed"),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon:const Icon(Icons.home_outlined),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(3),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 20,
            child: resultsWidget(context)),
      ),
    );
  }

  Widget resultsWidget(BuildContext context){
    return charts.BarChart(
      retrieveVoteResults(context),
      animate: true,
    );
  }
  List<charts.Series<VoteData, String>> retrieveVoteResults(BuildContext context){
    VoteCategory? activeVote = Provider.of<VoteState>(context).activeVote;

    List<VoteData> data = <VoteData>[];

    for (var candidate in activeVote!.candidates){
      candidate.forEach((key, value) {
        data.add(VoteData(key, value));
      });
    }
    return [
      charts.Series<VoteData, String>(
          id: "Results",
          colorFn: (_, pos){
            if(pos! % 2 == 0) {
              return charts.MaterialPalette.green.shadeDefault;
            }
            else {
              return charts.MaterialPalette.blue.shadeDefault;
            }
          },
          domainFn: (VoteData vote, _) => vote.candidate,
          measureFn: (VoteData vote, _) => vote.total,
          data: data
      )
    ];

  }


}


