import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'model.dart';

class ApiHelper {
  Future<List<AppBanner>> fetchBanners() async {
    final jsonString = await rootBundle.loadString('assets/file1.json');
    final data = json.decode(jsonString);
    final bannerList = data['data']['banners'] as List;
    return bannerList.map((item) => AppBanner.fromJson(item)).toList();
  }

  Future<List<Category>> fetchCategories() async {
    final jsonString = await rootBundle.loadString('assets/file1.json');
    final data = json.decode(jsonString);
    final categoryList = data['data']['categories'] as List;
    return categoryList.map((item) => Category.fromJson(item)).toList();
  }

  Future<List<Subcategory>> fetchSubcategoriesForCategory(String categoryId) async {
    final jsonString = await rootBundle.loadString('assets/file2.json');
    final data = json.decode(jsonString)['data'] as List;
    final subcategoryList = data
        .where((item) => item['categoryId'] == categoryId.toString())
        .map((item) => Subcategory.fromJson(item))
        .toList();
    return subcategoryList;
  }

  Future<List<Wallpaper>> fetchWallpapers() async {
    final jsonString = await rootBundle.loadString('assets/file1.json');
    final data = json.decode(jsonString);
    final wallpaperList = data['data']['wallpapers'] as List;
    return wallpaperList.map((item) => Wallpaper.fromJson(item)).toList();
  }
}
