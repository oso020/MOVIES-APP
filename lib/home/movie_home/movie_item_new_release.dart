
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/NewReleases.dart';
import 'package:movie_app/model/movie.dart';

import '../../movie_details/movie_details_screen.dart';

class MovieItemNewRelease extends StatefulWidget {
   final ResultsNewReleases  resultsNewReleases;
   Movie movie;
   MovieItemNewRelease({super.key, required this.resultsNewReleases, required this.movie});

  @override
  State<MovieItemNewRelease> createState() => _MovieItemNewReleaseState();
}

class _MovieItemNewReleaseState extends State<MovieItemNewRelease> {

  bool isBooked=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: widget.resultsNewReleases.id);

      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child:
            NetworkImageCustom(
            image: "${widget.resultsNewReleases.posterPath!}",
      width: 100.w,
      height: 150.h,),

          ),

          GestureDetector(
            onTap: (){
              // isBooked =!isBooked;
              widget.movie.isWatchList = !widget.movie.isWatchList;

              FirebaseUtils.addMovieToFireStore(Movie(
                  id: widget.resultsNewReleases.id.toString(),
                  title: widget.resultsNewReleases.title ?? "",
                  imageUrl: widget.resultsNewReleases.posterPath ?? "",
                dateTime: DateTime.parse(widget.resultsNewReleases.releaseDate ?? "") ,
              )
              );
              FirebaseUtils.updateMovieIsWatchListInFireStore(widget.movie);

              setState(() {

              });
            },
            child:
            //isBooked==true ?
            widget.movie.isWatchList == true ?
            Image.asset(
              "assets/images/bookmark_saved.png",
              width: 30.w,
              height: 40.h,
              fit: BoxFit.fill,
            )
            :
            Image.asset(
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
