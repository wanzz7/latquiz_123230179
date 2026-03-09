import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(child: Image.network(movie.imgUrl, height: 300)),

            const SizedBox(height: 20),

            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text("Year: ${movie.year}"),
            Text("Genre: ${movie.genre}"),
            Text("Director: ${movie.director}"),
            Text("Rating: ⭐ ${movie.rating}"),

            const SizedBox(height: 10),

            Text("Cast: ${movie.casts.join(", ")}"),

            const SizedBox(height: 20),

            const Text(
              "Synopsis",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(movie.synopsis),
          ],
        ),
      ),
    );
  }
}