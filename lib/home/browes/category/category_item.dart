import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/browes/category/category_Item_List.dart';

class CategoryItem extends StatelessWidget {
  Categoryitemlist category;
  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          category.imagePath,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Text(
          category.name,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}