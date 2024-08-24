
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import 'package:movie_app/model/NewReleases.dart';

import '../../movie_details/movie_details_screen.dart';

class MovieItemNewRelease extends StatefulWidget {
   final ResultsNewReleases  resultsNewReleases;
   MovieItemNewRelease({super.key, required this.resultsNewReleases});

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
              isBooked =!isBooked;
              setState(() {

              });
            },
            child:
          isBooked==true?
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
