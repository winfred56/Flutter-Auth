import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../state/vote.dart';


/// Get List of Categories and its candidates
List<VoteCategory> getVoteList(){
  // create an instance of the VoteCategory class*(Model) to manually add votes
  List<VoteCategory> voteList = <VoteCategory>[];

  // Manually adding vote categories
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "SRC Presidential Elections",
      candidates: [
        {"Winfred": 0},
        {"Adu Kelvin": 0},
        {"John": 0},
      ],
  ));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "College Of Science General Secretary Elections",
      candidates: [
        {"Ronaldo": 0},
        {"Asamoah Gyan": 0},
        {"Marcus Rashford": 0},
      ],
  ));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "Independence Hall Presidential Elections",
      candidates: [
        {"Luka Modric": 0},
        {"Karim Benzema": 0},
        {"Reece James": 0},
      ],
  ));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "SCISA Presidential Elections",
      candidates: [
        {"Adu": 0},
        {"Kwame": 0},
        {"Winfred": 0},
      ],
  ));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "SCISA General Secretary",
      candidates: [
        {"Ama": 10},
        {"kofi": 5},
        {"Yaw": 46},
      ],
  ));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "KSB Women Commissioner Elections",
      candidates: [
        {"Freda": 0},
        {"Stephanie": 0},
        {"Winnifred": 0},
        {"Adele": 0},
        {"Magdalene": 0},
      ],
  ));
  return voteList;
}


//firestore collection name
const String kVotes = 'votes';
const String kTitle = 'title';

void getVoteListFromFirestore(BuildContext context) async {

  FirebaseFirestore.instance.collection(kVotes).get().then((snapshot) {
    List<VoteCategory> voteList = <VoteCategory>[];

    for (var document in snapshot.docs) {
      print(snapshot.docs.first.exists);
      voteList.add(mapFirestoreDocToVote(document));
    }
    Provider.of<VoteState>(context, listen: false).voteList = voteList;

  });

}
VoteCategory mapFirestoreDocToVote(document) {
  VoteCategory vote = VoteCategory(voteCategoryId: document.id);
  print(vote.voteTitle);
  List<Map<String, int>> candidates = [];
  document.data.forEach((key, value) {
    print(vote.voteCategoryId);
    if (key == kTitle) {
      vote.voteTitle = value;
      print(vote.toString());
    } else {
      candidates.add({key: value});
    }
  });
  vote.candidates = candidates;
  return vote;
}

void markVote(String voteId, String option) async {
  // increment value
  FirebaseFirestore.instance.collection(kVotes).doc(voteId).update({
    option: FieldValue.increment(1),
  });
}

void retrieveMarkedVoteFromFirestore({String? voteId, BuildContext? context}) {
  // Retrieve updated doc from server
  FirebaseFirestore.instance.collection(kVotes).doc(voteId).get().then((document) {
    Provider.of<VoteState>(context!, listen: false).activeVote =
        mapFirestoreDocToVote(document);
  });
}