import 'package:ecommerce_admin/features/shop/screens/banner/create_banner/resposive_screens/create_banner_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/create_banner/resposive_screens/create_banner_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/create_banner/resposive_screens/create_banner_tablet.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/layouts/templates/site_layout.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: CreateBannerDesktopScreen(),
      tablet: CreateBannerTabletScreen(),
      mobile: CreateBannerMobileScreen(),
    );
  }
}
