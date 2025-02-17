import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/screens/category/create_category/responsive_screens/create_category_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/category/create_category/responsive_screens/create_category_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/category/create_category/responsive_screens/create_category_tablet.dart';
import 'package:flutter/material.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: CreateCategoriesDesktopScreen(), tablet: CreateCategoriesTabletScreen(), mobile: CreateCategoriesMobileScreen());
  }
}
