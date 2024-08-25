import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';

import '../api_service/osman/api_constant_osman.dart';

class NetworkImageCustom extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  const NetworkImageCustom(
      {super.key,
      required this.image,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${ApiConstant.imageBaseUrl}$image",
      width: width,
      height: height,
      fit: BoxFit.fill,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: ColorApp.primaryColor,
      )),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: ColorApp.primaryColor,
        size: 30.sp,
      ),
    );
  }
}
