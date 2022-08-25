
// VoteCategory Model
class VoteCategory{
  String voteCategoryId;
  String voteTitle;
  List<Map<String, int>> candidates;

  VoteCategory({required this.voteCategoryId,   required this.voteTitle,  required this.candidates} );
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