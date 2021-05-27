import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movies_controller.dart';

class MoviesPage extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoviesPage'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Visibility(
            visible: !controller.loading,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                        () => Text('Total de Filmes ${controller.totalPages}')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        ...controller.movies.map((filme) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 150,
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${filme.posterImageUrl}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 150),
                                  child: Text(
                                    filme.title,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 150),
                                  child: Text(
                                    filme.overview,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
