import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/screens/category/edit_category/responsive_screens/edit_category_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/category/edit_category/responsive_screens/edit_category_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/category/edit_category/responsive_screens/edit_category_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Get.arguments;
    return TSiteTemplate(desktop: EditCategoriesDesktopScreen(categoryModel: category), tablet: EditCategoriesTabletScreen(categoryModel: category), mobile: EditCategoriesMobileScreen(categoryModel: category));
  }
}
