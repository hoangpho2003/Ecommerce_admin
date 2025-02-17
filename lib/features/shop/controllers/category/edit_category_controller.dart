import 'package:ecommerce_admin/data/repositories/category/category_repository.dart';
import 'package:ecommerce_admin/features/shop/controllers/category/category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../media/controllers/media_controller.dart';
import '../../../media/models/image_model.dart';
import '../../models/category_model.dart';

class EditCategoryController extends GetxController{
  static EditCategoryController get instance => Get.find();

  final selectedParent = CategoryModel.empty().obs;
  final loading = false.obs;
  RxString imageURL = ''.obs;
  final isFeatured = false.obs;
  final name = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void init(CategoryModel category){
    name.text = category.name;
    isFeatured.value = category.isFeatured;
    imageURL.value = category.image;
    if(category.parentId.isNotEmpty){
      selectedParent.value = CategoryController.instance.allItems.where((c) => c.id == category.parentId).single;
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    try {
      TFullScreenLoader.popUpCircular();
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      category.image = imageURL.value;
      category.name = name.text.trim();
      category.parentId = selectedParent.value.id;
      category.isFeatured = isFeatured.value;
      category.updatedAt = DateTime.now();

      print("Category before update: ${category.toJson()}");

      await CategoryRepository.instance.updateCategory(category);

      CategoryController.instance.updateItemFromLists(category);

      resetField();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Congratulations', message: 'New Category has been created.');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void pickImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      ImageModel selectedImage = selectedImages.first;
      imageURL.value = selectedImage.url;
    }
  }

  void resetField() {
    selectedParent(CategoryModel.empty());
    loading(false);
    isFeatured(false);
    name.clear();
    imageURL.value = '';
  }
}