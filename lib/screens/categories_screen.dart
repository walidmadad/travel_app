import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel App"),
        backgroundColor: Colors.blue[700],
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisExtent: 200,
          crossAxisSpacing: 10,
        ),
        children:
            categoriesData
                .map(
                  (category) => CategoryItem(
                    title: category.title,
                    imageUrl: category.imageUrl,
                  ),
                )
                .toList(),
      ),
    );
  }
}
