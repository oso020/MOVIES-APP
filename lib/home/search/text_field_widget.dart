import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/search/cubit/search_view_model.dart';

import '../../color/color_app.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}
class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return TextField(
      onSubmitted: (text) {
        viewModel.isSearching(text);
      },
      onChanged: (text) {
        viewModel.isSearching(text);
      },
      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14.sp,
              color: ColorApp.greyShade2,
            ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.greyShade2),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.greyShade2),
            borderRadius: BorderRadius.circular(30.r)),
        fillColor: ColorApp.greyShade3,
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: ColorApp.whiteColor,
        ),
      ),
    );
  }
}
