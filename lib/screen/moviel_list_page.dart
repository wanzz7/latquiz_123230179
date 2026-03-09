import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String year;
  final String genre;
  final String director;
  final List<String> cast;
  final double rating;
  final String assetPath;
  final String synopsis;

  Movie({
    required this.title,
    required this.year,
    required this.genre,
    required this.director,
    required this.cast,
    required this.rating,
    required this.assetPath,
    required this.synopsis,
  });
}

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Dummy
    final List<Movie> movieList = [
      Movie(
        title: "Fast Five",
        year: "2011",
        genre: "Action, Crime",
        director: "Justin Lin",
        cast: ["Vin Diesel", "Paul Walker", "Dwayne Johnson"],
        rating: 7.3,
        assetPath: "assets/images/fastfive.jpg",
        synopsis: "Dominic Toretto dan krunya merencanakan pencurian besar-besaran senilai \$100 juta dari pebisnis korup di Brasil, sementara mereka diburu oleh agen DSS elit.",
      ),
      Movie(
        title: "The Fast & The Furious: Tokyo Drift",
        year: "2006",
        genre: "Action, Crime, Thriller",
        director: "Justin Lin",
        cast: ["Lucas Black", "Sung Kang", "Bow Wow"],
        rating: 6.1,
        assetPath: "assets/images/tokyodrift.jpg",
        synopsis: "Seorang remaja Amerika dikirim ke Tokyo untuk tinggal bersama ayahnya dan terjerumus ke dunia balap drift bawah tanah yang berbahaya.",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Catalog"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie)),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    movie.assetPath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200, color: Colors.grey[300], child: const Icon(Icons.broken_image),
                    ),
                  ),
                  ListTile(
                    title: Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${movie.year} • ${movie.genre}"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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


class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Poster dengan Tombol Back
            Stack(
              children: [
                Image.asset(
                  movie.assetPath,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul dan Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, size: 20, color: Colors.white),
                            const SizedBox(width: 5),
                            Text(
                              movie.rating.toString(),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Tahun dan Genre
                  Text(
                    "${movie.year} • ${movie.genre}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700], fontStyle: FontStyle.italic),
                  ),
                  const Divider(height: 40),

                  // Sutradara
                  const Text("Director", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(movie.director, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),

                  // Pemeran
                  const Text("Top Cast", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: movie.cast.map((actor) => Chip(label: Text(actor))).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Sinopsis
                  const Text("Synopsis", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    movie.synopsis,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}