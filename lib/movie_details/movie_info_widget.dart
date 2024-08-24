import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color_app.dart';
import 'movie_type_container.dart';

class MovieInfoWidget extends StatelessWidget {
  String overview;
  String rating;
  List<String> genres;
  String imagePath;

  MovieInfoWidget(
      {required this.overview,
      required this.rating,
      required this.genres,
      required this.imagePath});

  getGenresList() {
    List<MovieTypeContainer> genresList = [];

    for (int i = 0; i < genres.length; i++) {
      genresList.add(MovieTypeContainer(type: genres[i]));
    }
    return genresList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500/$imagePath",
              width: 129.w,
              height: 199.h,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/images/movie_icon.png",
                  width: 129.w,
                  height: 199.h,
                  fit: BoxFit.fill,
                );
              },
            ),
            InkWell(
              onTap: () {
              },
              child: Image.asset("assets/images/bookmark.png"),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            children: [
              //movie types
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                    spacing: 5.0, runSpacing: 8.0, children: getGenresList()),
              ),
              SizedBox(
                height: 20,
              ),
              //movie description
              Text(
                overview,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorApp.greyShade2,
                      fontSize: 13,
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              //movie rate
              Row(
                children: [
                  Image.asset("assets/images/star.png"),
                  SizedBox(width: 15.w),
                  Text(
                    rating,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
