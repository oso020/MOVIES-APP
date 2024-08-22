import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/movie_home/cubit/popular/movie_home_view_model_popular.dart';

import 'package:movie_app/home/movie_home/slider_item.dart';

import 'cubit/popular/movie_home_states_popular.dart';



class SliderList extends StatelessWidget {
  SliderList({super.key});
  MovieHomeViewModelPopular movieHomeViewModel = MovieHomeViewModelPopular();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => movieHomeViewModel..getPopularData(),
      child: BlocBuilder<MovieHomeViewModelPopular, MovieHomeStatesPopular>(
        builder: (context, state) {
          if (state is MovieHomeSuccessPopular) {
            return CarouselSlider.builder(
              options: CarouselOptions(
                height: 300.h,
                aspectRatio: 10 / 2,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: state.results!.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      SliderItem(
                results: state.results![itemIndex],
              ),
            );
          } else if (state is MovieHomeErrorPopular) {
            return SizedBox(
              height: 250.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 250,
              child: Column(
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
