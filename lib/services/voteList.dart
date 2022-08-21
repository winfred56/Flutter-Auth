
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:uuid/uuid.dart';


// Get List of Categories and its candidates
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
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "College Of Science General Secretary Elections",
      candidates: [
        {"Ronaldo": 0},
        {"Asamoah Gyan": 0},
        {"Marcus Rashford": 0},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "Independence Hall Presidential Elections",
      candidates: [
        {"Luka Modric": 0},
        {"Karim Benzema": 0},
        {"Reece James": 0},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "SCISA Presidential Elections",
      candidates: [
        {"Adu": 0},
        {"Kwame": 0},
        {"Winfred": 0},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "SCISA General Secretary",
      candidates: [
        {"Ama": 0},
        {"kofi": 0},
        {"Yaw": 0},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "KSB Women Commissioner Elections",
      candidates: [
        {"Freda": 0},
        {"Stephanie": 0},
        {"Winnifred": 0},
        {"Adele": 0},
        {"Magdalene": 0},

      ]));
  return voteList;
}

