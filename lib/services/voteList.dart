import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../state/vote.dart';

/// Create a List of Categories and its candidates
List<VoteCategory> getVoteList() {
  // create an instance of the VoteCategory class*(Model) to manually add votes
  List<VoteCategory> voteList = <VoteCategory>[];

  // Manually adding vote categories
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC Presidential Elections",
    candidates: [
      {"Winfred": 157},
      {"Adu Kelvin": 57},
      {"John": 34},
    ],
  ));
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC Financial Secretary",
    candidates: [
      {"Ronaldo": 87},
      {"Asamoah Gyan": 2},
      {"Marcus Rashford": 98},
    ],
  ));
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC Women Commissioner",
    candidates: [
      {"Luka Modric": 31},
      {"Karim Benzema": 94},
      {"Reece James": 39},
    ],
  ));
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC P.R.O.",
    candidates: [
      {"Adu": 23},
      {"Kwame": 1},
      {"Winfred": 51},
    ],
  ));
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC Technical Adviser",
    candidates: [
      {"Ama": 10},
      {"kofi": 5},
      {"Yaw": 46},
    ],
  ));
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC General Secretary",
    candidates: [
      {"Freda": 23},
      {"Stephanie": 87},
      {"Winnifred": 45},
      {"Adele": 31},
      {"Magdalene": 54},
    ],
  ));
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC Speaker Of Parliament",
    candidates: [
      {"Freda": 3},
      {"Mike": 27},
      {"Bright": 5},
      {"Frank": 13},
      {"John": 54},
    ],
  ));
  voteList.add(VoteCategory(
    voteCategoryId: const Uuid().v4(),
    voteTitle: "SRC Organizer ",
    candidates: [
      {"Peter": 32},
      {"Gabriel": 78},
      {"Abraham": 54},
      {"Isaac": 13},
      {"Magdalene": 76},
    ],
  ));
  return voteList;
}

///firestore collection name
/// Not Working @ the moment

const String kVotes = 'votes';
const String kTitle = 'title';

/// get voteList from cloudFirestore
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

/// count user votes
void markVote(String voteId, String option) async {
  // increment value
  FirebaseFirestore.instance.collection(kVotes).doc(voteId).update({
    option: FieldValue.increment(1),
  });
}

/// retrieveMarkedVoteFromCloudFirestore
void retrieveMarkedVoteFromFirestore({String? voteId, BuildContext? context}) {
  // Retrieve updated doc from server
  FirebaseFirestore.instance
      .collection(kVotes)
      .doc(voteId)
      .get()
      .then((document) {
    Provider.of<VoteState>(context!, listen: false).activeVote =
        mapFirestoreDocToVote(document);
  });
}
