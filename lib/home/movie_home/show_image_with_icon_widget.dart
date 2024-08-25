import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  void initState() {
    super.initState();
    _loadBookmarkStatus();
  }

  Future<void> _loadBookmarkStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkStatus = prefs.getBool('${widget.results.id}');
    setState(() {
      isBooked = bookmarkStatus ?? false;
    });
  }

  Future<void> _updateSharedPrefs(String movieId, bool isBooked) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$movieId', isBooked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(
            context, MovieDetailsScreen.routeName,
            arguments: widget.results.id);

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
            borderRadius: BorderRadius.circular(10),
            child: NetworkImageCustom(
              image: widget.results.posterPath!,
              width: 120.w,
              height: 180.h,
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  isBooked = !isBooked;
                });

                if (isBooked) {
                  // Add to Firestore
                  await FirebaseUtils.addMovieToFireStore(Movie(
                    id: widget.results.id.toString(),
                    title: widget.results.originalTitle ?? "",
                    imageUrl: widget.results.posterPath ?? "",
                    dateTime: DateTime.parse(widget.results.releaseDate ?? ""),
                  ));
                } else {
                  // Remove from Firestore
                  await FirebaseUtils.deleteMovieFromFireStore(
                      widget.results.id.toString());
                }

                // Update SharedPreferences
                await _updateSharedPrefs(
                    widget.results.id.toString(), isBooked);
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
          ),
        ],
      ),
    );
  }
}
