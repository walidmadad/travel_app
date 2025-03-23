import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children:
          categoriesData
              .map(
                (category) => CategoryItem(
                  id: category.id,
                  title: category.title,
                  imageUrl: category.imageUrl,
                ),
              )
              .toList(),
    );
  }
}
