
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
        {"Adu-Acheampong Winfred": 1222},
        {"Adu Amankwah Kelvin": 282},
        {"John Doe": 1016},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: Uuid().v4(),
      voteTitle: "Repulic Hall Presidential Elections",
      candidates: [
        {"Abraham Kwarteng Rockson": 122},
        {"Phil Foden": 492},
        {"Raheem Sterling": 726},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: Uuid().v4(),
      voteTitle: "College Of Science General Secretary Elections",
      candidates: [
        {"Christiano Ronaldo": 122},
        {"Asamoah Gyan": 272},
        {"Marcus Rashford": 396},
      ]));
  return voteList;
}