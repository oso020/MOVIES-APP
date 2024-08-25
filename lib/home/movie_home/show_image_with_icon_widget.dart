import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';

import '../../component_widgets/network_image_custom.dart';
import '../../model/Popular.dart';

class ShowImage extends StatefulWidget {
  final ResultsPopular results;
  const ShowImage({super.key, required this.results});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,
            arguments: widget.results.id);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: NetworkImageCustom(
              image: widget.results.posterPath!,
              width: 120.w,
              height: 180.h,
            ),

            // CachedNetworkImage(
            //   imageUrl: "${ApiConstant.imageBaseUrl}${widget.results.posterPath}",
            //   width: 120.w,
            //   height: 180.h,
            //   fit: BoxFit.fill,
            //   placeholder: (context, url) => Center(child: CircularProgressIndicator(
            //     color: ColorApp.primaryColor,
            //   )),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {

                FirebaseUtils.addMovieToFireStore(Movie(
                  id: widget.results.id.toString(),
                    title: widget.results.originalTitle ?? "",
                    imageUrl: widget.results.posterPath ?? "",
                  dateTime: DateTime.parse(widget.results.releaseDate ?? ""),
                )
                );

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
          )
        ],
      ),
    );
  }
}
