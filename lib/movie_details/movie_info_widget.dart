import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color/color_app.dart';
import '../model/movie.dart';
import 'movie_type_container.dart';

class MovieInfoWidget extends StatefulWidget {
  String overview;
  String rating;
  List<String> genres;
  String imagePath;
  String id;
  String title;
  String?dateTime;

  MovieInfoWidget(
      {required this.overview,
      required this.rating,
      required this.genres,
      required this.imagePath,
      required this.id,
        required this.title,
        required this.dateTime
      });

  @override
  State<MovieInfoWidget> createState() => _MovieInfoWidgetState();
}

class _MovieInfoWidgetState extends State<MovieInfoWidget> {
  getGenresList() {
    List<MovieTypeContainer> genresList = [];

    for (int i = 0; i < widget.genres.length; i++) {
      genresList.add(MovieTypeContainer(type: widget.genres[i]));
    }
    return genresList;
  }

  bool isBooked = false;

  @override
  void initState() {
    super.initState();
    loadIsBooked();
  }

  void loadIsBooked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isBooked = prefs.getBool('${widget.id}') ?? false;
    });
  }

  void saveIsBooked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(isBooked);
    prefs.setBool('${widget.id}', isBooked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500/${widget.imagePath}",
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
                isBooked = !isBooked;
                saveIsBooked();
                setState(() {});

                if (isBooked == true) {
                  FirebaseUtils.addMovieToFireStore(Movie(
                    id: widget.id.toString(),
                    title: widget.title ,
                    imageUrl: widget.imagePath ,
                    dateTime: DateTime.parse(widget.dateTime ?? ""),
                  ));
                } else {
                  FirebaseUtils.deleteMovieFromFireStore(widget.id);
                }
              },
              child: isBooked
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
                widget.overview,
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
                    widget.rating,
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
