import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/browse/category_discover_argument.dart';
import 'package:movie_app/home/browse/discover_screen.dart';
import '../../../api_service/mohamed_ali/category_response.dart';

class CategoryItem extends StatelessWidget {
  Genres genres;
  CategoryItem({required this.genres});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(DiscoverScreen.routeName,
        arguments: CategoryDiscoverArgument(genres: genres)
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/category_image.png',
              width: double.infinity,
              height: 140.h,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            genres.name??'',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
