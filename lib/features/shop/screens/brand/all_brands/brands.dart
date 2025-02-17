import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/screens/brand/all_brands/responsive_screens/brand_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/brand/all_brands/responsive_screens/brand_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/brand/all_brands/responsive_screens/brand_tablet.dart';
import 'package:flutter/material.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: BrandDesktopScreen(), tablet: BrandTabletScreen(), mobile: BrandMobileScreen());
  }
}
