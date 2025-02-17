import 'package:ecommerce_admin/features/shop/models/banner_model.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/edit_banner/widgets/edit_banner_form.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';

class EditBannerTabletScreen extends StatelessWidget {
  const EditBannerTabletScreen({super.key, required this.banner});

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbWithHeading(returnToPreviousScreen: true, heading: 'Update Banner', breadcrumbItems: [HptRoutes.editBanner, 'Update Banner']),
              const SizedBox(height: TSizes.spaceBtwSections),

              EditBannerForm(banner: banner),
            ],
          ),
        ),
      ),
    );
  }
}
