
// VoteCategory Model
class VoteCategory{

  VoteCategory({this.voteCategoryId, this.voteTitle, this.candidates});

  String? voteCategoryId;
  String? voteTitle;
  List<Map<String, int>>? candidates;



}

// class Voter{
//   late String uid;
//   late String voterId;
//   late int markedCandidate;
//   late bool voted;
// }


class VoteData{
  late final String candidate;
  late final int total;

  VoteData(this.candidate, this.total);

}