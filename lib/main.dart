import 'package:flutter/material.dart';
import 'api_helper.dart';
import 'model.dart';
import 'category_detail_screen.dart'; // Import the CategoryDetailScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ApiHelper apiHelper = ApiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thai gayu XD'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<AppBanner>>(
              future: apiHelper.fetchBanners(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error loading banners');
                } else {
                  final banners = snapshot.data;

                  return Column(
                    children: [
                      Text('Number of Banners: ${banners?.length ?? 0}'),
                      if (banners != null)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: banners.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Banner ID: ${banners[index].id}'),
                              subtitle: Text('Image: ${banners[index].image}'),
                            );
                          },
                        ),
                    ],
                  );
                }
              },
            ),
            FutureBuilder<List<Category>>(
              future: apiHelper.fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error loading categories');
                } else {
                  final categories = snapshot.data;

                  return Column(
                    children: [
                      Text('Number of Categories: ${categories?.length ?? 0}'),
                      if (categories != null)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetailScreen(categoryId: categories[index].id.toString()),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text('Category ID: ${categories[index].id}'),
                                subtitle: Text('Name: ${categories[index].name}'),
                              ),
                            );
                          },
                        ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
