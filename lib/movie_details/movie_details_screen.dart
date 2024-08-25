import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/movie_details/more_like_this_item.dart';
import 'package:movie_app/movie_details/movie_details_screen_states.dart';
import 'package:movie_app/movie_details/movie_details_screen_view_model.dart';
import 'package:movie_app/movie_details/movie_info_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = "movie_details_screen";

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel();
  late int movieId;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      movieId = ModalRoute.of(context)!.settings.arguments as int;
      viewModel.fetchMovieDetails(movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var isBooked = prefs.getBool('${movieId}') ?? false;
                Navigator.pop(context, isBooked);
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorApp.whiteColor,
              )),
          foregroundColor: ColorApp.whiteColor,
          title: BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is MovieDetailsSuccess) {
                  return Text(
                    state.movieDetails.title ?? "",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: ColorApp.whiteColor,
                        ),
                  );
                } else {
                  return Text(
                    "",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: ColorApp.whiteColor,
                        ),
                  );
                }
              }),
          centerTitle: true,
          backgroundColor: ColorApp.backgroundColor,
        ),
        body: BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is MovieDetailsError) {
                return Center(
                    child: Text(
                  state.status_message,
                  style: TextStyle(color: Colors.white),
                ));
              } else if (state is MovieDetailsSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            "https://image.tmdb.org/t/p/w500/${state.movieDetails.backdropPath}",
                            width: double.infinity,
                            height: 200.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/movie_icon.png",
                                width: double.infinity,
                                height: 200.h,
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.play_circle,
                                color: Colors.white,
                                size: 70.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      //container of movie info section:
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movieDetails.title ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: ColorApp.whiteColor,
                                  ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "${state.movieDetails.releaseDate ?? ''} ${(state.movieDetails.runtime ?? 0) ~/ 60}h ${(state.movieDetails.runtime ?? 0) % 60}m",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: ColorApp.greyShade2,
                                  ),
                            ),
                            SizedBox(height: 16.h),
                            MovieInfoWidget(
                              title: state.movieDetails.title ?? '',
                              dateTime: state.movieDetails.releaseDate ?? '',
                              id: state.movieId.toString(),
                              overview: state.movieDetails.overview ?? "",
                              rating: state.movieDetails.voteAverage
                                      ?.toInt()
                                      .toString() ??
                                  "0.0",
                              genres: state.movieDetails.genres
                                      ?.map((e) => e.name ?? "")
                                      .toList() ??
                                  [],
                              imagePath: state.movieDetails.posterPath ?? "",
                            ),
                          ],
                        ),
                      ),

                      //container of  more like this section:
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        color: ColorApp.greyShade5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "More Like This",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                                height: 185.h,
                                child: BlocBuilder<MovieDetailsViewModel,
                                        MovieDetailsState>(
                                    bloc: viewModel,
                                    builder: (context, state) {
                                      if (state is MovieDetailsError) {
                                        return Center(
                                          child: Text(
                                            state.status_message,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        );
                                      } else if (state is MovieDetailsSuccess) {
                                        return ListView.builder(
                                          itemCount:
                                              state.similarMoviesList.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return MoreLikeThisItem(
                                              movieId: state
                                                  .similarMoviesList[index].id,
                                              imagePath: state
                                                  .similarMoviesList[index]
                                                  .posterPath,
                                              title: state
                                                  .similarMoviesList[index]
                                                  .title,
                                              rate: state
                                                  .similarMoviesList[index]
                                                  .voteAverage
                                                  .toInt()
                                                  .toString(),
                                              runTime: state
                                                  .similarMoviesList[index]
                                                  .releaseDate,
                                              onMovieClicked: (newMovieId) {
                                                viewModel.fetchMovieDetails(
                                                    newMovieId);
                                              },
                                            );
                                          },
                                        );
                                      }
                                      return CircularProgressIndicator(
                                        color: ColorApp.primaryColor,
                                      );
                                    })),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(color: ColorApp.primaryColor),
              );
            }));
  }
}
