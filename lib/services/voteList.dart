import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../state/vote.dart';

// Get List of Categories and its candidates
// List<VoteCategory> getVoteList(){
//   // create an instance of the VoteCategory class*(Model) to manually add votes
//   List<VoteCategory> voteList = <VoteCategory>[];
//
//   // Manually adding vote categories
//   voteList.add(VoteCategory(
//       voteCategoryId: const Uuid().v4(),
//       voteTitle: "SRC Presidential Elections",
//       candidates: [
//         {"Winfred": 0},
//         {"Adu Kelvin": 0},
//         {"John": 0},
//       ]));
//   voteList.add(VoteCategory(
//       voteCategoryId: const Uuid().v4(),
//       voteTitle: "College Of Science General Secretary Elections",
//       candidates: [
//         {"Ronaldo": 0},
//         {"Asamoah Gyan": 0},
//         {"Marcus Rashford": 0},
//       ]));
//   voteList.add(VoteCategory(
//       voteCategoryId: const Uuid().v4(),
//       voteTitle: "Independence Hall Presidential Elections",
//       candidates: [
//         {"Luka Modric": 0},
//         {"Karim Benzema": 0},
//         {"Reece James": 0},
//       ]));
//   voteList.add(VoteCategory(
//       voteCategoryId: const Uuid().v4(),
//       voteTitle: "SCISA Presidential Elections",
//       candidates: [
//         {"Adu": 0},
//         {"Kwame": 0},
//         {"Winfred": 0},
//       ]));
//   voteList.add(VoteCategory(
//       voteCategoryId: const Uuid().v4(),
//       voteTitle: "SCISA General Secretary",
//       candidates: [
//         {"Ama": 0},
//         {"kofi": 0},
//         {"Yaw": 0},
//       ]));
//   voteList.add(VoteCategory(
//       voteCategoryId: const Uuid().v4(),
//       voteTitle: "KSB Women Commissioner Elections",
//       candidates: [
//         {"Freda": 0},
//         {"Stephanie": 0},
//         {"Winnifred": 0},
//         {"Adele": 0},
//         {"Magdalene": 0},
//
//       ]));
//   return voteList;
// }

// firestore collection name
const String kVotes = 'votes';
const String kTitle = 'title';

Future<List<VoteCategory>> getVoteListFromFirestore(
    BuildContext context) async {
  return FirebaseFirestore.instance.collection('votes').get().then((value) {
    /// Loop over documents in collection
    return value.docs
        .map(
          (e){
            print(VoteCategory.fromJson(e.data()));
            return VoteCategory.fromJson(e.data());
          },
        ).toList();
  });
}


QueryDocumentSnapshot<Map<String, dynamic>> mapFirestoreDocToVote(
    QueryDocumentSnapshot<Map<String, dynamic>> document) {
  /// Doc Data
  return document;
}

// void markVote(String voteId, String option) async {
//   // increment value
//   FirebaseFirestore.instance.collection(kVotes).doc(voteId).update({
//     option: FieldValue.increment(1),
//   });
// }
//
// void retrieveMarkedVoteFromFirestore({String? voteId, BuildContext? context}) {
//   // Retrieve updated doc from server
//   FirebaseFirestore.instance.collection(kVotes).doc(voteId).get().then((document) {
//     Provider.of<VoteState>(context!, listen: false).activeVote =
//         mapFirestoreDocToVote(document);
//   });
// }
