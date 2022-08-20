
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
        {"Adu-Acheampong Winfred": 1222},
        {"Adu Amankwah Kelvin": 282},
        {"John Doe": 1016},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "Repulic Hall Presidential Elections",
      candidates: [
        {"Abraham Kwarteng Rockson": 122},
        {"Phil Foden": 492},
        {"Raheem Sterling": 726},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "College Of Science General Secretary Elections",
      candidates: [
        {"Christiano Ronaldo": 122},
        {"Asamoah Gyan": 272},
        {"Marcus Rashford": 396},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "Independence Hall Presidential Elections",
      candidates: [
        {"Luka Modric": 122},
        {"Karim Benzema": 541},
        {"Reece James": 266},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "Unity Hall Presidential Elections",
      candidates: [
        {"Antony Elanga": 122},
        {"De Gea": 492},
        {"Harry Maguire": 326},
        {"Antonio Rudiger ": 226},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "Queens Hall Presidential Elections",
      candidates: [
        {"Kelvin DeBrynne": 122},
        {"William Shakespeare": 491},
        {"William Faulkner": 826},
        {"Ama Atta Aaido ": 226},
        {"Kwadwo Nkansah ": 517},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "Katanga Hall Presidential Elections",
      candidates: [
        {"Roberto Carlos": 121},
        {"Alex Ferguson": 429},
        {"Jose Mourinho": 862},
        {"David Beckham ": 261},
        {"John Terry": 571},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "SCISA Presidential Elections",
      candidates: [
        {"Adu": 211},
        {"Kwame": 249},
        {"Winfred": 682},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "SCISA General Secretary",
      candidates: [
        {"Ama": 211},
        {"kofi": 249},
        {"Yaw": 382},
      ]));
  voteList.add(VoteCategory(
      voteCategoryId: const Uuid().v4(),
      voteTitle: "KSB Women Commissioner Elections",
      candidates: [
        {"Freda": 29},
        {"Stephanie": 62},
        {"Winnifred": 41},
        {"Adele": 69},
        {"Magdalene": 235},

      ]));
  return voteList;
}