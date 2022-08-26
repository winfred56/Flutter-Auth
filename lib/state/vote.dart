import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:flutter_auth/services/voteList.dart';


class VoteState with ChangeNotifier{
  // Create an instance of the VoteCategory class
  List<VoteCategory>? _voteList = <VoteCategory>[];
  VoteCategory? _activeVote;
  String? _selectedCandidateInActiveVote;
  VoteCategory? _voted;


  void loadVoteList(BuildContext context) async{
    _voteList = getVoteList();
    notifyListeners();
    // getVoteListFromFirestore(context);
  }

  void clearState(){
    _voteList = null;
    _activeVote = null;
    _selectedCandidateInActiveVote = null;
    _voted = null;
  }

  List<VoteCategory>? get voteList => _voteList;

  set voteList(newValue){
    _voteList = newValue;

    notifyListeners();
  }

  VoteCategory? get activeVote => _activeVote;
  String? get selectedCandidateInActiveVote => _selectedCandidateInActiveVote;
  VoteCategory? get voted => _voted;

  set activeVote(newValue) {
    _activeVote = newValue;
    notifyListeners();
  }

  set selectedCandidateInActiveVote(String? newValue){
    _selectedCandidateInActiveVote = newValue;
    notifyListeners();
  }

  set voted(VoteCategory? newValue){
    //_voted = newValue;
    notifyListeners();
  }
}