import 'package:dio/dio.dart';

import 'package:filmes_app/core/exceptions/repository_exception.dart';
import 'package:filmes_app/core/rest_client/rest_client.dart';
import 'package:filmes_app/models/movies.dart';

import './movies_repository.dart';

class MoviesRepositoryRestClientImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryRestClientImpl({
    required RestClient restClient,
  }) : _restClient = restClient; 

  @override
  Future<Movies> findPopularMovies() async {
    try {
      final result = await _restClient.auth().get(
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
      final result = await _restClient.auth().get(
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
