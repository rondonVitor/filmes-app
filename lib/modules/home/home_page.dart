import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton.icon(
              onPressed: () => Get.toNamed('/movies', arguments: 'populares'),
              icon: Icon(Icons.people_alt_outlined),
              label: Text('Populares'),
            ),
            ElevatedButton.icon(
              onPressed: () => Get.toNamed('/movies', arguments: 'maisVotados'),
              icon: Icon(Icons.people_alt_outlined),
              label: Text('Mais votados'),
            ),
          ],
        ),
      ),
    );
  }
}
