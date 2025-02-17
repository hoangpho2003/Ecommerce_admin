import 'package:ecommerce_admin/data/repositories/category/category_repository.dart';
import 'package:ecommerce_admin/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin/features/media/models/image_model.dart';
import 'package:ecommerce_admin/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_admin/features/shop/models/category_model.dart';
import 'package:ecommerce_admin/utils/helpers/network_manager.dart';
import 'package:ecommerce_admin/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_admin/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateCategoryController extends GetxController {
  static CreateCategoryController get instance => Get.find();

  final selectedParent = CategoryModel.empty().obs;
  final loading = false.obs;
  RxString imageURL = ''.obs;
  final isFeatured = false.obs;
  final name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final lengthId = CategoryController.instance.getLengthId();

  /// Init data
  /// Method to reset fields
  /// Pick Thumbnail image from media
  /// Register new category
  Future<void> createCategory() async {
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

      final newRecord = CategoryModel(
        id: lengthId.toString(),
        name: name.text.trim(),
        image: imageURL.value,
        isFeatured: isFeatured.value,
        createdAt: DateTime.now(),
        parentId: selectedParent.value.id,
      );

      newRecord.id = await CategoryRepository.instance.createCategory(newRecord);

      CategoryController.instance.addItemToLists(newRecord);

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
