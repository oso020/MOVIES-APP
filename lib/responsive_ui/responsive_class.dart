import 'package:flutter/cupertino.dart';

class ResponsiveClass{

  static double height(BuildContext context){
    var getHeight=MediaQuery.of(context).size.height;

    return getHeight;
  }

  static double width(BuildContext context){
    var getWidth=MediaQuery.of(context).size.width;

    return getWidth;
  }
}