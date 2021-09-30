import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movies/screens/top_rated.dart';

import '../screens/movie_popular.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Movie TMDB',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Top Rated',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Popular',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [MovieTopRated(), MoviePopular()],
          ),
        ));
  }
}
