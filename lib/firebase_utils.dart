import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/model/movie.dart';


class FirebaseUtils{
  ///func to use the collection and call it before update, delete,....
  static CollectionReference<Movie> getMoviesCollection(Movie movie){
    return FirebaseFirestore.instance.doc(movie.id).collection(Movie.collectionName).
    withConverter<Movie>(
        fromFirestore: (snapShot, options) => Movie.FromFireStore(snapShot.data()!),
        toFirestore: (movie, options) => movie.toFireStore()
    );
  }
  ///func to add movie
  static Future<void> addMovieToFireStore(Movie movie){
    var movieCollection = getMoviesCollection(movie);  //collection
    DocumentReference<Movie> movieDocumentRef = movieCollection.doc();  //create document
    movie.id = movieDocumentRef.id;      //auto id
    return movieDocumentRef.set(movie);
  }

  ///func to delete movie
  static Future<void> deleteMovieFromFireStore(Movie movie){
    return getMoviesCollection(movie).doc(movie.id).delete();
  }

  // ///func to edit isWatchList movie
  // static Future<void> updateMovieIsWatchListInFireStore(Movie movie, String movieId) {
  //   var movieCollection = getMoviesCollection(movieId);   //collection
  //
  //   return movieCollection.doc(movie.id).update({
  //     'isWatchList': movie.isWatchList,
  //   });
  // }
}