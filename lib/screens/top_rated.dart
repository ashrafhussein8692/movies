import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/movies_provider.dart';
import 'package:movies/webview.dart';
import 'package:provider/provider.dart';



class MovieTopRated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieProvider>(context);
    return FutureBuilder(
        future: movies.getTopRated(),
        builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1 / 1.51),
                itemBuilder: (context, index) =>
                    buildGridMovie(movies.topRated[index], context),
                itemCount: movies.topRated.length,
              ));
  }
}

Widget buildGridMovie(results, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(
                    'https://www.themoviedb.org/movie/${results['id']}')));
      },
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${results['poster_path']}',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
