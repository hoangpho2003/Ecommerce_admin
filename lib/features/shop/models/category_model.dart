import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/utils/formatters/formatter.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
    this.createdAt,
    this.updatedAt,
  });

  String get formattedDate => TFormatter.formatDate(createdAt);
  String get formattedUpdateDate => TFormatter.formatDate(updatedAt);

  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeatured': isFeatured,
      'createdAt': createdAt,
      'updatedAt': updatedAt = DateTime.now(),
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: data['id'],
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        createdAt: data.containsKey('createdAt') ? data['createdAt']?.toDate() : null,
        updatedAt: data.containsKey('updatedAt') ? data['updatedAt']?.toDate() : null,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
