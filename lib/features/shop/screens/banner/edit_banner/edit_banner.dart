import 'package:ecommerce_admin/features/shop/models/banner_model.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/edit_banner/responsive_screens/edit_banner_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/edit_banner/responsive_screens/edit_banner_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/banner/edit_banner/responsive_screens/edit_banner_tablet.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/layouts/templates/site_layout.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = BannerModel(imageUrl: '', targetScreen: '', active: false);
    return TSiteTemplate(
      desktop: EditBannerDesktopScreen (banner: banner),
      tablet: EditBannerTabletScreen (banner: banner),
      mobile: EditBannerMobileScreen (banner: banner),
    );
  }
}
