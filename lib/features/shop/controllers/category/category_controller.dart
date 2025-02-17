import 'package:ecommerce_admin/data/repositories/category/category_repository.dart';
import 'package:ecommerce_admin/features/shop/models/category_model.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:ecommerce_admin/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_admin/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  RxBool isLoading = true.obs;
  RxList<CategoryModel> allItems = <CategoryModel>[].obs;
  RxList<CategoryModel> filteredItems = <CategoryModel>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;

  // Sorting
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;

  int lengthID = 0;

  final searchTextController = TextEditingController();

  final _categoryRepository = Get.put(CategoryRepository());

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      List<CategoryModel> fetchedItems = [];
      if (allItems.isEmpty) {
        fetchedItems = await _categoryRepository.getAllCategories();
        lengthID = fetchedItems.length;
      }
      allItems.assignAll(fetchedItems);
      filteredItems.assignAll(allItems);
      selectedRows.assignAll(List.generate(allItems.length, (_) => false));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  int getLengthId(){
    return lengthID;
  }

  void sortByName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredItems.sort((a, b) {
      if (ascending) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      }
    });
  }

  void sortByParentName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredItems.sort((a, b) {
      if (ascending) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      }
    });
  }

  searchQuery(String query) {
    filteredItems.assignAll(allItems.where((item) => item.name.toLowerCase().contains(query.toLowerCase())));
  }

  confirmAndDeleteItem(CategoryModel category) {
    Get.defaultDialog(
      title: 'Delete Item',
      content: const Text('Are you sure want to delete this item?'),
      confirm: SizedBox(
        width: 60,
        child: ElevatedButton(
          onPressed: () async => await deleteOnConfirm(category),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight / 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5)),
          ),
          child: const Text('Ok'),
        ),
      ),
      cancel: SizedBox(
        width: 80,
        child: ElevatedButton(
          onPressed: () => Get.back(),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight / 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5)),
          ),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  deleteOnConfirm(CategoryModel category) async {
    try {
      TFullScreenLoader.stopLoading();

      TFullScreenLoader.popUpCircular();

      await _categoryRepository.deleteCategory(category.id);

      removeItemFromLists(category);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Item Deleted', message: 'Your item has been deleted!');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void removeItemFromLists(CategoryModel item) {
    allItems.remove(item);
    filteredItems.remove(item);
    selectedRows.assignAll(List.generate(allItems.length, (item) => false));

    update();
  }

  void addItemToLists(CategoryModel newRecord) {
    allItems.add(newRecord);
    filteredItems.add(newRecord);
    selectedRows.assignAll(List.generate(allItems.length, (index) => false));

    allItems.refresh();
  }

  void updateItemFromLists(CategoryModel item) {
    final itemIndex = allItems.indexWhere((i) => i == item);
    final filteredItemIndex = filteredItems.indexWhere((i) => i == item);

    if (itemIndex != -1) allItems[itemIndex] = item;
    if (filteredItemIndex != -1) filteredItems[itemIndex] = item;

    filteredItems.refresh();
  }
}
