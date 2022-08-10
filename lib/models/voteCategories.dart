
// VoteCategory Model
class VoteCategory{
  late String voteCategoryId;
  late String voteTitle;
  late List<Map<String, int>> candidates;

  VoteCategory({required this.voteCategoryId, required this.voteTitle, required this.candidates});
}

// class Voter{
//   late String uid;
//   late String voterId;
//   late int markedCaandidate;
//   late bool voted;
// }