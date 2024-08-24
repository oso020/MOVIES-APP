import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color_app.dart';

class MoreLikeThisItem extends StatelessWidget {
  int movieId;
  String title;
  String rate;
  String runTime;
  String imagePath;
  Function(int movieId) onMovieClicked;

  MoreLikeThisItem(
      {required this.movieId,
      required this.title,
      required this.rate,
      required this.runTime,
      required this.imagePath,
      required this.onMovieClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(movieId);
        onMovieClicked(movieId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 97.w,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: ColorApp.greyShade3,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container for the image
              Container(
                width: 97.w,
                height: 123.h,
                child: Stack(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500/$imagePath",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/movie_icon.png",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        // Handle the bookmark action
                      },
                      child: Image.asset("assets/images/bookmark.png"),
                    ),
                  ],
                ),
              ),
              // Container for movie info
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rating row
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/star.png",
                            width: 10.w,
                            height: 10.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            rate,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 10, color: ColorApp.whiteColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // Movie title
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 10, color: ColorApp.whiteColor),
                      ),
                      // Movie runtime
                      Text(
                        runTime,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 8, color: ColorApp.greyShade2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
