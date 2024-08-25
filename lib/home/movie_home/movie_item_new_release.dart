import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/NewReleases.dart';
import 'package:movie_app/model/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../movie_details/movie_details_screen.dart';

class MovieItemNewRelease extends StatefulWidget {
  final ResultsNewReleases resultsNewReleases;
  Movie movie;
  MovieItemNewRelease({super.key, required this.resultsNewReleases, required this.movie});

  @override
  State<MovieItemNewRelease> createState() => _MovieItemNewReleaseState();
}

class _MovieItemNewReleaseState extends State<MovieItemNewRelease> {
  bool isBooked = false;

  @override
  void initState() {
    super.initState();
    loadIsBooked();
  }

  void loadIsBooked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isBooked = prefs.getBool('${widget.resultsNewReleases.id}') ?? false;
    });
  }

  /*void saveIsBooked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('${widget.resultsNewReleases.id}', isBooked);
  }*/

  Future<void> _updateSharedPrefs(String movieId, bool isBooked) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$movieId', isBooked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {

        final result = await Navigator.pushNamed(
            context, MovieDetailsScreen.routeName,
            arguments: widget.resultsNewReleases.id);

        if ( result == true) {
          isBooked=true;
          print("osman2");
          setState(() {});
        }else{
          print("Osman");
          isBooked=false;
          setState(() {});}
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: NetworkImageCustom(
              image: "${widget.resultsNewReleases.posterPath!}",
              width: 100.w,
              height: 150.h,
            ),
          ),
          GestureDetector(
            onTap: () async{
              setState(() {
                isBooked = !isBooked;
              });

              if (isBooked == true) {
                await FirebaseUtils.addMovieToFireStore(Movie(
                  id: widget.resultsNewReleases.id.toString(),
                  title: widget.resultsNewReleases.title ?? "",
                  imageUrl: widget.resultsNewReleases.posterPath ?? "",
                  dateTime: DateTime.parse(widget.resultsNewReleases.releaseDate ?? ""),
                ));
              } else {
               await FirebaseUtils.deleteMovieFromFireStore(widget.movie.id);
              }
            await  _updateSharedPrefs(widget.movie.id, isBooked);
            },
            child: isBooked == true
                ? Image.asset(
              "assets/images/bookmark_saved.png",
              width: 30.w,
              height: 40.h,
              fit: BoxFit.fill,
            )
                : Image.asset(
              "assets/images/bookmark.png",
              width: 30.w,
              height: 40.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
