import 'package:flutter/material.dart';
import 'package:meals/category_item.dart';

import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeal')),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          // mainAxisExtent: 200,
        ),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(catData.title, catData.color);
        }).toList(),
      ),
    );
  }
}
