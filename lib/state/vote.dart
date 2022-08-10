import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:flutter_auth/services/voteList.dart';


class VoteState with ChangeNotifier{
  // Create an instance of the VoteCategory class
  List<VoteCategory> _voteList = <VoteCategory>[];
  VoteCategory? _activeVote;
  String? _selectedCandidateInActiveVote;


  void loadVoteList()async{
    _voteList = getVoteList();
    notifyListeners();
  }

  void clearState(){
    _activeVote = null;
    _selectedCandidateInActiveVote = null;
  }

  List<VoteCategory> get voteList => _voteList;
  VoteCategory? get activeVote => _activeVote;
  String? get selectedCandidateInActiveVote => _selectedCandidateInActiveVote;

  set activeVote(newValue) {
    activeVote = newValue;
    notifyListeners();
  }

  set selectedCandidateInActiveVote(String? newValue){
    selectedCandidateInActiveVote = newValue;
    notifyListeners();
  }
}