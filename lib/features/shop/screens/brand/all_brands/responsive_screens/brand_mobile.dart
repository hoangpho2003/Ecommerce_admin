import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/data_table/table_header.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../widgets/table.dart';

class BrandMobileScreen extends StatelessWidget {
  const BrandMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbWithHeading(heading: 'Brands', breadcrumbItems: ['Brands']),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(buttonText: 'Create New Brand', onPressed: () => Get.toNamed(HptRoutes.createBrand)),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    const BrandTable(),
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
