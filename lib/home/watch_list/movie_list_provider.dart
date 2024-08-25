import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/movie.dart';


class MovieListProvider extends ChangeNotifier{
  ///data
  List<Movie> moviesList = [];
  DateTime selectDate = DateTime.now();

  void getAllMoviesFromFireStore() async{

    /// to get : collection => Documents => Data
    QuerySnapshot<Movie> querySnapshot = await FirebaseUtils.getMoviesCollection().get();
    /// to convert :
    /// List<QueryDocumentSnapshot<Movie> => List<Movie>
    moviesList = querySnapshot.docs.map((doc){
      return doc.data();
    }
    ).toList();

    // ///sorting movies
    // moviesList.sort((Movie movie1 , Movie movie2){
    //  return movie1.dateTime.compareTo(movie2.dateTime);
    // });

   notifyListeners();
  }
}