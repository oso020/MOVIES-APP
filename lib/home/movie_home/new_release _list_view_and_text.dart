
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/movie_home/cubit/new_releases/movie_home_states_NewReleases.dart';
import 'package:movie_app/home/movie_home/cubit/new_releases/movie_home_view_model_new_releases.dart';
import 'package:movie_app/model/movie.dart';

import 'movie_item_new_release.dart';

class NewReleaseListViewAndText extends StatelessWidget {
   NewReleaseListViewAndText({super.key});
  MovieHomeViewModelNewReleases movieHomeViewModelNewReleases = MovieHomeViewModelNewReleases();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => movieHomeViewModelNewReleases..getNewReleasesData(),
      child: BlocBuilder<MovieHomeViewModelNewReleases ,MovieHomeStatesNewReleases>(
        builder: (context, state) {
          if (state is MovieHomeSuccessNewReleases) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              height: 215.h,
              color: ColorApp.greyShade5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Releases ",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.results!.length,
                      separatorBuilder: (context, index) => SizedBox(width: 13.w,),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieItemNewRelease(
                          resultsNewReleases: state.results![index],
                          movie: Movie(
                            id: state.results![index].id.toString(),
                            title: state.results![index].title ?? "",
                            imageUrl: state.results![index].posterPath ?? "",
                            dateTime: DateTime.parse(state.results![index].releaseDate ?? ""),
                          ),
                        );
                      },),
                  )
                ],
              ),
            );
          } else if (state is MovieHomeErrorNewReleases) {
            return SizedBox(
              height: 220.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            );
          } else {
            return  SizedBox(
              height: 250.h,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: ColorApp.primaryColor,
                  ),
                ],
              ),
            );
          }
        },

      ),
    );
  }
}
