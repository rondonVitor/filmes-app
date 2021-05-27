import 'package:filmes_app/core/dio/custom_dio.dart';
import 'package:filmes_app/core/exceptions/repository_exception.dart';
import 'package:filmes_app/models/movies.dart';
import 'package:dio/dio.dart';

import './movies_repository.dart';

class MoviesRepositoryCustomDioImpl implements MoviesRepository {
  @override
  Future<Movies> findPopularMovies() async {
    try {
      final dio = CustomDio();
      final result = await dio.auth().get(
        '/movie/popular',
      );

      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }

  @override
  Future<Movies> findTopRatedMovies() async {
    try {
      final dio = CustomDio();
      final result = await dio.auth().get(
        '/movie/top_rated',
      );

      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e.message);
      print(s);
      throw RepositoryException();
    }
  }
}
