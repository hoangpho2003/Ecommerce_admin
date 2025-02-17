import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/all_banner/responsive_screens/banner_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/all_banner/responsive_screens/banner_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/all_banner/responsive_screens/banner_tablet.dart';
import 'package:flutter/material.dart';

class BannersScreen extends StatelessWidget {
  const BannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: BannerDesktopScreen(), tablet: BannerTabletScreen(), mobile: BannerMobileScreen());
  }
}
