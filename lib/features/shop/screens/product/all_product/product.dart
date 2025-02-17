import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/screens/product/all_product/responsive_screens/product_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/product/all_product/responsive_screens/product_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/product/all_product/responsive_screens/product_tablet.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: ProductDesktopScreen(), tablet: ProductTabletScreen(), mobile: ProductMobileScreen());
  }
}
