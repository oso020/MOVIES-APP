import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/model/movie.dart';

class FirebaseUtils {
  /// Function to get the collection reference.
  static CollectionReference<Movie> getMoviesCollection() {
    return FirebaseFirestore.instance.collection(Movie.collectionName)
        .withConverter<Movie>(
      fromFirestore: (snapshot, options) => Movie.FromFireStore(snapshot.data()!),
      toFirestore: (movie, options) => movie.toFireStore(),
    );
  }

  /// Function to add a movie to Firestore.
  static Future<void> addMovieToFireStore(Movie movie) {
    var movieCollection = getMoviesCollection();  // Get collection
    DocumentReference<Movie> movieDocumentRef = movieCollection.doc();  // Create document with auto ID

    movieDocumentRef = movieCollection.doc(movie.id);// Set the auto-generated ID to the movie
    return movieDocumentRef.set(movie);
  }

  /// Function to delete a movie from Firestore.
  static Future<void> deleteMovieFromFireStore(String movieId) {
    return getMoviesCollection().doc(movieId).delete();
  }

/// Function to update the `isWatchList` field of a movie.
static Future<void> updateMovieIsWatchListInFireStore(Movie movie) {
  var movieCollection = getMoviesCollection();   // Get collection
  return movieCollection.doc(movie.id).update({
    'isWatchList': movie.isWatchList,
  });
}
}
