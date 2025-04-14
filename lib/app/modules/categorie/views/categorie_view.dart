import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categorie_controller.dart';

class CategorieView extends GetView<CategorieController> {
  const CategorieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategorieView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CategorieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
