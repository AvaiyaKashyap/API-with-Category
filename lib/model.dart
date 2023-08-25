class AppBanner {
  final int id;
  final String image;
  final int wallpaperId;
  final String status;
  final String order;
  final String createdAt;
  final String updatedAt;

  AppBanner({
    required this.id,
    required this.image,
    required this.wallpaperId,
    required this.status,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppBanner.fromJson(Map<String, dynamic> json) {
    return AppBanner(
      id: json['id'],
      image: json['image'],
      wallpaperId: json['wallpaperId'],
      status: json['status'],
      order: json['order'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String image;
  final String status;
  final String order;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      order: json['order'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Wallpaper {
  final int id;
  final String name;
  final String image;
  final String subcategoryId;
  final String homecategoryId;
  final String status;
  final String createdAt;
  final String updatedAt;

  Wallpaper({
    required this.id,
    required this.name,
    required this.image,
    required this.subcategoryId,
    required this.homecategoryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      subcategoryId: json['subcategoryId'],
      homecategoryId: json['homecategoryId'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
class Subcategory {
  final int id;
  final String name;
  final String image;
  final String categoryId;
  final int likes;
  final String status;
  final String order;
  final String createdAt;
  final String updatedAt;

  Subcategory({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.likes,
    required this.status,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      categoryId: json['categoryId'],
      likes: json['likes'],
      status: json['status'],
      order: json['order'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

