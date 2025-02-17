import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/common/widgets/loaders/loader_animation.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/widgets/data_table/table_header.dart';
import 'package:get/get.dart';

import '../../../../controllers/category/category_controller.dart';
import '../widgets/table.dart';

class CategoriesDesktopScreen extends StatelessWidget {
  const CategoriesDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbWithHeading(heading: 'Categories', breadcrumbItems: ['Categories']),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(
                      buttonText: 'Create New Category',
                      onPressed: () => Get.toNamed(HptRoutes.createCategory),
                      searchController: controller.searchTextController,
                      searchOnChanged: (query) => controller.searchQuery(query),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(() {
                      if (controller.isLoading.value) return const TLoaderAnimation();
                      return const CategoryTable();
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
