import 'package:flutter/material.dart';
import 'package:movies/remotly/dio_helper.dart';

import 'package:movies/model/movies_provider.dart';
import 'package:provider/provider.dart';

import 'lay_out/home.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(providers: [
      ChangeNotifierProvider.value(value: MovieProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: MyHomePage(),
      ),
    );
  }
}




