import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../widgets/create_brand_form.dart';

class CreateBrandMobileScreen extends StatelessWidget {
  const CreateBrandMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbWithHeading(returnToPreviousScreen: true, heading: 'Create Brand', breadcrumbItems: [HptRoutes.categories, 'Create Brand']),
              SizedBox(height: TSizes.spaceBtwSections),

              CreateBrandForm(),
            ],
          ),
        ),
      ),
    );
  }
}
