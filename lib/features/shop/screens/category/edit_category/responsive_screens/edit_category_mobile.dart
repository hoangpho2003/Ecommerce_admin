import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/features/shop/models/category_model.dart';
import 'package:ecommerce_admin/features/shop/screens/category/edit_category/widgets/edit_category_form.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EditCategoriesTabletScreen extends StatelessWidget {
  const EditCategoriesTabletScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbWithHeading(heading: 'Update Category', breadcrumbItems: [HptRoutes.categories, 'Update Category']),
              const SizedBox(height: TSizes.spaceBtwSections),
              EditCategoryForm(category: categoryModel),
            ],
          ),
        ),
      ),
    );
  }
}
