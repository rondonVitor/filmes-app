import 'package:filmes_app/core/rest_client/rest_client.dart';
import 'package:filmes_app/core/rest_client/rest_client_dio.dart';
import 'package:filmes_app/repositories/movies/movies_repository.dart';
import 'package:filmes_app/repositories/movies/movies_repository_rest_client_impl.dart';
import 'package:get/get.dart';
import './movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClientDio());
    // Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl());
    // Get.lazyPut<MoviesRepository>(() => MoviesRepositoryCustomDioImpl());
    Get.lazyPut<MoviesRepository>(() => MoviesRepositoryRestClientImpl(restClient: Get.find()));
    Get.put(MoviesController());
  }
}
