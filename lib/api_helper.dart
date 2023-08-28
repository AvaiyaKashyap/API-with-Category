// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'model.dart';
//
// class ApiHelper {
//   Future<List<AppBanner>> fetchBanners() async {
//     final jsonString = await rootBundle.loadString('assets/file1.json');
//     final data = json.decode(jsonString);
//     final bannerList = data['data']['banners'] as List;
//     return bannerList.map((item) => AppBanner.fromJson(item)).toList();
//   }
//
//   Future<List<Category>> fetchCategories() async {
//     final jsonString = await rootBundle.loadString('assets/file1.json');
//     final data = json.decode(jsonString);
//     final categoryList = data['data']['categories'] as List;
//     return categoryList.map((item) => Category.fromJson(item)).toList();
//   }
//
//   Future<List<Subcategory>> fetchSubcategoriesForCategory(String categoryId) async {
//     final jsonString = await rootBundle.loadString('assets/file2.json');
//     final data = json.decode(jsonString)['data'] as List;
//     final subcategoryList = data
//         .where((item) => item['categoryId'] == categoryId.toString())
//         .map((item) => Subcategory.fromJson(item))
//         .toList();
//     return subcategoryList;
//   }
//
//   Future<List<Wallpaper>> fetchWallpapers() async {
//     final jsonString = await rootBundle.loadString('assets/file1.json');
//     final data = json.decode(jsonString);
//     final wallpaperList = data['data']['wallpapers'] as List;
//     return wallpaperList.map((item) => Wallpaper.fromJson(item)).toList();
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class ApiHelper {
  final String baseUrl = 'http://192.168.29.38:3000'; // Replace with your actual API base URL

  Future<List<AppBanner>> fetchBanners() async {
    final response = await http.get(Uri.parse('$baseUrl/file1'));
    final data = json.decode(response.body);
    final bannerList = data['data']['banners'] as List;
    return bannerList.map((item) => AppBanner.fromJson(item)).toList();
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/file1'));
    final data = json.decode(response.body);
    final categoryList = data['data']['categories'] as List;
    return categoryList.map((item) => Category.fromJson(item)).toList();
  }

  Future<List<Subcategory>> fetchSubcategoriesForCategory(String categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/file2'));
    final data = json.decode(response.body);
    final subcategoryListData = data['data'] as List; // Extract the 'data' map
    final subcategoryList = subcategoryListData
        .where((item) => item['categoryId'] == categoryId)
        .map((item) => Subcategory.fromJson(item))
        .toList();
    return subcategoryList;
  }

  Future<List<Wallpaper>> fetchWallpapers() async {
    final response = await http.get(Uri.parse('$baseUrl/file2'));
    final data = json.decode(response.body);
    final wallpaperList = data['data']['wallpapers'] as List;
    return wallpaperList.map((item) => Wallpaper.fromJson(item)).toList();
  }
}

