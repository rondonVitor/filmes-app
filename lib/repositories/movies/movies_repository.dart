import 'package:filmes_app/models/movies.dart';

abstract class MoviesRepository {
  Future<Movies> findPopularMovies();
  Future<Movies> findTopRatedMovies();
}