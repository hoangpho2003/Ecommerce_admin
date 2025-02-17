import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/utils/exceptions/format_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Firebase Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

// Get all categories from the 'Categories' collection
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final result = snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }


  Future<void> deleteCategory(String categoryId) async {
    try {
      await _db.collection("Categories").doc(categoryId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> createCategory(CategoryModel category) async {
    try {
      final data = await _db.collection("Categories").add(category.toJson());
      return data.id;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    try {
      // Tìm document có field 'id' = category.id
      final querySnapshot = await _db
          .collection("Categories")
          .where("id", isEqualTo: category.id) // Sử dụng 'id' như một field
          .limit(1) // Giới hạn tìm kiếm 1 document
          .get();

      // Kiểm tra xem có document nào phù hợp không
      if (querySnapshot.docs.isEmpty) {
        print("Document with field 'id' = ${category.id} not found");
        return;
      }

      // Lấy document từ querySnapshot
      final docRef = querySnapshot.docs.first.reference;

      // Cập nhật document
      await docRef.update(category.toJson());
      print("Category updated successfully!");

    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code}");
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      print("FormatException: Invalid data format.");
      throw const TFormatException();
    } on PlatformException catch (e) {
      print("📱 PlatformException: ${e.code}");
      throw TPlatformException(e.code).message;
    } catch (e) {
      print("Error: $e");
      throw 'Something went wrong. Please try again';
    }
  }

}
