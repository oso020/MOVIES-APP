import 'package:flutter/material.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';

class TestHomeScreen extends StatelessWidget {
  static const String routeName = "simple";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Define the movie ID you want to pass
            int movieId = 53351;
            Navigator.pushNamed(context, MovieDetailsScreen.routeName,
                arguments: movieId);
            // Navigate to MovieDetailsScreen with the movie ID
          },
          child: Text('Go to Movie Details'),
        ),
      ),
    );
  }
}
