import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../models/brand_model.dart';
import '../widgets/edit_brand_form.dart';

class EditBrandMobileScreen extends StatelessWidget {
  const EditBrandMobileScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbWithHeading(returnToPreviousScreen: true, heading: 'Update Brand', breadcrumbItems: [HptRoutes.categories, 'Update Brand']),
              const SizedBox(height: TSizes.spaceBtwSections),

              EditBrandForm(brand: brand),
            ],
          ),
        ),
      ),
    );
  }
}
