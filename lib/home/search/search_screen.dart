import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/search/search.dart';
import 'package:movie_app/home/search/search_item.dart';

import '../../color/color_app.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  color: ColorApp.greyShade2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.greyShade2),
                  borderRadius: BorderRadius.circular(30)
                ),
                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: ColorApp.greyShade2),
                    borderRadius: BorderRadius.circular(30)
                ),
                fillColor: ColorApp.greyShade3,
                filled: true,
                prefixIcon: Icon(Icons.search,color:ColorApp.whiteColor ,),
              ),
            ),
            SizedBox(height: 20.h,),
            SearchItem(),
          ],
        ),
      ),
    );
  }
}

/*
InkWell(
onTap: (){
showSearch(context: context, delegate: Search());
},
child: Container(
padding: EdgeInsets.all(8),
height: 50.h,
decoration: BoxDecoration(
color:  ColorApp.greyShade3,
borderRadius: BorderRadius.circular(30),
),
child: Row(
children: [
Icon(Icons.search, color: ColorApp.whiteColor,),
SizedBox(width: 10.w,),
Text('Search',style: Theme.of(context).textTheme.titleMedium!.copyWith(
fontSize: 14,
color: ColorApp.greyShade2,),)
],
),
),
),
*/

