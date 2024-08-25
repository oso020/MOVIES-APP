import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/watch_list/movie_list_provider.dart';

import 'package:movie_app/home/browse/discover_screen.dart';

import 'package:movie_app/movie_details/movie_details_screen.dart';
import 'package:movie_app/responsive_ui/responsive_class.dart';
import 'package:movie_app/theme/theme_app.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseFirestore.instance.disableNetwork(); ///to run offline
  runApp(
      ChangeNotifierProvider(
          create: (context) => MovieListProvider(),
          child: MyApp()
      )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var width=ResponsiveClass.width(context);
    var height=ResponsiveClass.height(context);
    return ScreenUtilInit(
      designSize:  Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          theme: ThemeApp.theme,
          routes: {
            HomeScreen.routeName :(context)=> HomeScreen(),
            MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
            DiscoverScreen.routeName: (context) => DiscoverScreen()
          },
        );
      },
    );


  }
}


