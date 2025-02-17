import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../widgets/create_category_form.dart';

class CreateCategoriesDesktopScreen extends StatelessWidget {
  const CreateCategoriesDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbWithHeading(returnToPreviousScreen: true, heading: 'Create Categories', breadcrumbItems: [HptRoutes.categories, 'Create Categories']),
              SizedBox(height: TSizes.spaceBtwSections),

              CreateCategoryForm(),
            ],
          ),
        ),
      ),
    );
  }
}
