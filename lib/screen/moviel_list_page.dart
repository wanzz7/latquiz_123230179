import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
      ),

      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

            child: ListTile(
              leading: Image.network(
                movie.imgUrl,
                width: 50,
                fit: BoxFit.cover,
              ),

              title: Text(movie.title),

              subtitle: Text(
                "${movie.year} • ${movie.genre} • ⭐ ${movie.rating}",
              ),

              trailing: Icon(
                movie.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_border,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailPage(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
