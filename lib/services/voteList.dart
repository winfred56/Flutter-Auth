
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:uuid/uuid.dart';


// Get List of Categories and its candidates
List<VoteCategory> getVoteList(){
  // create an instance of the VoteCategory class*(Model) to manually add votes
  List<VoteCategory> voteList = <VoteCategory>[];

  // Manually adding vote categories
  voteList.add(VoteCategory(
      voteCategoryId: Uuid().v4(),
      voteTitle: "SRC Presidential Elections",
      candidates: [
        {"Adu-Acheampong Winfred": 12022},
        {"Adu Amankwah Kelvin": 22},
        {"John Doe": 36},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: Uuid().v4(),
      voteTitle: "Repulic Hall Presidential Elections",
      candidates: [
        {"Abraham Kwarteng Rockson": 122},
        {"Phil Foden": 92},
        {"Raheem Sterling": 26},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: Uuid().v4(),
      voteTitle: "College Of Science General Secretary Elections",
      candidates: [
        {"Christiano Ronaldo": 12022},
        {"Asamoah Gyan": 22},
        {"Marcus Rashford": 36},
      ]));
  return voteList;
}