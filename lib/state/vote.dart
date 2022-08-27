/// Import all dependencies, packages and classes
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:flutter_auth/services/voteList.dart';

/// VoteState class to know the state of votes
class VoteState with ChangeNotifier{

  /// Create an instance of the VoteCategory class
  List<VoteCategory>? _voteList = <VoteCategory>[];
  VoteCategory? _activeVote;
  String? _selectedCandidateInActiveVote;


  /// Loading votes
  void loadVoteList(BuildContext context) async{
    _voteList = getVoteList();
    /// get update
    notifyListeners();
    /// getting votes from CloudFirestore
    /// Not working @ the moment
    // getVoteListFromFirestore(context);
  }

  /// Clearing VoteState
  void clearState(){
    _voteList = null;
    _activeVote = null;
    _selectedCandidateInActiveVote = null;
  }

  /// getter to get the List of all votes and vote categories
  List<VoteCategory>? get voteList => _voteList;

  /// setter to set new votes
  set voteList(newValue){
    _voteList = newValue;

    /// get update
    notifyListeners();
  }

  /// get selected category selected by user
  VoteCategory? get activeVote => _activeVote;

  /// get selected candidate selected by user
  String? get selectedCandidateInActiveVote => _selectedCandidateInActiveVote;

  /// set new category selected by user
  set activeVote(newValue) {
    _activeVote = newValue;
    notifyListeners();
  }

  /// set new candidate selected by user
  set selectedCandidateInActiveVote(String? newValue){
    _selectedCandidateInActiveVote = newValue;
    notifyListeners();
  }

}