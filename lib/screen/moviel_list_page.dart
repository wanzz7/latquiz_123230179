import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie List")),

      body: ListView.builder(
        itemCount: movieList.length,

        itemBuilder: (context, index) {
          final movie = movieList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: movie),
                ),
              );
            },

            child: Container(
              margin: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
              ),

              child: Stack(
                children: [
                  /// Poster Film
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      movie.imgUrl,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Gradient overlay
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  /// Info Film
                  Positioned(
                    bottom: 10,
                    left: 15,
                    right: 15,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        /// Title
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "${movie.year} • ${movie.genre} • ⭐ ${movie.rating}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),

                        /// Bookmark Button
                        IconButton(
                          icon: Icon(
                            movie.isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: Colors.white,
                          ),

                          onPressed: () {
                            setState(() {
                              movie.isBookmarked = !movie.isBookmarked;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 
