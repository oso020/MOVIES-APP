import 'package:flutter/material.dart';

import '../../color/color_app.dart';


class Search extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.close,color: ColorApp.whiteColor,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back,color: ColorApp.whiteColor,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/movie_icon.png'),
        Text('No Movies Found',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 13,
            color: ColorApp.greyShade4,
          ),),
      ],
    );
  }

}