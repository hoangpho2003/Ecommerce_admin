import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/data_table/table_header.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../widgets/table.dart';

class BannerMobileScreen extends StatelessWidget {
  const BannerMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbWithHeading(heading: 'Banners', breadcrumbItems: ['Banners']),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(buttonText: 'Create New Banner', onPressed: () => Get.toNamed(HptRoutes.createBanner)),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    const BannersTable(),
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
