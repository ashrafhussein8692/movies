import 'package:flutter/material.dart';
import 'package:movies/webview.dart';
import 'package:provider/provider.dart';
import '../model/movies_provider.dart';

class MoviePopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieProvider>(context);
    return FutureBuilder(
        future: movies.getPopular(),
        builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            ? CircularProgressIndicator()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1 / 1.51),
                itemBuilder: (context, index) =>
                    buildGridMovie(movies.popular[index], context),
                itemCount: movies.popular.length,
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
