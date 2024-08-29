import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import '../../firebase_utils.dart';
import '../../model/Recomended.dart';
import '../../model/movie.dart';
import '../../movie_details/movie_details_screen.dart';

class MovieItemRecommeded extends StatefulWidget {
  final ResultsRecomended resultsRecomended;
  MovieItemRecommeded({super.key, required this.resultsRecomended});

  @override
  State<MovieItemRecommeded> createState() => _MovieItemRecommededState();
}

class _MovieItemRecommededState extends State<MovieItemRecommeded> {
  bool isBooked = false;

  @override
  void initState() {
    super.initState();
    loadIsBooked();
  }

  void loadIsBooked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isBooked = prefs.getBool('${widget.resultsRecomended.id}') ?? false;
    });
  }

/*  void _saveIsBooked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.resultsRecomended.id}', isBooked);
    print('Saved isBooked for ${widget.resultsRecomended.id}: $isBooked');
  }*/

  Future<void> _updateSharedPrefs(String movieId, bool isBooked) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$movieId', isBooked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{

        final result = await Navigator.pushNamed(
            context, MovieDetailsScreen.routeName,
            arguments: widget.resultsRecomended.id);

        if ( result == true) {
          isBooked=true;
          print("osman2");
          setState(() {});
        }else{
          print("Osman");
          isBooked=false;
          setState(() {});
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            NetworkImageCustom(
              image: widget.resultsRecomended.posterPath!,
              width: 90.w,
              height: 200.h,
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  isBooked = !isBooked;
                });


                if (isBooked) {
                  await FirebaseUtils.addMovieToFireStore(Movie(
                    id: widget.resultsRecomended.id.toString(),
                    title: widget.resultsRecomended.title ?? "",
                    imageUrl: widget.resultsRecomended.posterPath ?? "",
                    dateTime: DateTime.parse(widget.resultsRecomended.releaseDate ?? ""),
                  ));
                } else {
                  await FirebaseUtils.deleteMovieFromFireStore(widget.resultsRecomended.id.toString());
                }

                await _updateSharedPrefs(widget.resultsRecomended.id.toString(), isBooked);

              },
              child: isBooked==true
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
            Positioned(
              top: 90.h,
              child: Container(
                height: 90.h,
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                  color: Color(0xff514F4F),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                width: 90.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/star-2.png",
                          width: 15.w,
                          height: 15.h,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          widget.resultsRecomended.voteAverage.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Text(
                      widget.resultsRecomended.originalTitle!,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 9.sp),
                    ),
                    Text(
                      widget.resultsRecomended.releaseDate!,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 9.sp,
                        color: ColorApp.greyShade2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
