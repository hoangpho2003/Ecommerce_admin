import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/models/brand_model.dart';
import 'package:ecommerce_admin/features/shop/screens/brand/edit_brands/responsive_screens/edit_brand_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/brand/edit_brands/responsive_screens/edit_brand_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/brand/edit_brands/responsive_screens/edit_brand_tablet.dart';
import 'package:flutter/material.dart';

class EditBrandScreen extends StatelessWidget {
  const EditBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = BrandModel(id: '', image: '', name: '');
    return TSiteTemplate(desktop: EditBrandDesktopScreen(brand: brand), tablet: EditBrandTabletScreen(brand: brand), mobile: EditBrandMobileScreen(brand: brand));
  }
}
