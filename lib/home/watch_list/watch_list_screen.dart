import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/watch_list/movie_list_provider.dart';
import 'package:movie_app/home/watch_list/watch_list_item.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var movieListProvider = Provider.of<MovieListProvider>(context);
  movieListProvider.getAllMoviesFromFireStore();

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              const Icon(Icons.bookmark_add_outlined, color: ColorApp.primaryColor, size: 30,),
              SizedBox(
                width: 5.w,
              ),
              Text('Watch List',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 24.sp,
                    color: ColorApp.whiteColor
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 4,
                );
              },
              itemBuilder: (context, index){
                return WatchListItem(movie: movieListProvider.moviesList[index]);
              },
              itemCount: movieListProvider.moviesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
