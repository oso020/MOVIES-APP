import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/movie_home/cubit/recomended/movie_home_states_recomeded.dart';
import 'package:movie_app/home/movie_home/cubit/recomended/movie_home_view_model_recomended.dart';
import 'package:movie_app/home/movie_home/movie_item_recommeded.dart';

class RecomendedListViewAndText extends StatelessWidget {
  RecomendedListViewAndText({super.key});

  MovieHomeViewModelRecomended movieHomeViewModelRecomended =
      MovieHomeViewModelRecomended();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => movieHomeViewModelRecomended..getRecomendedData(),
      child: BlocBuilder<MovieHomeViewModelRecomended ,MovieHomeStatesRecomended>(
        builder: (context, state) {
          if (state is MovieHomeSuccessRecomended) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              height: 225.h,
              color: ColorApp.greyShade5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recomended",
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
                        return MovieItemRecommeded(
                          resultsRecomended: state.results![index],
                        );
                      },),
                  )
                ],
              ),
            );
          } else if (state is MovieHomeErrorRecomended) {
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
