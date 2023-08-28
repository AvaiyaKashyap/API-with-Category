import 'package:flutter/material.dart';
import 'api_helper.dart';
import 'model.dart';

class CategoryDetailScreen extends StatelessWidget {
  final ApiHelper apiHelper = ApiHelper();
  final String categoryId;

  CategoryDetailScreen({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khaber nai kai rite'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Subcategory>>(
        future: apiHelper.fetchSubcategoriesForCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error loading subcategories: ${snapshot.error}'));
          } else {
            final subcategories = snapshot.data ?? [];

            return ListView.builder(
              itemCount: subcategories?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Subcategory ID: ${subcategories?[index].id}'),
                  subtitle: Text('Name: ${subcategories?[index].name}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
